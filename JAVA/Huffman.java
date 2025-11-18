class Huffman {
    public static void main(String args[]) {
        int argc = args.length;
        if (argc != 1 || args[0].equals("-h")){
            System.out.println("Useage: java huffman <fileName>");
            System.exit(1);
        }
        String filePath = args[0];

        HuffmanTree huffman = new HuffmanTree(filePath);
    }
}