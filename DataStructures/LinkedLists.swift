//
//  Stacks.swift
//  DataStructures
//
//  Created by David Avendaño on 07/02/22.
//

import Foundation

// Linked Lists

/*
 A linked list is a sequential structure that consists of a sequence
 of items in linear order which are linked to each other. Hence, you
 have to access data sequentially and random access is not possible.
 Linked lists provide a simple and flexible representation of dynamic sets.
 
 - Elements in a linked list are known as nodes.
 
 - Each node contains a key and a pointer to its successor node, known as next.
 
 - The attribute named head points to the first element of the linked list.
 
 - The last element of the linked list is known as the tail.
 
 ________      ______________      ______________      ______________
 | head | ---> | key | next | ---> | key | next | ---> | key | next | ---> NULL
 --------      --------------  |   --------------      --------------
    |          |------------|  |                       |------------|
   head             Node      Next                          Tail
                            pointer
 */

/*
 Following are the various types of linked lists available.
 
 Singly linked list — Traversal of items can be done in the forward direction only.
 
 Doubly linked list — Traversal of items can be done in both forward and backward directions.
 Nodes consist of an additional pointer known as prev, pointing to the previous node.
 
 Circular linked lists — Linked lists where the prev pointer of the head points to
 the tail and the next pointer of the tail points to the head.
 
 Linked list operations
 
 Search: Find the first element with the key k in the given linked list by a simple linear
 search and returns a pointer to this element.
 
 Insert: Insert a key to the linked list. An insertion can be done in 3 different ways; insert
 at the beginning of the list, insert at the end of the list and insert in the middle of the list.
 
 Delete: Removes an element x from a given linked list. You cannot delete a node by a single step.
 A deletion can be done in 3 different ways; delete from the beginning of the list, delete from the
 end of the list and delete from the middle of the list.
 
 Applications of linked lists
 
 Used for symbol table management in compiler design.
 
 Used in switching between programs using Alt + Tab (implemented using Circular Linked List).
 */

// Creating the node class
public class Node<T> {
    // Declaring the value of the node
    var value: T
    // Initializing the value since it is not an optional
    init(value: T) {
        self.value = value
    }
    // Declaring the next node as an optional
    var next: Node<T>?
    // Declaring the previous node as an optional too
    weak var previous: Node<T>?
    /*
     Note: To avoid ownership cycles, we declare the previous pointer to be weak.
     If you have a node A that is followed by node B in the list, then A points to B
     but also B points to A. In certain circumstances, this ownership cycle can cause
     nodes to be kept alive even after you deleted them. We don’t want that, so we make
     one of the pointers weak to break the cycle.
     */
}

// Creating the linked list
public class LinkedList<T> {
    // Declaring head, which is a reference to the first node
    fileprivate var head: Node<T>?
    // The tail node is a special node, where the next pointer
    // is always pointing or linking to a null reference, indicating the end of the list.
    private var tail: Node<T>?
    
    // In case the list is empty set the head to nil
    public var isEmpty: Bool{
        return head == nil
    }
    
    // In case the first node exists return head
    public var first: Node<T>?{
        return head
    }
    
    // In case a last node exists return tail
    /*
     1

     If there is only one element in a linked List, then the Head Should point to the
     starting address of the First Element (the only element in your case) & the tail
     should point to the starting address of the last element (in your case the first
     elements itself).

     The tail should not point to NULL, rather the next part of the element should point
     to NULL indicating that it is a last element & the tail should actually point to the
     start address of the last element.
     */
    public var last: Node<T>? {
        return tail
    }
    
    // Adding a new node to the linked list
    public func append(value: T){
        // Creating a new node to contain the value
        let newNode = Node(value: value)
       
        // If the list already has an element:
        if let tailNode = tail{
            // Move the previous tail back and make the new node the tail.
            newNode.previous = tailNode
            tailNode.next = newNode
        }
       
        // If the list didn't have any elements then return the node as the head
        else{
            head = newNode
        }
        
        // Set the tail of the list to be the new item in either case
        tail = newNode
    }
    
    // Look for a node with an index
    public func nodeAt(index: Int) -> Node<T>?{
        // Check if the given index is not negative:
        if index >= 0{
            // Start in the first position of the list
            var node = head
            // Index
            var i = index
            // If the node we are looking is not nil then:
            while node != nil{
                // In case it is the first node, return it
                if i == 0{
                    return node
                }
                // Else keep looping through the nodes
                i -= 1
                // Return the node
                node =  node!.next
            }
        }
        // If the index is less than 0 or greater than the number of items
        // in the list then return nil
        return nil
    }
    
    // Remove all the nodes by assigning nil to the head and tail
    public func removeAll(){
        head = nil
        tail = nil
    }
    
    // Removing individual nodes
    public func remove(node: Node<T>) -> T {
        // Identify the previous node
        let prev = node.previous
        // Identify the next node
        let next = node.next
        
        // Update the next pointer if you are not
        // removing the first node in the list
        if let prev = prev{
            prev.next = next
        } else {
        // Update the head pointer if you are
        // removing the first node in the list
            head = next
        }
        
        // Update the previous pointer to the previous pointer
        // of the deleted node
        next?.previous = prev
        
        // Update the tail if you are removing the last element in the list
        if next == nil{
            tail = prev
        }
        
        // Assign nil to the removed nodes previous and next pointers
        node.previous = nil
        node.next = nil
        
        // Return the removed node
        return node.value
    }
}

// Writing an extension to be able to print the node value
extension LinkedList: CustomStringConvertible{
    public var description: String{
        var text = "["
        var node = head
        
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil{
                text += " --> "
            }
        }
        return text + "]"
    }
}

func performLinkedLists(){
    let dogBreeds = LinkedList<String>()
    dogBreeds.append(value: "Labrador")
    dogBreeds.append(value: "Bulldog")
    dogBreeds.append(value: "Beagle")
    dogBreeds.append(value: "Husky")
    
    print(dogBreeds)
    
    print(dogBreeds.nodeAt(index: 2)?.value ?? "")
    
//    dogBreeds.removeAll()
    
    print(dogBreeds)
    
    let removedNodeVal = dogBreeds.remove(node: dogBreeds.nodeAt(index: 3)!)
    
    print(removedNodeVal)
    print(dogBreeds)
}
