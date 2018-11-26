/*:
 [Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
 ****
 # Transaction Controller
 */


import MyReusableFramework

/*:
 ## GET: Number of Transactions
 #### endpoiint: http://127.0.0.1:3000/transactions/count
 #### response: {"count": 7}
 */

let getCountResponseString = HTTPDirectManager.queryTest(address: "http://127.0.0.1:3000/transactions/count")

/*:
 ## GET: List of Transactions
 #### endpoint:  http://localhost:3000/transactions
 #### response: [{"id":1,"amount":1200.12,"description":"monthly paycheck for September","date":"2018-11-15T02:41:19.000Z","category":"income"},{"id":2,"amount":500.3,"description":"monthly for Oct","date":"2018-11-15T04:06:37.000Z","category":"income","accountId":1},{"id":3,"amount":23.23,"description":"fun","date":"2018-11-18T01:50:26.784Z","category":"fun","accountId":1},{"id":4,"amount":14.56,"description":"fun stuff","date":"2018-11-18T01:53:04.157Z","category":"fun"},{"id":5,"amount":11.11,"description":"string11","date":"2018-11-18T02:10:34.753Z","category":"fun","accountId":1},{"id":6,"amount":23.23,"description":"power","date":"2018-11-18T02:44:38.641Z","category":"fun","accountId":0},{"id":7,"amount":23.670000076293945,"description":"rrrr","date":"2018-11-18T03:49:58.000Z","category":"utilities","accountId":0}
 */

//let getTransactionsResponseString = HTTPDirectManager.queryTest(address: "http://127.0.0.1:3000/transactions")
let getTransactionsResponseData = HTTPDirectManager.query(address: "http://127.0.0.1:3000/transactions")
let transactions = ModelEncodeUtils.getJsonDecoder().decode([Transaction].self, from: getTransactionsResponseData)

/*:
 ## GET: List of Transactions by Account ID
 #### endpoint:  http://127.0.0.1:3000/accounts/1/transactions
 #### response:
 */

//let getTransactionsByAcctResponseString = HTTPDirectManager.queryTest(address: "http://127.0.0.1:3000/accounts/1/transactions")
let getTransactionsByAcctResponseData = HTTPDirectManager.query(address: "http://127.0.0.1:3000/accounts/1/transactions")
let transactionsByAcct = ModelEncodeUtils.getJsonDecoder().decode([Transaction].self, from: getTransactionsByAcctResponseData)


/*:
 ## Transaction full lifecycle test:  POST, GET, PATCH, GET, DELETE
 ### POST: create a new transaction using TransactionController:  Need a new Transaction3 struct, which include accountId in initializer1
 #### endpoint: http://127.0.0.1:3000/transactions
 #### request: {
 "amount": 23.23,
 "description": "spent in Disney",
 "date": "2018-11-26T22:03:02.730Z",
 "category": "fun",
 "accountId": 3
 }
 #### response: {
 "id": 13,
 "amount": 23.23,
 "description": "spent in Disney",
 "date": "2018-11-26T22:03:02.730Z",
 "category": "fun",
 "accountId": 3
 }
 */

/*let trans1 = Transaction2(amount: <#T##Decimal#>, description: <#T##String#>, date: <#T##Date#>, category: <#T##TransactionCategory#>)
 let requestData = ModelEncodeUtils.encodeModelAsJson(model: trans1)
 let responseData = HTTPDirectManager.post(address: "http://127.0.0.1:3000/transactions", body: requestData)
 let createdTrans = ModelEncodeUtils.getJsonDecoder().decode(Transaction.self, from: responseData)
 let createdTransId = createdTrans.Id
 print(createdTransId) */

/*
 ### POST: create a new transaction using a different way:  AccountTransactionControler
 #### endpoint: http://127.0.0.1:3000/accounts/3/transactions
 #### request: {
 "amount": 21.21,
 "description": "Using AccountTransaction Controller",
 "date": "2018-11-26T22:19:28.093Z",
 "category": "fun"
 }
 #### response: {
 "id": 14,
 "amount": 21.21,
 "description": "Using AccountTransaction Controller",
 "date": "2018-11-26T22:19:28.093Z",
 "category": "fun",
 "accountId": 3
 }
 */

/*let trans2 = Transaction2(amount: Decimal(125.99).roundedCurrency, description: "I love spending", date: Date(), category: .home)
let requestData = ModelEncodeUtils.encodeModelAsJson(model: trans2)
let responseData = HTTPDirectManager.post(address: "http://127.0.0.1:3000/accounts/3/transactions", body: requestData)
let createdTrans = ModelEncodeUtils.getJsonDecoder().decode(Transaction.self, from: responseData)
//let createdTransId = createdTrans
print(createdTrans) */


/*:
 ### GET:  the newly created transaction
 #### endpoint: http://localhost:3000/transactions/15
 #### request:  none
 #### response:
 
 */
let getTransactionResponseString = HTTPDirectManager.queryTest(address: "http://127.0.0.1:3000/transactions/14")
let getTransactionResponseData = HTTPDirectManager.query(address: "http://127.0.0.1:3000/transactions/14")
let transaction = ModelEncodeUtils.getJsonDecoder().decode(Transaction.self, from: getTransactionResponseData)

/*:
 ### PATCH:  the newly created account
 #### endpoint: http://localhost:3000/transactions/15
 #### request:  {"name": "acct15"}
 #### response: none (Account PATCH success)
 */
let patchTransData = "{\"amount\":23.23,\"description\":\"I love saving\"}".data(using: .utf8)!
let patchTransStatus = HTTPDirectManager.patch(address: "http://127.0.0.1:3000/transactions/15", body: patchTransData)

/*:
 ### DELETE:  the newly created account
 #### endpoint: http://localhost:3000/transactions/15
 #### request:  none
 #### response: none (Account DELETE success)
 */

let deleteTransactionStatus = HTTPDirectManager.delete(address: "http://127.0.0.1:3000/transactions/15")

/*:
 more to come
 */






/*:
 If the JSON array contains even one element
 */
//: [Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)

