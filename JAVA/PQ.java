// File: PQ.java
// Author: J Holt Transy U
// Course: PPL
//
// This class implements a simple priority queue (PQ) to store Node objects used in 
// Huffman coding The queue is maintained in ascending order of frequency 
import java.io.*;

class PQ {
    Node[] pq;
    int size;

    //initialize an empty PQ with a fixed max capacity
    PQ(){
        pq = new Node[10000];
        size = 0;
    }

    // Return the current number of elements in the priority queue
    public int pqLength() {
        return size;
    }

    // Remove and return the Node with the smallest frequency
    public Node pqExtractMin(){
        if (size == 0){
            return null;
        }
        Node node = pq[0];

        int i;
        for (i = 1; i < size; i++){
            pq[i - 1] = pq[i];
        }
        size -= 1;

        return node;
    }

    // Insert a new Node into the queue while maintaining ascending frequency order
    public void pqPush(Node node) {
        int i;
        for (i = size - 1; i >= 0 && pq[i].getFreq() > node.getFreq(); i--){
            pq[i + 1] = pq[i];
        }
        pq[i + 1] = node;
        size += 1;
    }

    // Return but do not remove the Node with the smallest frequency
    public Node pqPop(){
        Node node = pq[0];
        return node;
    }

    // Read frequency data from a file and return a PQ filled with Nodes
    public PQ readFileData(String filePath) {
		PQ nodeList = new PQ();
		try {
			FileReader file = new FileReader(filePath);
			StreamTokenizer inputStream = new StreamTokenizer(file);
			String name;
			double freq;

			int tokenType = inputStream.nextToken();
			while(tokenType != StreamTokenizer.TT_EOF){
				name = inputStream.sval;
				tokenType = inputStream.nextToken();//skip the : in the file
                //check if the middle value is :
                if (tokenType != 58){ // figuring out it is the value 58 was thanks to a discusion with chase 
                    System.out.println("Bad data form. intended form: <name> : <frequency>");
                    System.exit(1);
                }
				tokenType = inputStream.nextToken(); 
				freq = inputStream.nval;
                if (freq <= 0){
                    System.out.println("Invalid frequency. No negatives allowed.");
                    System.exit(1);
                }
				tokenType = inputStream.nextToken();

				Node tempNode = new Node(name, freq, null, null);

				nodeList.pqPush(tempNode);
			}
		}
		catch(FileNotFoundException e){
			System.out.println("File not found.");
            System.exit(1);
		}
		catch(IOException e){
            System.out.println("I/O error");
			System.exit(1);
		}
		return nodeList;
	}
}