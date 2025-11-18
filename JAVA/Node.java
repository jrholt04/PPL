class Node {
    String name;
    double freq;
    Node rchild;
    Node lchild;

    Node(String inputName, double inputFreq, Node inputRchild, Node inpurLchild){
        name = inputName;
        freq = inputFreq;
        rchild = inputRchild;
        lchild = inpurLchild;
    }

    public double getFreq(){
        return freq;
    }

    public String getName(){
        return name;
    }

    public void printTree() {
        if (lchild != null) {
        lchild.printTree(); // visit left subtree
        }
        if (rchild != null) {
            rchild.printTree(); // visit right subtree
        }
        System.out.println(name + " : " + freq);
    }

}