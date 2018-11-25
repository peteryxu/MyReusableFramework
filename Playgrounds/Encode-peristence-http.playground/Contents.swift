import UIKit
import MyReusableFramework

/*:
 ## Encoding and Decoding Property list aka plist.
 
 https://blog.solutelabs.com/encoding-and-decoding-property-list-aka-plist-6c91407a8fc8
 
 Suppose you have some valuable API keys in your project that you wish to save in a plist.
 */

//Test Encode/Decode of Models  and Persistence of Models to JSON, XML and binary...


//JSONSerialization
func serialize(prices: Any...) {
    let data = try! JSONSerialization.data(withJSONObject: ["value": prices], options: [])
    let string = String(data: data, encoding: .utf8)!
    print(string)
}
serialize(prices: Decimal(125.99).roundedCurrency, Decimal(16.42).roundedCurrency, Decimal(88.56).roundedCurrency, Decimal(88.57).roundedCurrency, (Decimal(0.1) + Decimal(0.2)).roundedCurrency)


// Codable  based on JSONSerilization
//let transaction = Transaction2(amount: 12.12, description: "fun", date: Date(), category: TransactionCategory.fun)

let transaction = Transaction2(amount: Decimal(125.9904).roundedCurrency, description: "fun", date: Date(), category: TransactionCategory.groceries)
let transDataJson = try ModelEncodeUtils.encodeModelAsJson(model: transaction)
print(transDataJson)
let transDataPlistXML = try ModelEncodeUtils.encodeModelAsPlistXML(model: transaction)
print(transDataPlistXML)



let person = Person(name: "devpreneur", gender: "male", age: 99, profilePictures: ["SO profile picture": "https://i.stack.imgur.com/Pz3pC.jpg"])
let personDataJson = try ModelEncodeUtils.encodeModelAsJson(model: person)
print(personDataJson)
let personDataPlistXML = try ModelEncodeUtils.encodeModelAsPlistXML(model: person)
print(personDataPlistXML)
FileStorageManager.getDocumentsDirectory()
FileStorageManager.save("person.json", personDataJson)



//: Create an array of all your API keys that you want to store.
let mykey1 = MyKey(keyName: "facebookAPIKey", keyValue: "ValueOfMyFacebookAPIKey", type: .facebook)
let mykey2 = MyKey(keyName: "twitterAPIKey", keyValue: "ValueOfMyTwitterAPIKey", type: .twitter)
let myKeys = [mykey1, mykey2]
let myKeysDataPlistXML = try ModelEncodeUtils.encodeModelAsPlistXML(model: myKeys)
print(myKeysDataPlistXML)
print(FileManager.documentDirectoryURL)
FilePlistXMLManager.savePlist("MyPlistFolder", "myAPIKeys2", myKeysDataPlistXML)


//UserDefaults Storage
print(UserDefaults.standard.dictionaryRepresentation())
print(NSHomeDirectory())


//CoreData

//Network HTTP
let responseString = HTTPDirectManager.queryTest(address: "http://127.0.0.1:3000/transactions")
let responseData = HTTPDirectManager.query(address: "http://127.0.0.1:3000/transactions")

//: [Previous](@previous) | [Next](@next)
