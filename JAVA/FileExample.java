import java.io.*;

class FileExample{
	public static void main(String args[]) {
		try {
			FileReader file = new FileReader("data.in");
			StreamTokenizer inputStream = new StreamTokenizer(file);
			String node1, node2;
			double weight;

			int tokenType = inputStream.nextToken();
			while(tokenType != StreamTokenizer.TT_EOF){
				node1 = inputStream.sval;
				tokenType = inputStream.nextToken();
				node2 = inputStream.sval;
				tokenType = inputStream.nextToken();
				weight = inputStream.nval;
				tokenType = inputStream.nextToken();

				System.out.println("node: " + node1 + " connected to node: " + node2 + " with weight: " + weight);
			}
		}
		catch(FileNotFoundException e){
			System.exit(1);
		}
		catch(IOException e){
			System.exit(1);
		}
	}
}
					
