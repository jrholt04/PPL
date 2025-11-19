// File: Huffman.java
// Author: J Holt Transy U
// Course: PPL
//
//  This program serves as the driver for building and printing a Huffman Tree.
//  It takes a single command-line argument, the name of a file and constructs
//  a Huffman tree based on the file’s contents. Then, it prints out the tree.
class Huffman {
    public static void main(String args[]) {
        int argc = args.length;
        if (argc != 1 || args[0].equals("-h")){
            System.out.println("Useage: java huffman <fileName>");
            System.exit(1);
        }
        String filePath = args[0];

        HuffmanTree huffmanTree = new HuffmanTree(filePath);

        huffmanTree.printHuffmanTree();
    }
}