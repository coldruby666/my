package com.app.my;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import net.sf.jxls.transformer.XLSTransformer;

import java.io.File;
import java.io.IOException;
 
import javax.servlet.http.HttpServletRequest;
 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import java.util.Collections;
import java.util.Comparator;

/**
 * Handles requests for the application home page.
 */
@Controller
public class mController {

	private static final Logger logger = LoggerFactory.getLogger(mController.class);
	
	@Inject
    private mService service;
	
	@Autowired
	private xlsUtil xlsUtil;
	
	@Autowired
	ServletContext context;
	
	private String _BACKUP_DIR = "c:/myMusicWeb/backup_xls";
	private String _BACKUP_XLS_FILE_NAME_M = "m.xls";
	private String _BACKUP_XLS_FILE_NAME_D = "d.xls";
	private String _BACKUP_XLS_FILE_NAME_CD = "cd.xls";
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/")
	public String index() {
		logger.debug("<<index>>");
		return "index";
	}
	
	@RequestMapping(value = "/album")
	public ModelAndView album(@RequestParam("m_seq") String m_seq) {
		logger.debug("<<album>>");
		logger.debug(" m_seq ==> " + m_seq);
		
		ModelMap model = new ModelMap();
		model.addAttribute("m_seq", m_seq);
		
	    return new ModelAndView("album", model);
	}
	
	@RequestMapping(value = "/album_edit_data")
	public ModelAndView album_edit_data(@RequestParam("m_seq") String m_seq) {
		logger.debug("<<album_edit_data>>");
		logger.debug(" m_seq ==> " + m_seq);

		ModelMap model = new ModelMap();
		model.addAttribute("m_seq", m_seq);
		
	    return new ModelAndView("album_edit_data", model);
	}
	
	@RequestMapping(value = "/code")
	public String code() {
		logger.debug("<<code>>");
		return "code";
	}
	
	@RequestMapping(value = "/album_edit")
	public String album_edit() {
		logger.debug("<<album_edit>>");
		return "album_edit";
	}
	
	@RequestMapping(value = "/support")
	public String support() {
		logger.debug("<<support>>");
		return "support";
	}

	@RequestMapping(value = "/selectGroupList")
	@ResponseBody
	public List<HashMap<String,Object>> selectGroupList() {
		logger.debug("<<selectGroupList>>");
		
		List<HashMap<String,Object>> list = null;
		try{
			list = service.selectGroupList();
	    } catch(Exception e){
	        e.printStackTrace();
	    }
	 
	    return list;
	}

	@RequestMapping(value = "/selectGroupList_Detail")
	@ResponseBody
	public List<HashMap<String,Object>> selectGroupList_Detail(@RequestBody HashMap<String,Object> hashMap) {
		logger.debug("<<selectGroupList_Detail>>");
		logger.debug("<<hashMap>> " + hashMap.toString());
		
		List<HashMap<String,Object>> list = null;
		try{
			list = service.selectGroupList_Detail(hashMap);
	    } catch(Exception e){
	        e.printStackTrace();
	    }
	 
	    return list;
	}
	
	@RequestMapping(value = "/selectMusicList")
	@ResponseBody
	public List<HashMap<String,Object>> selectMusicList(@RequestBody HashMap<String,Object> hashMap) {
		logger.debug("<<selectMusicList>>");
		logger.debug("<<hashMap>> " + hashMap.toString());
		
		List<HashMap<String,Object>> list = null;
		try{
			list = service.selectMusicList(hashMap);
	    } catch(Exception e){
	        e.printStackTrace();
	    }
		
	    return list;
	}
	
