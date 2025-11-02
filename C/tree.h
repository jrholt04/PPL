// File: tree.h
// Author: J Holt Transy U
// Course: PPL
// Sources:
//  strcpy(): https://www.geeksforgeeks.org/c/strcpy-in-c/ Accessed 10/31/25
//
//  Header file defining the node structure and function prototypes
//  for basic binary tree operations such as creation and accessors
#ifndef TREE_H
#define TREE_H

#include <stdio.h>

#define MAX_NAME_SIZE 1000

typedef struct node {
    char name[MAX_NAME_SIZE];
    int freq;
    struct node* rightChild;
    struct node* leftChild;
} node;

//returns the freqeuncy of the node 
int getFreq(node* node);

//returns the name of the node
char* getName(node* node);

// Allocates and initializes a new node with the given values
//   name: string name for the node
//   freq: integer frequency value
//   leftNode: pointer to left child (NULL if none)
//   rightNode: pointer to right child (NULL if none)
//   returns -> pointer to the newly created node
node* createNode(char* name, int freq, node* leftNode, node* rightNode);

// Recursively prints the tree using post-order traversal
void printTree(node* node);

#endif
