#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tree.h"

int getFreq(node* node){
    return node->freq;
}

char* getName(node* node){
    return node->name;
}
 
node* createNode(char name[], int freq, node* leftNode, node* rightNode){
    node* node = malloc(sizeof(node));
    strcpy(node->name, name); //this shit no work
    node->freq = freq;
    node->leftChild = leftNode;
    node->rightChild = rightNode;
    return node;
}

void printTree(node* node){
    if (node == NULL) return;

    printTree(node->leftChild);

    printf("%s : %d ", node->name, node->freq);

    printTree(node->rightChild);
}
