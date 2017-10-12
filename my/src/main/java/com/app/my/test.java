package com.app.my;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class test {

	public static void main(String[] args) {
		
//		String fDir = "c:/myMusicWeb/backup_xls/img/";
//		Path sourceA = Paths.get(fDir + "1a.jpg");
//		Path sourceB = Paths.get(fDir + "1b.jpg");
//		
//		for(int i=4; i < 300 ; i++) {
//			String fNmA = i + "a.jpg"; 
//			String fNmB = i + "b.jpg"; 
//			Path destinationA = Paths.get(fDir+fNmA);
//			Path destinationB = Paths.get(fDir+fNmB);
//	 
//			try {
//				Files.copy(sourceA, destinationA);
//				Files.copy(sourceB, destinationB);
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			
//		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Calendar c1 = Calendar.getInstance();
        String curDt = sdf.format(c1.getTime());
		
		String exportDir = "c:/myMusicWeb/backup_xls" + "/" + curDt;
		System.out.println(exportDir);
	}

}
