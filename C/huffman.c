// File: huffman.c
// Author: J Holt Transy U
// Course: PPL
//
//  Main program that constructs a Huffman tree from input data
//  The program reads a list of symbols and frequencies
#include <stdio.h>
#include <stdlib.h>
#include "pq.h"
#include "tree.h"
#include "huffman.h"

int main (int argc, char **argv) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <file>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    char *fileName = argv[1];
    pq* nodeList = pqCreate(); 

    nodeList = readFileData(fileName , nodeList);

    while (pqLength(nodeList) > 1){

        char name[100];

        node* leftNode = pqExtractMin(nodeList);
        node* rightNode = pqExtractMin(nodeList);

        int freq = getFreq(leftNode) + getFreq(rightNode);

        sprintf(name, "%s%s", getName(leftNode), getName(rightNode)); 

        node* newNode = createNode(name, freq, leftNode, rightNode);
        nodeList = pqPush(nodeList, newNode);
    }

    printTree(pqExtractMin(nodeList));

    return 0;
}

pq* readFileData(char* fileName, pq* nodeList){
    char *line = NULL;
    size_t linecap = 0;
    ssize_t linelen;

    FILE *fp = fopen(fileName, "r");
    if (!fp) {
        perror("fopen");
        exit(1);
    }
    
    char name[10];
    int freq;
    while ((linelen = getline(&line, &linecap, fp)) > 0){
        sscanf(line, "%s : %d", name, &freq);
        node* newNode = createNode(name, freq, NULL, NULL);
        nodeList = pqPush(nodeList, newNode);
    }

    free(line);
    fclose(fp);
    return nodeList;
}