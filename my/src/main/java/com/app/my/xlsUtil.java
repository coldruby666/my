package com.app.my;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import jxl.Cell;
import jxl.CellType;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;

@Service("xlsUtil")
public class xlsUtil {
	
	private static final Logger logger = LoggerFactory.getLogger(mServiceImpl.class);
	
	public List<HashMap<String,Object>> xlsToList(String fileDir, String fileNm) {
		
		int iHeaderCnt = 1;
		List<HashMap<String,Object>> list = new ArrayList<>();
		List<String> colList = new ArrayList<String>();
		HashMap<String,Object> hm = null;
		File file = new File(fileDir + "/" + fileNm);
		
		Workbook w;
		
        try {
        	w = Workbook.getWorkbook(file);
			Sheet sheet = w.getSheet(0);

			for (int i = 0; i < sheet.getRows(); i++) {
//				logger.info("xls --- <i> : " + i);
				hm = new HashMap<String,Object>();
				
				for (int j = 0; j < sheet.getColumns(); j++) {
//					logger.info("xls --- <j-1> : " + j);
					Cell cell = sheet.getCell (j, i);
//					logger.info("xls --- <j-2 - null check > : " + (cell == null));
//					logger.info("xls --- <j-2 - length     > : " + cell.getContents().length());
//					logger.info("xls --- <j-2 - getContents> : " + cell.getContents());
					if (i==0) {
						colList.add (cell.getContents());
						continue;
					}
					hm.put (colList.get(j), cell.getContents());
					
				}
				
				if ( i==0 ) continue;
				
				if ( fileNm.equals("m.xls") ) {
					hm.put ("img_a", convertImageFileToByteArray (fileDir, hm.get("g_cd").toString() + hm.get("m_no").toString() + "a.jpg") );
					hm.put ("img_b", convertImageFileToByteArray (fileDir, hm.get("g_cd").toString() + hm.get("m_no").toString() + "b.jpg") );	
				}
				
				list.add (i -iHeaderCnt, hm);
			}
			
			//test output
//			System.out.println("==================================================================");
//			Iterator<HashMap<String, Object>> itor = list.iterator();
//			int cnt = 0;
//			while(itor.hasNext()) {
//				System.out.println("<<" + ++cnt + ">>" + itor.next() );
//			}
//			System.out.println("==================================================================");
			
        } catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} catch (BiffException e) {
			e.printStackTrace();
			return null;
        }
		
		return list;
	}
	
	public List<HashMap<String,Object>> xlsToList_file(File file) {
		
		int iHeaderCnt = 1;
		List<HashMap<String,Object>> list = new ArrayList<>();
		List<String> colList = new ArrayList<String>();
		HashMap<String,Object> hm = null;
		String fileNm = file.getName();
		
		Workbook w;
		
        try {
        	w = Workbook.getWorkbook(file);
			Sheet sheet = w.getSheet(0);

			for (int i = 0; i < sheet.getRows(); i++) {
				
				hm = new HashMap<String,Object>();
				
				for (int j = 0; j < sheet.getColumns(); j++) {
					Cell cell = sheet.getCell (j, i);
					
					if (i==0) {
						colList.add (cell.getContents());
						continue;
					}
					
					hm.put (colList.get(j), cell.getContents());
					
				}
				
				if ( i==0 ) continue;
				
				if ( fileNm.equals("m.xls") ) {
					hm.put ("img_a", convertImageFileToByteArray ("c:/myMusicWeb/backup_xls", hm.get("m_seq").toString() + "a.jpg") );
					hm.put ("img_b", convertImageFileToByteArray ("c:/myMusicWeb/backup_xls", hm.get("m_seq").toString() + "b.jpg") );	
				}
				
				list.add (i -iHeaderCnt, hm);
			}
			
			//test output
			System.out.println("==================================================================");
			Iterator<HashMap<String, Object>> itor = list.iterator();
			int cnt = 0;
			while(itor.hasNext()) {
				System.out.println("<<" + ++cnt + ">>" + itor.next() );
			}
			System.out.println("==================================================================");
			
        } catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} catch (BiffException e) {
			e.printStackTrace();
			return null;
        }
		
		return list;
	}
	
	private int _SUCCESS = 0;
	private int _ERROR = 0;
	
	public int listToXls(String fileDir, String fileNm, String sheetNm, List<HashMap<String,Object>> list) throws SQLException {

		File file = new File(fileDir + "/" + fileNm);
		File filePath = new File(fileDir);
		
		try {
			
			if (!filePath.exists()) { filePath.mkdirs(); }
			
			if (!file.exists()) { file.createNewFile(); }
			
			WritableWorkbook workbook = null;
			workbook = Workbook.createWorkbook (file);
			WritableSheet sheet = workbook.createSheet (sheetNm, 0);
			
			Label label = null;
			int titleRowCnt = 1;
			HashMap<String,Object> hm = null;
			int y = 0;
			for (int x = 0; x < list.size(); x++) {
				System.out.println("x >>>>> " + x);
				hm = list.get (x);
				
				byte[] bImg_a = null;
				byte[] bImg_b = null;
				String sG_cd = "";
				String sM_no = "";
				
				Set<String> key = hm.keySet();
				y = 0;
				for (Iterator<String> itor = key.iterator(); itor.hasNext();) {
					String keyName = (String)itor.next();
					String valueName = String.valueOf(hm.get(keyName));
					
					System.out.println("y >>>>> " + y);
					System.out.println("keyName >>>>> " + keyName);
					System.out.println("valueName >>>>> " + valueName);
					
					if (x == 0) {
						label = null;
						label = new Label ( y, x, keyName );
						sheet.addCell (label);
					}
					
					if (keyName.equals("g_cd")) sG_cd = valueName;
					if (keyName.equals("m_no")) sM_no = valueName;
					
					if (keyName.equals("img_a")) {
						bImg_a = (byte[]) hm.get(keyName);
						continue;
					}
					
					if (keyName.equals("img_b")) {
						bImg_b = (byte[]) hm.get(keyName);
						continue;
					}
					
					label = null;
					label = new Label ( y, (titleRowCnt +x), valueName );
					sheet.addCell (label);
					
					y++;
				}
				
				if (bImg_a != null)
					convertByteArrayToImageFile (fileDir + "/img", sG_cd + sM_no + "a.jpg", bImg_a);
				
				if (bImg_b != null)
					convertByteArrayToImageFile (fileDir + "/img", sG_cd + sM_no + "b.jpg", bImg_b);
				
			}

			workbook.write();
			workbook.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return _ERROR;
		} catch (WriteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return _ERROR;
		}

		return _SUCCESS;
	}
	
	public void convertByteArrayToImageFile(String fileDir, String fileName, byte[] imageByte) {
		
		try {
            Path path = Paths.get (fileDir + "/" + fileName);
            Files.createDirectories ( Paths.get(fileDir) );
            Files.write (path, imageByte);
        } catch (IOException e) {
            e.printStackTrace();
        }
		
	}
	
	public byte[] convertImageFileToByteArray(String fileDir, String fileName) {
		
		try {
            Path path = Paths.get (fileDir +  "/img/" + fileName);
            return Files.readAllBytes(path);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
		
	}
}
