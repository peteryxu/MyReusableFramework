/*:
 [Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
 ****
 # Account Controller
 There are seven APIs you can use and test
 ![APIs](AccountController.jpg "Account Controller")
 */


/*
 GET
 http://127.0.0.1:3000/accounts/count
 {
 "count": 7
 }
 
 GET
 http://localhost:3000/accounts
 [{"name":"account1","bank":"bank1","id":1},{"name":"account2","bank":"bank1","id":2},{"name":"acct3","bank":"bank1","id":3},{"name":"acct4","bank":"bank1","id":4},{"name":"Acct5","bank":"Bank1","id":5},{"name":"Acct6","bank":"Bank1","id":6},{"name":"acctX","bank":"bank1","id":14}]
 
 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 POST
 "http://127.0.0.1:3000/accounts"
 {
 "name": "acctX",
 "bank": "bank1"
 }
 
 {
 "name": "acctX",
 "bank": "bank1",
 "id": 15
 }
 
 GET
 http://localhost:3000/account/15
 
 PATCH
 http://127.0.0.1:3000/accounts/15
 {
 "name": "acct15"
 
 }
 Account PATCH success
 
 GET
 http://localhost:3000/account/15
 
 DELETE
 http://127.0.0.1:3000/accounts/15
 Account DELETE success
 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 
 GET
 http://localhost:3000/accounts
 
 GET
 http://127.0.0.1:3000/accounts/count
 {
 "count": 7
 }
 
 */








/*:
 If the JSON array contains even one element
 */
//: [Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
