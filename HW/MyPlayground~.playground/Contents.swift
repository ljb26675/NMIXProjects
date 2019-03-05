import UIKit

/*var str = "Hello, playground"
let constant = 10
var y = 10
var x = y + constant*/

//declaring ints and doubles
/*let constant: Int = 10
var number: Int = 10
var result: Int = number + constant
var number2: Double = 10.5*/

//declare a string
var message = "The best way to get started is to stop talking and code."

//concat strings
var greeting = "Hello "
var name = "Simon"
var message2 = greeting + name

message.uppercased()

message2.lowercased()

message.count

var bookPrice = 39
var numOfCopies = 5
var totalPrice = bookPrice * numOfCopies
var totalPriceMessage = "The price of the book is $" + String(totalPrice)
//or
var totalPriceM = "The price of the book is $\(totalPrice)"

//if statements
var timeYouWakeUp = 6

if timeYouWakeUp == 6 {
    print("Cook yourself a big breakfast!")
} else {
    print("Go out for breakfast")
}

//switch statements or if else statements
var bonus = 5000

if bonus >= 10000 {
    print("I will travel to Paris and London!")
} else if bonus >= 5000 && bonus < 10000 {
    print("I will travel to Tokyo")
} else if bonus >= 1000 && bonus < 5000 {
    print("I will travel to Bangkok")
} else {
    print("Just stay home.")
}

switch bonus{
case 10000...:
    print("This switch says i will travel to Paris")
case 5000...9999:
    print("Switch says i will travel to tokyo")
case 1000...4999:
    print("Switch says ill travel to bangkok")
default:
    print("Switch just stay home")
}

var bookCollection = ["Tool of Titans", "Rework", "Your Move"]

print("my favorite book is " + bookCollection[0])

bookCollection.count

bookCollection.append("Authority")

bookCollection.count

//for loops
for index in 0...bookCollection.count-1{
    print(bookCollection[index])
}

// for each loop
for book in bookCollection{
    print(book)
}

var bookCollectionDict = ["1324": "Tool of Titans", "1256": "Rework", "1678": "Authority"]

for(key, value) in bookCollectionDict{
    print("ISBN: \(key)")
    print("Title: \(value)")
}

//control-command-space to type emoji
var emojiDict: [String: String] = ["👻": "Ghost",
                                   "💩": "Poop",
                                   "😤": "Angry",
                                   "😱": "Scream",
                                   "👾": "Alien moster"]
var wordToLookup = "👻"
var meaning = emojiDict[wordToLookup]

if let meaning = meaning{
    print(meaning)
}


//optionals
var jobTitle: String?

jobTitle = "iOS Developer"

if let jobTitleWithValue = jobTitle {
    var message3 = "Your job title is: " + jobTitleWithValue
}

let containerView = UIView(frame: CGRect(x: 0, y:0, width: 300, height: 300))
containerView.backgroundColor = UIColor.orange

let emojiLabel = UILabel(frame: CGRect(x: 95, y: 20, width: 150, height: 150))
emojiLabel.text = wordToLookup
emojiLabel.font = UIFont.systemFont(ofSize: 100.0)

containerView.addSubview(emojiLabel)
