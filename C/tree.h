// File: tree.h
// Author: J Holt Transy U
// Course: PPL
// sources: 
//  strpy(): https://www.geeksforgeeks.org/c/strcpy-in-c/ Accessed 10/31/25. 
//
// Headerfile for tree 
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

//returns the name of the ndoe
char* getName(node* node);

//creates a new node 
node* createNode(char* name, int freq, node* leftNode, node* rightNode);

//prints tree
void printTree(node* node);

#endif
