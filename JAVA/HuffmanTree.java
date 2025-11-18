class HuffmanTree{

    HuffmanTree(String filePath){
        PQ nodeList = new PQ();
                
        nodeList = nodeList.readFileData(filePath);

        while (nodeList.pqLength() > 1){
            Node lchild = nodeList.pqExtractMin();
            Node rchild = nodeList.pqExtractMin();

            String name = lchild.getName() + rchild.getName();
            double freq = lchild.getFreq() + rchild.getFreq();

            Node tempNode = new Node(name, freq, rchild, lchild);

            nodeList.pqPush(tempNode);
        }
        nodeList.pqExtractMin().printTree();
    }
}