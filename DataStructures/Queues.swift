//
//  Queues.swift
//  DataStructures
//
//  Created by David Avendaño on 08/02/22.
//

import Foundation

// Queues

/*
 A queue is a FIFO (First In First Out — the element placed at first can be accessed at first) structure which can be commonly found in many programming languages. This structure is named as “queue” because it resembles a real-world queue — people waiting in a queue.
 
 Queue operations
 
 Enqueue: Insert an element to the end of the queue
 Dequeue: Delete the element from the beginning of the queue.
 Peek: Return the element at the front of the queue without removing it
 
 Applications of queues
 
 - Used to manage threads in multithreading.
 - Used to implement queuing systems (e.g.: priority queues).
 */

struct Queue{
    var items: [String] = []
    
    // Adding a new element at the end of the queue
    mutating func enqueue(element: String){
        items.append(element)
        print("Added: \(element)")
    }
    
    
    // Remove the element at the beginning of the queue
    mutating func dequeue() -> String? {
        if items.isEmpty{
            return nil
        }
        else {
            let tempElement = items.first
            items.removeFirst()
            print("Removed: \(tempElement ?? "")")
            return tempElement
        }
    }
    
    
    // Return the first element without removing it
    func peek() -> String? {
        if items.isEmpty{
            return nil
            
        }
        else{
            return items.first
        }
    }
    
}

func performQueues(){
    var queue = Queue()
    queue.enqueue(element: "1")
    queue.enqueue(element: "2")
    queue.enqueue(element: "3")
    print(queue.peek() ?? "")
    print(queue)
    print(queue.dequeue() ?? "")
}
