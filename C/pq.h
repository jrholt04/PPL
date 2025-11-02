// File: pq.h
// Author: J Holt Transy U
// Course: PPL
//
//  Header file defining the structure and interface for a simple
//  priority queue (PQ) used to store and manage tree nodes
//  The queue maintains elements in ascending order of frequency
#ifndef PQ_H
#define PQ_H

#include <stdio.h>
#include "tree.h"

#define MAX_SIZE_PQ 100

typedef struct pq {
    node* pq[MAX_SIZE_PQ];
    int currentSize;
} pq;

// Allocates and initializes an empty priority queue returns a pointer to the new pq
pq* pqCreate();

// Returns the current number of elements in the priority queue
int pqLength(pq* pq);

// Removes and returns the smallest-frequency node from the queue
node* pqExtractMin(pq* pq);

// Inserts a new node into the priority queue, maintaining ascending order by frequency
pq* pqPush(pq* pq, node* node);

// Returns (but does not remove) the smallest element in the priority queue
node* pqPop(pq* pq);

#endif