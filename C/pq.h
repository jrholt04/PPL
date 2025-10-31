// File: pq.h
// Author: J Holt Transy U
// Course: PPL
//
// header file for pq
#ifndef PQ_H
#define PQ_H

#include <stdio.h>
#include "tree.h"

#define MAX_SIZE 100

typedef struct pq {
    node* pq[MAX_SIZE];
    int currentSize;
} pq;

//initialize the pq
pq* pqCreate();

//returns length of pq
int pqLength(pq* pq);

//returns the smallest node
node* pqExtractMin(pq* pq);

//adds element to the pq
pq* pqPush(pq* pq, node* node);

//removes element from pq
node* pqPop(pq* pq);

#endif