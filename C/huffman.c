// File: huffman.c
// Author: J Holt Transy U
// Course: PPL
//
// Main Program for huffman encoding

#include <stdio.h>
#include <stdlib.h>
#include "pq.h"
#include "tree.h"
#include "huffman.h"

int main (int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        exit(1);
    }
    
    char *fileName = argv[1];
    pq* nodeList = pqCreate(); 
    printf("Hi \n");

    printf("file: %s\n", fileName);

    printf("shit \n");
    nodeList = readFileData(fileName , nodeList);

    int i;
    for (i = 0; i < pqLength(nodeList); i++){
        printf("in the loop %d", i);
        char* name;
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
    printf("start of read");
    char *line = NULL;
    size_t linecap = 0;
    ssize_t linelen;
    printf("above loop");

    FILE *fp = fopen(fileName, "r");
    if (!fp) {
        perror("fopen");
        exit(1);
    }
    
    char name[10];
    int freq;
    while ((linelen = getline(&line, &linecap, fp)) > 0){
        printf("in loop");
        sscanf(line, " %s : %d", &name, &freq);
        char* charName = name;
        node* newNode = createNode(charName, freq, NULL, NULL);
        nodeList = pqPush(nodeList, newNode);
    }
    free(line);
    fclose(fp);
    return nodeList;
}