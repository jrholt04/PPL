// File: huffman.h
// Author: J Holt Transy U
// Course: PPL
//
//  Header file declaring functions used for building a Huffman tree
//  Includes function to read frequency data from a file and
//  construct a priority queue of tree nodes

// Reads file data to create a priority queue of nodes
// Each line in the file should be formatted as: "<symbol> : <frequency>"
pq* readFileData(char* fileName, pq* nodeList);