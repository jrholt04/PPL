// File: pq.c
// Author: J Holt Transy U
// Course: PPL
//
//  Implementation of a simple priority queue (PQ) for managing nodes
//  based on their frequency values. Lower frequencies have higher priority
#include <stdio.h>
#include <stdlib.h>
#include "pq.h"

pq* pqCreate(){
    pq* newPQ = malloc(sizeof(pq));
    if (newPQ == NULL) {
        perror("malloc");
        exit(1);
    }

    newPQ->currentSize = 0;

    // Initialize all slots to NULL for safety
    for (int i = 0; i < MAX_SIZE_PQ; i++) {
        newPQ->pq[i] = NULL;
    }

    return newPQ;
}

int pqLength(pq* pq){
    return pq->currentSize;
}

node* pqExtractMin(pq* pq){
    if (pq->currentSize == 0) {
        return NULL;
    }
    node* nodeptr = pqPop(pq);
    
    //remove the node from the pq
    int i;
    for (i = 1; i < pq->currentSize; i++){
        pq->pq[i - 1] = pq->pq[i];
    }

    pq->currentSize -= 1;

    return nodeptr;
}

pq* pqPush(pq* pq, node* node){
    int j;
    for (j = pq->currentSize - 1; j >= 0 && pq->pq[j]->freq > node->freq; j--) {
        pq->pq[j + 1] = pq->pq[j];
    }
    pq->pq[j + 1] = node;

    pq->currentSize += 1;
    return pq;
}

node* pqPop(pq* pq){
    node* node = pq->pq[0];
    return node;
}