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
 
 Let x be a node in a binary search tree.
    - If y is a node in the left subtree of x, then y.key ≤ x.key
    - If y is a node in the right subtree of x, then y.key ≥ x.key
 
 Applications of trees
 
    - Binary Trees: Used to implement expression parsers and expression solvers.
    - Binary Search Tree: used in many search applications where data are constantly entering and leaving.
    - Heaps: used by JVM (Java Virtual Machine) to store Java objects.
    - Treaps: used in wireless networking.

                                      Root
                                       |
                                       V
                              Key ---> 56
                                  /        \
                                 /          \ <-- Edge
                                /            \
              Parent --->      60            95         ---
                             /    \        /    \         |
                            /      \      /      \        | --- Subtree
                           /        \    /        \       |
              Child --->  90        76  30        43    ___
                            Siblings         Leaf
                                            nodes
*/
