#include "tree.h"

int getFreq(node* node){
    return node->freq;
}

char* getName(node* node){
    return node->name;
}
 
node* createNode(char* name, int freq, node* leftNode, node* rightNode){
    node* node;
    node->name = name; 
    node->freq = freq;
    node->leftChild = leftNode;
    node->rightChild = rightNode;
    return node;
}

void printTree(node* node){
    if (node == NULL) return;

    // Print left subtree
    printTree(node->leftChild);

    // Print current node
    printf("%c:%d ", node->name, node->freq);

    // Print right subtree
    printTree(node->rightChild);
}
