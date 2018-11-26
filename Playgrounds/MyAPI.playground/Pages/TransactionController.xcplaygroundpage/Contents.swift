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
 #### response:
 */

//let getTransactionsResponseString = HTTPDirectManager.queryTest(address: "http://127.0.0.1:3000/transactions")
let getTransactionsResponseData = HTTPDirectManager.query(address: "http://127.0.0.1:3000/transactions")
let transactions = ModelEncodeUtils.getJsonDecoder().decode([Transaction].self, from: getTransactionsResponseData)

/*:
 ## Account full lifecycle test:  POST, GET, PATCH, GET, DELETE
 ### POST: create a new account
 #### endpoint: http://127.0.0.1:3000/transactions
 #### request: {"name": "acctX", "bank": "bank1" }
 #### response: {"name": "acctX", "bank": "bank1", "id": 15}
 */

/*let trans2 = Transaction2(name: "acctX", bank: "bank1")
 let requestData = ModelEncodeUtils.encodeModelAsJson(model: trans2)
 let responseData = HTTPDirectManager.post(address: "http://127.0.0.1:3000/transactions", body: requestData)
 let createdTrans = ModelEncodeUtils.getJsonDecoder().decode(Account.self, from: responseData)
 let createdTransId = createdTrans.Id
 print(createdTransId)*/

/*:
 ### GET:  the newly created transaction
 #### endpoint: http://localhost:3000/transactions/15
 #### request:  none
 #### response:
 
 */
let getTransactionResponseString = HTTPDirectManager.queryTest(address: "http://127.0.0.1:3000/transactions/16")
let getTransactionResponseData = HTTPDirectManager.query(address: "http://127.0.0.1:3000/transactions/16")
let transaction = ModelEncodeUtils.getJsonDecoder().decode(Transaction.self, from: getTransactionResponseData)

/*:
 ### PATCH:  the newly created account
 #### endpoint: http://localhost:3000/transactions/15
 #### request:  {"name": "acct15"}
 #### response: none (Account PATCH success)
 */
let patchTransData = "{\"name\":\"acct1616\"}".data(using: .utf8)!
let patchTransStatus = HTTPDirectManager.patch(address: "http://127.0.0.1:3000/transactions/16", body: patchTransData)

/*:
 ### DELETE:  the newly created account
 #### endpoint: http://localhost:3000/transactions/15
 #### request:  none
 #### response: none (Account DELETE success)
 */

let deleteTransactionStatus = HTTPDirectManager.delete(address: "http://127.0.0.1:3000/transactions/16")

/*:
 more to come
 */






/*:
 If the JSON array contains even one element
 */
//: [Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)

