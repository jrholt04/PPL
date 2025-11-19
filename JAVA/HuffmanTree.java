// File: HuffmanTree.java
// Author: J Holt Transy U
// Course: PPL
//
//  This class builds a Huffman Tree from frequency data stored in a file
//  It uses a priority queue (PQ) of Node objects to iteratively combine the
//  two lowest-frequency nodes until only one node (the root of the Huffman tree) remains
class HuffmanTree{
    PQ nodeList = new PQ();

    //builds the Huffman tree from the data in the given file
    HuffmanTree(String filePath){
                
        nodeList = nodeList.readFileData(filePath);

        while (nodeList.pqLength() > 1){
            Node lchild = nodeList.pqExtractMin();
            Node rchild = nodeList.pqExtractMin();

            String name = lchild.getName() + rchild.getName();
            double freq = lchild.getFreq() + rchild.getFreq();

            Node tempNode = new Node(name, freq, rchild, lchild);

            nodeList.pqPush(tempNode);
        }
    }

    // Print the final Huffman Tree
    public void printHuffmanTree(){
        nodeList.pqExtractMin().printTree();
    }
}