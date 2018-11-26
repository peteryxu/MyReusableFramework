/*:
 [Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
 ****
 # Account Controller
 There are seven APIs you can use and test
 ![APIs](AccountController.jpg "Account Controller")
 */

import MyReusableFramework

/*:
 ## GET: Number of Accounts
 #### endpoiint: http://127.0.0.1:3000/accounts/count
 #### response: {"count": 7}
*/

let getCountResponseString = HTTPDirectManager.queryTest(address: "http://127.0.0.1:3000/accounts/count")

/*:
 ## GET: List of Accounts
 #### endpoint:  http://localhost:3000/accounts
 #### response: [{"name":"account1","bank":"bank1","id":1},{"name":"account2","bank":"bank1","id":2},{"name":"acct3","bank":"bank1","id":3},{"name":"acct4","bank":"bank1","id":4},{"name":"Acct5","bank":"Bank1","id":5},{"name":"Acct6","bank":"Bank1","id":6},{"name":"acctX","bank":"bank1","id":14}]
 */

//let getAccountsResponseString = HTTPDirectManager.queryTest(address: "http://127.0.0.1:3000/accounts")
let getAccountsResponseData = HTTPDirectManager.query(address: "http://127.0.0.1:3000/accounts")
let accounts = ModelEncodeUtils.getJsonDecoder().decode([Account].self, from: getAccountsResponseData)

/*:
 ## Account full lifecycle test:  POST, GET, PATCH, GET, DELETE
 ### POST: create a new account
 #### endpoint: http://127.0.0.1:3000/accounts
 #### request: {"name": "acctX", "bank": "bank1" }
 #### response: {"name": "acctX", "bank": "bank1", "id": 15}
 */

/*let acct2 = Account2(name: "acctX", bank: "bank1")
let requestData = ModelEncodeUtils.encodeModelAsJson(model: acct2)
let responseData = HTTPDirectManager.post(address: "http://127.0.0.1:3000/accounts", body: requestData)
let createdAcct = ModelEncodeUtils.getJsonDecoder().decode(Account.self, from: responseData)
let createdAcctNumber = createdAcct.number
print(createdAcctNumber)*/

/*:
 ### GET:  the newly created account
 #### endpoint: http://localhost:3000/account/15
 #### request:  none
 #### response:
 
 */
let getAccountResponseString = HTTPDirectManager.queryTest(address: "http://127.0.0.1:3000/accounts/16")
let getAccountResponseData = HTTPDirectManager.query(address: "http://127.0.0.1:3000/accounts/16")
let account = ModelEncodeUtils.getJsonDecoder().decode(Account.self, from: getAccountResponseData)

/*:
 ### PATCH:  the newly created account
 #### endpoint: http://localhost:3000/account/15
 #### request:  {"name": "acct15"}
 #### response: none (Account PATCH success)
 */
let patchAccountData = "{\"name\":\"acct1616\"}".data(using: .utf8)!
let patchAccountStatus = HTTPDirectManager.patch(address: "http://127.0.0.1:3000/accounts/16", body: patchAccountData)

/*:
 ### DELETE:  the newly created account
 #### endpoint: http://localhost:3000/account/15
 #### request:  none
 #### response: none (Account DELETE success)
 */

let deleteAccountStatus = HTTPDirectManager.delete(address: "http://127.0.0.1:3000/accounts/16")

/*:
 more to come
 */

//: [Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
