//
//  Stacks.swift
//  DataStructures
//
//  Created by David Avendaño on 08/02/22.
//

import Foundation

// Stacks

/*
 Stacks are likle array but with limited functionality. You can only push to add a new
 element to the top of the stack, pop to remove the element from the top, and peek at
 the top element without popping it off.
 
 In many algorithms, you want to add objects to a temporary list at some point and then pull them off this list again at a later time. Often, the order in which you add and remove these objects matter.
 
 A stack gives you a LIFO or last-in first-out order. The element you pushed last is the first one to come off with the next pop. (A very similar data structure, the queue is FIFO, or first-in first-out.)
 */

// Stack operations

/*
 Push
 
 Adding an element onto the stack.
 
 Peek
 
 This method allows you to check what's on the top of your stack.
 
 Pop
 When you want to remove an element in the stack, you pop an element off the stack.
 */

// Declaring stack with an array property
struct Stack{
    private var array: [String] = []
    
    //    The mutating keyword lets callers know that the method is going to make the value change.
    
    // Push method
    // Add the given element to the top of the stack
    mutating func push(_ element: String) {
        array.append(element)
        print("Pushed: \(element)")
    }
    
    // Pop
    // Remove and return the last/top element
    mutating func pop() -> String? {
        return array.popLast()
    }
    
    // Peek
    // Check the top element of the stack
    func peek() -> String? {
        return array.last
    }
    
}

var rwBookStack = Stack()

func performStacks(){
    rwBookStack.push("3D Games by tutorials")
    rwBookStack.push("The Bible")
    rwBookStack.push("The Hunger Games")
    
    print("Peeked: \(rwBookStack.peek() ?? "None")")
    
    print("Popped: \(rwBookStack.pop() ?? "None")")
    
    print("Popped: \(rwBookStack.pop() ?? "None")")
    
    print("Popped: \(rwBookStack.pop() ?? "None")")
    
    print("Popped: \(rwBookStack.pop() ?? "None")")
}




