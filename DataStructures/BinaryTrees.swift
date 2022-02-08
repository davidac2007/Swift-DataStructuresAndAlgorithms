//
//  BinaryTrees.swift
//  DataStructures
//
//  Created by David Avendaño on 08/02/22.
//

import Foundation

// Binary Trees

/*
 A binary search tree (BST), as the name suggests,
 is a binary tree where data is organized in a hierarchical
 structure. This data structure stores values in sorted order.
 
 Every node in a binary search tree comprises the following attributes:
 
 1. key: The value stored in the node.
 
 2. left: The pointer to the left child.
 
 3. right: The pointer to the right child.
 
 4. p: The pointer to the parent node.
 
 A binary search tree exhibits a unique property that distinguishes
 it from other trees.
 This property is known as the binary-search-tree property.
 
 Leaf node: If a node doesn't have any children, it's called a leaf node
 
 Root: The root is the node at the top of the tree
 
 Let x be a node in a binary search tree.
    - If y is a node in the left subtree of x, then y.key ≤ x.key
    - If y is a node in the right subtree of x, then y.key ≥ x.key
 
 Applications of trees
 
    - Binary Trees: Used to implement expression parsers and expression solvers.
    - Binary Search Tree: used in many search applications where data are constantly entering and leaving.
    - Heaps: used by JVM (Java Virtual Machine) to store Java objects.
    - Treaps: used in wireless networking.

       |                               Root
       |                                |
       |                                V
       |                       Key ---> 56
       |                           /        \
       |                          /          \ <-- Edge
       |                         /            \
       |       Parent --->      60            95         ---
       |                      /    \        /    \         |
       |                     /      \      /      \        | --- Subtree
       |                    /        \    /        \       |
       |       Child --->  90        76  30        43    ___
                            Siblings         Leaf
                                            nodes
*/

class TreeNode<T>{
    var value: T
    var leftChild: TreeNode?
    var rightChild: TreeNode?
    
    init(value: T){
        self.value = value
    }
}
/*
 Enumerations are rigid, in that they can only be in one state or another.
 Fortunately, this fits into the idea of binary trees quite elegantly.
 A binary tree is a finite set of nodes that is either empty, or consists
 of the value at the node and references to it’s left and right children.
 */

/*
 Enumerations in Swift are value types. When Swift tries to allocate memory for value types, it needs to know exactly how much memory it needs to allocate.
 
 The enumeration you’ve defined is a recursive enum. That’s an enum that has an associated value that refers to itself. Recursive value types have a indeterminable size.
 */
enum BinaryTree<T: Comparable>{
    case empty
    
    // Attaching stored properties in a case
    //             Left   Value   Right
    //             child           child
    indirect case node(BinaryTree, T, BinaryTree)
    
    var count: Int{
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
    
    private func newTreeWithInsertedValue(newValue: T) -> BinaryTree {
      switch self {
      // 1
      case .empty:
        return .node(.empty, newValue, .empty)
      // 2
      case let .node(left, value, right):
        if newValue < value {
          return .node(left.newTreeWithInsertedValue(newValue: newValue), value, right)
        } else {
          return .node(left, value, right.newTreeWithInsertedValue(newValue: newValue))
        }
      }
    }
    
    mutating func insert(newValue: T) {
      self = newTreeWithInsertedValue(newValue: newValue)
    }
}

extension BinaryTree: CustomStringConvertible {
  var description: String {
    switch self {
    case let .node(left, value, right):
      return "value: \(value), left = [" + left.description + "], right = [" + right.description + "]"
    case .empty:
      return ""
    }
  }
}

func buildTree(){
    // leaf nodes
    let node5 = BinaryTree.node(.empty, "5", .empty)
    let nodeA = BinaryTree.node(.empty, "a", .empty)
    let node10 = BinaryTree.node(.empty, "10", .empty)
    let node4 = BinaryTree.node(.empty, "4", .empty)
    let node3 = BinaryTree.node(.empty, "3", .empty)
    let nodeB = BinaryTree.node(.empty, "b", .empty)

    // intermediate nodes on the left
    let Aminus10 = BinaryTree.node(nodeA, "-", node10)
    let timesLeft = BinaryTree.node(node5, "*", Aminus10)

    // intermediate nodes on the right
    let minus4 = BinaryTree.node(.empty, "-", node4)
    let divide3andB = BinaryTree.node(node3, "/", nodeB)
    let timesRight = BinaryTree.node(minus4, "*", divide3andB)

    // root node
    var tree = BinaryTree.node(timesLeft, "+", timesRight)
    
    print(tree)
    print(tree.count)
    
    /*
     Tree Structure
     
     value: +,
        left = [value: *,
            left = [value: 5, left = [], right = []],
            right = [value: -,
                left = [value: a, left = [],
                right = []], right = [value: 10, left = [],right = []]]],
        right = [value: *,
            left = [value: -,
                left = [],
                right = [value: 4, left = [], right = []]],
            right = [value: /,
                left = [value: 3, left = [], right = []],
                right = [value: b, left = [], right = []]]]
     */
    
    var newTree = BinaryTree.node(.empty, "5", .empty)
    newTree.insert(newValue: "7")
    newTree.insert(newValue: "9")
    
    print(newTree)
    print(newTree.count)
    
    /*
     New tree structure
     
     value: 5,
        left = [],
        right = [value: 7,
            left = [],
            right = [value: 9,
                left = [],
                right = []]]
     */
    
}
