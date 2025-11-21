// File: Node.java
// Author: J Holt Transy U
// Course: PPL
//
// This class represents a single node in a Huffman Tree
// Each node stores a name, its frequency, and its left and right child nodes
class Node {
    String name;
    double freq;
    Node rchild;
    Node lchild;

    //initializes a new Node with given name, frequency, and child references
    Node(String inputName, double inputFreq, Node inputRchild, Node inpurLchild){
        name = inputName;
        freq = inputFreq;
        rchild = inputRchild;
        lchild = inpurLchild;
    }
    // Gets the frequency value
    public double getFreq(){
        return freq;
    }
    // Gets the name of the node
    public String getName(){
        return name;
    }

    // Prints the tree in post order traversail
    public void printTree() {
        if (lchild != null) {
            lchild.printTree(); 
        }
        if (rchild != null) {
            rchild.printTree(); 
        }
        System.out.println(name + " : " + freq);
    }

}