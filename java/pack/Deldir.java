package pack;
import java.io.*;

public class Deldir {

    public static void removeDirectory(File dir) {
    	if (dir.isDirectory()) {
    		File[] files = dir.listFiles();
    		if (files != null && files.length > 0) {
    			for (File aFile : files) {
    				removeDirectory(aFile);
    			}
    		}
    		dir.delete();
    	} else {
    		dir.delete();
    	}
    }

    public static void cleanDirectory(File dir) {
    	if (dir.isDirectory()) {
    		File[] files = dir.listFiles();
    		if (files != null && files.length > 0) {
    			for (File aFile : files) {
    				removeDirectory(aFile);
    			}
    		}
    	}
    }

	public static void main(String[] args) {
		String dirToRemove = "D:/Files/";
		removeDirectory(new File(dirToRemove));

		String dirToClean = "D:/Files/";
		cleanDirectory(new File(dirToClean));
	}
}