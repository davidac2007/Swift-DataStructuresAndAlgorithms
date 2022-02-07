//
//  Arrays.swift
//  DataStructures
//
//  Created by David Avendaño on 07/02/22.
//

import Foundation

func performArrays(){
    
    // ARRAYS
    
    /*
        An array is a structure of fixed-size, which can hold items ofthe same data type. It can be an array of integers, an array of floating-point numbers, an array of strings or even an array of arrays (aka as 2-dimensional arrays). Arrays are indexed, meaning that random access is possible.
     */
    
    // Create an array
    
    var numbers: [Int] =  [2,4,6,7,8,9]
    print("Array: \(numbers)")
    
    // Create an empty array
    
    let emptyArray = [Int]()
    print(emptyArray)
    
    // Access array elements
    
    let languages = ["Swift", "Java", "C++"]
    
    //Access element at index 0
    print(languages[0])
    
    // Access element at index 2
    print(languages[2])
    
    // Addding elements to the array
    numbers.append(32)
    print("After append: \(numbers)")
    
    // Adding elements from one array
    var primeNumbers = [2,3,5]
    print("Array1: \(primeNumbers)")
    
    let evenNumbers = [4,6,8]
    
    primeNumbers.append(contentsOf: evenNumbers)
    
    print("Array after append: \(primeNumbers)")
    
    // Inserting elements at a specified position of an array
    
    print("Before insert: \(numbers)")
    
    numbers.insert(32, at: 1)
    
    print("After insert: \(numbers)")
    
    // Modify elements of an array
    
    var dailyActivities = ["Eat","Repeat"]
    
    print("Initial array: \(dailyActivities)")
    
    // Change element at index 1
    dailyActivities[1] = "Sleep"
    
    print("Updated array: \(dailyActivities)")
    
    // Remove an element from an Array
    
    var moreLanguages = ["Swift", "Java", "Python"]
    
    print("Initial array: \(moreLanguages)")
    
    // Remove element at 1
    
    moreLanguages.remove(at: 1)
    
    print("Updated array: \(moreLanguages)")
    
    /*
     Similarly, we can also use:
     
     removeFirst() - to remove the first element
     ---------------------------------------------
     removeLast() - to remove the last element
     -------------------------------------------------
     removeAll() - to remove all elements of an array
     
     */
    
    // Other Array Methods
    
    /*
     Method      |   Description
     ------------|---------------------------------------------
     sort()      |   sorts array elements
     shuffle()   |   changes the order of array elements
     forEach()   |   calls a function for each element
     contains()  |   searches for the element in an array
     swapAt()    |   exchanges the position of array elements
     reverse()   |   reverses the order of array elements
     */
    
    // Looping through an array
    
    let fruits = ["Apple", "Peach", "Mango"]
    
    // Iterate over array
    for fruit in fruits {
        print(fruit)
    }
    
    // Find Number of Array Elements
    
    let someNumbers = [2,4,6,8]
    print("Array: \(someNumbers)")
    
    print("Total Elemets: \(someNumbers.count)")
    
    // Check if array is empty
    
    let isArrayEmpty = emptyArray.isEmpty
    
    print("Is the array empty? | \(isArrayEmpty)")
    
    // Array With Mixed Data Types
    
    let address: [Any] = ["Scranton", 570]
    
    print(address)
}
