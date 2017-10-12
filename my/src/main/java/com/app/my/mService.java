package com.app.my;

import java.util.HashMap;
import java.util.List;

public interface mService {
	public List<HashMap<String,Object>> selectGroupList() throws Exception;
	public List<HashMap<String,Object>> selectGroupList_Detail(HashMap<String, Object> hashMap) throws Exception;
	public List<HashMap<String,Object>> selectMusicList(HashMap<String, Object> hashMap) throws Exception;
	public List<HashMap<String,Object>> selectMusicList_Detail(HashMap<String, Object> hashMap) throws Exception;
	public int crudData(HashMap<String, Object> hashMap) throws Exception;
	public List<HashMap<String,Object>> selectData(HashMap<String, Object> hashMap) throws Exception;
	public List<HashMap<String,Object>> selectCodeList(HashMap<String, Object> hashMap) throws Exception;
	public int clearDatabase() throws Exception;
	public int xls_import(String sqlId, List<HashMap<String,Object>> list) throws Exception;
	public List<HashMap<String,Object>> xls_export_m(HashMap<String, Object> hashMap) throws Exception;
	public List<HashMap<String,Object>> xls_export_d(HashMap<String, Object> hashMap) throws Exception;
	public List<HashMap<String,Object>> xls_export_cd(HashMap<String, Object> hashMap) throws Exception;
	
	public long selectMusicList_Cnt(HashMap<String, Object> hashMap) throws Exception;
	public long selectMusicList_Detail_Cnt(HashMap<String, Object> hashMap) throws Exception;	
}