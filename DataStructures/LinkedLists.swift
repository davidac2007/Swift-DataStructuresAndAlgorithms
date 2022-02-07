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
 
 Doubly linked list — Traversal of items can be done in both forward and backward directions. Nodes consist of an additional pointer known as prev, pointing to the previous node.
 
 Circular linked lists — Linked lists where the prev pointer of the head points to the tail and the next pointer of the tail points to the head.
 
 Linked list operations
 
 Search: Find the first element with the key k in the given linked list by a simple linear search and returns a pointer to this element
 
 Insert: Insert a key to the linked list. An insertion can be done in 3 different ways; insert at the beginning of the list, insert at the end of the list and insert in the middle of the list.
 
 Delete: Removes an element x from a given linked list. You cannot delete a node by a single step. A deletion can be done in 3 different ways; delete from the beginning of the list, delete from the end of the list and delete from the middle of the list.
 
 Applications of linked lists
 
 Used for symbol table management in compiler design.
 
 Used in switching between programs using Alt + Tab (implemented using Circular Linked List).
 */

// Creating the note
public class Node<T> {
    var value: T
    init(value: T) {
        self.value = value
    }
    var next: Node<T>?
    weak var previous: Node<T>?
    /*
     Note: To avoid ownership cycles, we declare the previous pointer to be weak. If you have a node A that is followed by node B in the list, then A points to B but also B points to A. In certain circumstances, this ownership cycle can cause nodes to be kept alive even after you deleted them. We don’t want that, so we make one of the pointers weak to break the cycle.
     */
}

public class LinkedList<T> {
    fileprivate var head: Node<T>?
    private var tail: Node<T>?
    
    public var isEmpty: Bool{
        return head == nil
    }
    
    public var first: Node<T>?{
        return head
    }
    
    public var last: Node<T>? {
        return tail
    }
    
    public func append(value: T){
        // 1
        let newNode = Node(value: value)
        // 2
        if let tailNode = tail{
            newNode.previous = tailNode
            tailNode.next = newNode
        }
        // 3
        else{
            head = newNode
        }
        // 4
        tail = newNode
    }
    
    public func nodeAt(index: Int) -> Node<T>?{
        if index >= 0{
            var node = head
            var i = index
            
            while node != nil{
                if i == 0{
                    return node
                }
                i -= 1
                node =  node!.next
            }
        }
        return nil
    }
    
    public func removeAll(){
        head = nil
        tail = nil
    }
    
    public func remove(node: Node<T>) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev{
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev
        
        if next == nil{
            tail = prev
        }
        
        node.previous = nil
        node.next = nil
        
        return node.value
    }
}

extension LinkedList: CustomStringConvertible{
    public var description: String{
        var text = "["
        var node = head
        
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil{
                text += " , "
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