	@RequestMapping(value = "/selectMusicList_Grid")
	@ResponseBody
	public HashMap<String,Object> selectMusicList_Grid(@RequestBody HashMap<String,Object> hashMap) {
		logger.debug("<<selectMusicList_Grid>>");
		logger.debug("<<hashMap>> " + hashMap.toString());
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		List<HashMap<String,Object>> list = null;
		long totalCount = 0;
		int pageSize = 0;
		int page = 0;
		double total = 0;
		
		if (hashMap.get("paging").equals("Y")) {
			pageSize = (int) hashMap.get("pageSize");
			page = (int) hashMap.get("page");
		}
		
		try{
			
			if (hashMap.get("paging").equals("Y")) {
				hashMap.put("limitFrom", ( page > 1 ) ? (pageSize *(page -1)) -1 : 0 );
				hashMap.put("limitTo", pageSize *page );
				totalCount = service.selectMusicList_Cnt(hashMap);
			}
			
			list = service.selectMusicList(hashMap);
			
	    } catch(Exception e){
	        e.printStackTrace();
	    }
		
		if (hashMap.get("paging").equals("Y")) {
			total = Math.ceil((double)totalCount / (double)pageSize);
		} else {
			totalCount = list.size();
		}
		
		hm.put("total", total );
		hm.put("page", page );
		hm.put("records", totalCount );
		hm.put("rows", list);
	    return hm;
	}
	
