import java.io.*;

class PQ {
    Node[] pq;
    int size;

    PQ(){
        pq = new Node[10000];
        size = 0;
    }

    public int pqLength() {
        return size;
    }

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

    public void pqPush(Node node) {
        int i;
        for (i = size - 1; i >= 0 && pq[i].getFreq() > node.getFreq(); i--){
            pq[i + 1] = pq[i];
        }
        pq[i + 1] = node;
        size += 1;
    }

    public Node pqPop(){
        Node node = pq[0];
        return node;
    }

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
				tokenType = inputStream.nextToken();
				tokenType = inputStream.nextToken(); //skip the : in the file
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