	@RequestMapping(value = "/selectMusicList_Detail", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String,Object> selectMusicList_Detail(@RequestBody HashMap<String,Object> hashMap) {
		logger.debug("<<selectMusicList_Detail>>");
		logger.debug("<<hashMap>> " + hashMap.toString());
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		List<HashMap<String,Object>> list = null;
		long totalCount = 0;
		int pageSize = 0;
		int page = 0;
		double total = 0;
		
		if (hashMap.get("paging").equals("Y")) {
			pageSize = (int) hashMap.get("pageSize");
			page = (int) hashMap.get("page");
		}
		
		try{
			
			if( hashMap.get("s_div") == null ) {
				hashMap.put("s_div","");
			}
			
			if( hashMap.get("g_cd") == null ) {
				hashMap.put("g_cd", "");
			}
			
			if( hashMap.get("g_cd_m") == null ) {
				hashMap.put("g_cd_m", "");
			}
			
			if( hashMap.get("searchTxt") == null ) {
				hashMap.put("searchTxt", "");
			}

			if (hashMap.get("paging").equals("Y")) {
				hashMap.put("limitFrom", ( page > 1 ) ? (pageSize *(page -1)) -1 : 0 );
				hashMap.put("limitTo", pageSize *page );
				totalCount = service.selectMusicList_Detail_Cnt(hashMap);
			}
			
			list = service.selectMusicList_Detail(hashMap);
			
	    } catch(Exception e){
	        e.printStackTrace();
	    }
		
		if (hashMap.get("paging").equals("Y")) {
			total = Math.round(totalCount / pageSize);
		} else {
			totalCount = list.size();
		}
		
		hm.put("total", total );
		hm.put("page", page );
		hm.put("records", totalCount );
		hm.put("rows", list);
	    return hm;
	}
	
	@RequestMapping(value = "/crudData")
	@ResponseBody
	public HashMap<String,Object> crudData(@RequestBody HashMap<String,Object> hashMap) {
		logger.debug("<<crudData>>");
		logger.debug("<<hashMap>> " + hashMap.toString());
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		int sqlStat = 0;
		try{
			sqlStat = service.crudData(hashMap);
	    } catch(Exception e){
	        e.printStackTrace();
	    }
		
		hm.put("stat", sqlStat );
	    return hm;
	}
	
	@RequestMapping(value = "/selectData")
	@ResponseBody
	public HashMap<String,Object> selectData(@RequestBody HashMap<String,Object> hashMap) {
		logger.debug("<<selectData>>");
		logger.debug("<<hashMap>> " + hashMap.toString());
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		List<HashMap<String,Object>> list = null;
		try{
			list = service.selectData(hashMap);
	    } catch(Exception e){
	        e.printStackTrace();
	    }
		
		hm.put("rows", list );
	    return hm;
	}
	
	@RequestMapping(value = "/selectCodeList")
	@ResponseBody
	public List<HashMap<String,Object>> selectCodeList(@RequestBody HashMap<String,Object> hashMap) {
		logger.debug("<<selectCodeList>>");
		logger.debug("<<hashMap>> " + hashMap.toString());
		
		List<HashMap<String,Object>> list = null;
		try{
			list = service.selectCodeList(hashMap);
	    } catch(Exception e){
	        e.printStackTrace();
	    }
		
	    return list;
	}
	
	@RequestMapping(value = "/xls_import")
	@ResponseBody
	public HashMap<String,Object> xls_import(@RequestBody HashMap<String,Object> hashMap) {
		logger.debug("<<xls_import>>");
		logger.debug("<<hashMap>> " + hashMap.toString());
		
		String importDir = _BACKUP_DIR + "/" + hashMap.get("txt_import_dir");
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		int stat_m = 0;
		int stat_d = 0;
		int stat_cd = 0;
		int stat_clear = 0;
		hm.put("stat_clear", stat_clear );
		hm.put("stat_m", stat_m );
		hm.put("stat_d", stat_d );
		hm.put("stat_cd", stat_cd );
		
		List<HashMap<String,Object>> list_m = null;
		List<HashMap<String,Object>> list_d = null;
		List<HashMap<String,Object>> list_cd = null;

		list_m = xlsUtil.xlsToList (importDir, _BACKUP_XLS_FILE_NAME_M);
		list_d = xlsUtil.xlsToList (importDir, _BACKUP_XLS_FILE_NAME_D);
		list_cd = xlsUtil.xlsToList (importDir, _BACKUP_XLS_FILE_NAME_CD);
		
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> !!!!!!!!!!!!!!!!!!!!!!!!!!11");
		System.out.println(list_m.toString());
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> !!!!!!!!!!!!!!!!!!!!!!!!!!22");
		System.out.println(list_d.toString());
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> !!!!!!!!!!!!!!!!!!!!!!!!!!33");
		System.out.println(list_cd.toString());
		
		try{
			
			if (list_m.size() == 0 || list_d.size() == 0 || list_cd.size() == 0) {
				hm.put("xls_read_error", 1 );
				hm.put("msg", "백업할 데이터가 없습니다.");
				hm.put("stat_clear", stat_clear );
				hm.put("stat_m", stat_m );
				hm.put("stat_d", stat_d );
				hm.put("stat_cd", stat_cd );
			    return hm;
			}
			
			// d 테이블 insert전 d.g_cd, d.m_no 내부 seq순번 삽입
			int dseq = 0;
			HashMap<String,Object> hm_d = null;
			for (int i = 0; i < list_d.size(); i++) {
				hm_d = list_d.get(i);
				hm_d.put("d_seq", dseq++);
			}
			
//			Collections.sort(list_d, new Comparator<Map<String, Object >>() {
//
//	            @Override
//
//	            public int compare(Map<String, Object> p1, Map<String, Object> p2) {
//	            	
//	            	int gcd_Cmp = (p1.get("g_cd").toString()).compareTo(p2.get("g_cd").toString());
//	            	if (gcd_Cmp != 0)
//	            		return gcd_Cmp;
//	            	
//	            	int mno_Cmp = (p1.get("m_no").toString()).compareTo(p2.get("m_no").toString());
//	            	if (mno_Cmp != 0)
//	            		return mno_Cmp;
//	            	
//	            	return (p1.get("d_no").toString()).compareTo(p2.get("d_no").toString());
//	            }
//
//	        });
			
			logger.debug(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>test start");
			for(int i = 0; i < list_d.size(); i++) {
				hm_d = list_d.get(i);
				logger.debug("<<" + i + ">>" + hm_d.get("g_cd").toString() + "/" + hm_d.get("m_no").toString());
			}
			logger.debug(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>test end");
			
			stat_clear = service.clearDatabase();
			stat_m = service.xls_import ("import_m", list_m);
			stat_d = service.xls_import ("import_d", list_d);
			stat_cd = service.xls_import ("import_cd", list_cd);
	    } catch(Exception e){
	        e.printStackTrace();
	    }
		
		hm.put("xls_read_error", 0 );
		hm.put("msg", "성공");
		hm.put("stat_clear", stat_clear );
		hm.put("stat_m", stat_m );
		hm.put("stat_d", stat_d );
		hm.put("stat_cd", stat_cd );
	    return hm;
	}
	
	//test
	@RequestMapping(value = "/xls_import_remote")
	@ResponseBody
	public HashMap<String,Object> xls_import_remote(MultipartHttpServletRequest mReq) {
		logger.debug("<<xls_import_remote>>");
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		int stat_m = 0;
		int stat_d = 0;
		int stat_cd = 0;
		int stat_clear = 0;
		hm.put("stat_clear", stat_clear );
		hm.put("stat_m", stat_m );
		hm.put("stat_d", stat_d );
		hm.put("stat_cd", stat_cd );
		
		List<HashMap<String,Object>> list_m = null;
		List<HashMap<String,Object>> list_d = null;
		List<HashMap<String,Object>> list_cd = null;

//		int test_cnt = 0;
		
//		Iterator<String> iter = mReq.getFileNames();
		
		System.out.println("####################################" + mReq.getFiles("multipartFile").size());
		
		List<MultipartFile> mf_list = mReq.getFiles("multipartFile");
		
		for (int i = 0; i < mf_list.size(); i++) {
			System.out.println(">>>>>>>>>>>>>>>>>>>.ITER!!!" + i);
			
//			String uploadFileNm = (MultipartFile) mf_list(i);
			MultipartFile mFile = (MultipartFile) mf_list.get(i);
			String fileNm = mFile.getOriginalFilename();
			
			if (fileNm != null && !fileNm.equals("")) {
				File file = null;
				try {
					System.out.println(mFile.getName());
					file = multipartToFile(mFile);
					System.out.println("file>>>>>>" + file.getName() );
					if (fileNm.equals (_BACKUP_XLS_FILE_NAME_M) ) {
						list_m = xlsUtil.xlsToList_file (file);
					} else if (fileNm.equals (_BACKUP_XLS_FILE_NAME_D) ) {
						list_d = xlsUtil.xlsToList_file (file);
					} else if (fileNm.equals (_BACKUP_XLS_FILE_NAME_CD) ) {
						list_cd = xlsUtil.xlsToList_file (file);
					} else {
						hm.put("xls_read_error", 1 );
						hm.put("msg", "백업할 엑셀파일이 없습니다. m,d,cd.xls");
					    return hm;
					}
					
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> !!!!!!!!!!!!!!!!!!!!!!!!!!11");
		System.out.println(list_m.toString());
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> !!!!!!!!!!!!!!!!!!!!!!!!!!22");
		System.out.println(list_d.toString());
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> !!!!!!!!!!!!!!!!!!!!!!!!!!33");
		System.out.println(list_cd.toString());
        
//		File file_m, file_d, file_cd = null;
//		file_m = new File("c:/myMusicWeb/backup_xls/" + "m.xls");
//		file_d = new File("c:/myMusicWeb/backup_xls/" + "d.xls");
//		file_cd = new File("c:/myMusicWeb/backup_xls/" + "cd.xls");
//		
//		List<HashMap<String,Object>> list_m = xlsUtil.xlsToList (file_m);
//		List<HashMap<String,Object>> list_d = xlsUtil.xlsToList (file_d);
//		List<HashMap<String,Object>> list_cd = xlsUtil.xlsToList (file_cd);
		
		try{
			
			if (list_m.size() == 0 || list_d.size() == 0 || list_cd.size() == 0) {
				hm.put("xls_read_error", 1 );
				hm.put("msg", "백업할 데이터가 없습니다.");
				hm.put("stat_clear", stat_clear );
				hm.put("stat_m", stat_m );
				hm.put("stat_d", stat_d );
				hm.put("stat_cd", stat_cd );
			    return hm;
			}
			
			stat_clear = service.clearDatabase();
			stat_m = service.xls_import ("import_m", list_m);
			stat_d = service.xls_import ("import_d", list_d);
			stat_cd = service.xls_import ("import_cd", list_cd);
	    } catch(Exception e){
	        e.printStackTrace();
	    }
		
		hm.put("xls_read_error", 0 );
		hm.put("msg", "성공");
		hm.put("stat_clear", stat_clear );
		hm.put("stat_m", stat_m );
		hm.put("stat_d", stat_d );
		hm.put("stat_cd", stat_cd );
	    return hm;
	}
	
	@RequestMapping(value = "/xls_export")
	@ResponseBody
	public HashMap<String,Object> xls_export(@RequestBody HashMap<String,Object> hashMap) {
		logger.debug("<<xls_export>>");
		logger.debug("<<hashMap>> " + hashMap.toString());
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
        Calendar c1 = Calendar.getInstance();
        String curDt = sdf.format(c1.getTime());
		
		String exportDir = _BACKUP_DIR + "/" + curDt;
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		
		try {
			List<HashMap<String,Object>> list_m = service.xls_export_m (hashMap);
			List<HashMap<String,Object>> list_d = service.xls_export_d (hashMap);
			List<HashMap<String,Object>> list_cd = service.xls_export_cd (hashMap);
			
			//m sort
			Collections.sort(list_m, new Comparator<Map<String, Object >>() {

	            @Override

	            public int compare(Map<String, Object> p1, Map<String, Object> p2) {
	            	
	            	int gcd_Cmp = (p1.get("g_cd").toString()).compareTo(p2.get("g_cd").toString());
	            	if (gcd_Cmp != 0)
	            		return gcd_Cmp;
	            	
	            	return ((Integer)Integer.parseInt(p1.get("m_no").toString())).compareTo((Integer)Integer.parseInt(p2.get("m_no").toString()));
	            }

	        });
			
			xlsUtil.listToXls (exportDir, _BACKUP_XLS_FILE_NAME_M, "m", list_m);
			xlsUtil.listToXls (exportDir, _BACKUP_XLS_FILE_NAME_D, "d", list_d);
			xlsUtil.listToXls (exportDir, _BACKUP_XLS_FILE_NAME_CD, "cd", list_cd);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		hm.put("stat", 0 );
	    return hm;
	}
	
	@RequestMapping(value = "/fileUpload") // method = RequestMethod.GET
	public Map fileUpload(HttpServletRequest req, HttpServletResponse rep) {
		//파일이 저장될 path 설정
		String path = "c://aaa";
		Map returnObject = new HashMap();
		
		try {
			// MultipartHttpServletRequest 생성
			MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req;
			Iterator iter = mhsr.getFileNames();
			MultipartFile mfile = null;
			String fieldName = "";
			List resultList = new ArrayList();
			
			// 디레토리가 없다면 생성
			File dir = new File(path);
			if (!dir.isDirectory()) {
				dir.mkdirs();
			}
			
			// 값이 나올때까지
			while (iter.hasNext()) {
				fieldName = (String) iter.next(); // 내용을 가져와서
				mfile = mhsr.getFile(fieldName);
				String origName;
				
				origName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); //한글꺠짐 방지
				
				// 파일명이 없다면
				if ("".equals(origName)) {
					continue;
				}
				
				// 파일 명 변경(uuid로 암호화)
				String ext = origName.substring(origName.lastIndexOf('.')); // 확장자
				String saveFileName = getUuid() + ext; // 설정한 path에 파일저장
				
				File serverFile = new File(path + File.separator + saveFileName);
				mfile.transferTo(serverFile);
				Map file = new HashMap();
				file.put("origName", origName);
				file.put("sfile", serverFile);
				resultList.add(file);
			}
			
			returnObject.put("files", resultList);
			returnObject.put("params", mhsr.getParameterMap());
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	//uuid생성
	public static String getUuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	// album data merge
    @RequestMapping("/mergeAlbumData")
    @ResponseBody
    public HashMap<String,Object> mergeAlbumData(@RequestBody HashMap<String,Object> hashMap) {
    	logger.debug("<<mergeAlbumData>>");
		logger.debug("<<hashMap>> " + hashMap.toString());
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		
		if (hashMap.get("m_seq").equals("X")) {
			hashMap.put("crud", "C");
			hashMap.put("sqlId", "insertM");
		} else {
			hashMap.put("crud", "U");
			hashMap.put("sqlId", "updateM");
		}
		
		byte[] img_a_byte = new byte[0];
		if ( !hashMap.get("img_a").equals("")) {			
			String img_a = hashMap.get("img_a").toString();
			img_a_byte = Base64.getDecoder().decode(img_a);
		}
		hashMap.put("img_a", img_a_byte);
		
		
		byte[] img_b_byte = new byte[0];
		if ( !hashMap.get("img_b").equals("")) {		
			String img_b = hashMap.get("img_b").toString();
			img_b_byte = Base64.getDecoder().decode(img_b);
		}
		hashMap.put("img_b", img_b_byte);
		
		
		// 재생카운트 숫자 not null
		if (hashMap.get("playCnt").equals("")) {
			hashMap.put("playCnt", 0);
		}
		
		int sqlStat = 0;
		try{
			sqlStat = service.crudData(hashMap);
	    } catch(Exception e){
	        e.printStackTrace();
	    }
		
		hm.put("stat", sqlStat );
		hm.put("goToPage", "album_edit" );
		
        return hm;
    }
     
    @RequestMapping(value = "/product-input-form")
    public String inputProduct(Model model) {
        return "productForm";
    }
    
    private File multipartToFile(MultipartFile mFile) throws IllegalStateException, IOException {
    	System.out.println("<<multipartToFile>>");
    	File convFile = new File (mFile.getOriginalFilename()); System.out.println("111>>>>>>");
    	mFile.transferTo (convFile); System.out.println("222>>>>>>");
    	return convFile;
    }
    
    /* 기존 jsp 화면 기준 메소드 복구 */
	@RequestMapping(value = "/showBackupFolderList")
	@ResponseBody
	public List<HashMap<String,Object>> showBackupFolderList(@RequestBody HashMap<String,Object> hashMap) {
		logger.debug("<<showBackupFolderList>>");
		logger.debug("<<hashMap>> " + hashMap.toString());
		
		List<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		try{
			File dirFile = new File (_BACKUP_DIR);
			File []fileList = dirFile.listFiles();
			
			for (File tempFile : fileList) {
				if (tempFile.isDirectory()) {
					HashMap<String,Object> hm = new HashMap<String,Object>();
					hm.put("dirName", tempFile.getName());
					hm.put("checkResult", checkBackupFolderValidation( _BACKUP_DIR + "/" + tempFile.getName()) );
					list.add(hm);
				}
			}
			
	    } catch(Exception e){
	        e.printStackTrace();
	    }
		
	    return list;
	}
	
	private String checkBackupFolderValidation(String checkFolderName) {
		
		String rtnStr = "복구 가능.";
		File dirFile = new File (checkFolderName);
		File []fileList = dirFile.listFiles();
		Boolean chk_m = false;
		Boolean chk_d = false;
		Boolean chk_c = false;
		
		for (File tempFile : fileList) {
			if (tempFile.isFile()) {
				
				System.out.println("tempFile.getName() >>>>>> " + tempFile.getName());
				
				if (tempFile.getName().equals("m.xls"))
					chk_m = true;
				else if (tempFile.getName().equals("d.xls"))
					chk_d = true;
				else if (tempFile.getName().equals("cd.xls"))
					chk_c = true;
				
			}
		}
		
		if (!(chk_m && chk_d && chk_c))
			rtnStr = "필수 xls 파일이 없습니다.";
		
		return rtnStr;
	}
}