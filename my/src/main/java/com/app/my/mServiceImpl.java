package com.app.my;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service("mService")
public class mServiceImpl implements mService {
	
	private static final Logger logger = LoggerFactory.getLogger(mServiceImpl.class);
    
	@Inject
	private mDao dao;
	
	@Override
	public List<HashMap<String,Object>> selectGroupList() throws Exception {
		logger.info("service - selectGroupList");
		return dao.selectGroupList();
	}
	
	@Override
	public List<HashMap<String,Object>> selectGroupList_Detail(HashMap<String, Object> hashMap) throws Exception {
		logger.info("service - selectGroupList_Detail");
		return dao.selectGroupList_Detail(hashMap);
	}
	
	@Override
	public List<HashMap<String,Object>> selectMusicList(HashMap<String, Object> hashMap) throws Exception {
		logger.info("service - selectMusicList");
		return dao.selectMusicList(hashMap);
	}
	
	@Override
	public List<HashMap<String,Object>> selectMusicList_Detail(HashMap<String, Object> hashMap) throws Exception {
		logger.info("service - selectMusicList_Detail");
		return dao.selectMusicList_Detail(hashMap);
	}
	
	@Override
	public int crudData(HashMap<String, Object> hashMap) throws Exception {
		logger.info("service - crudData");
		return dao.crudData(hashMap);
	}
	
	@Override
	public List<HashMap<String,Object>> selectData(HashMap<String, Object> hashMap) throws Exception {
		logger.info("service - selectData");
		return dao.selectData(hashMap);
	}
	
	@Override
	public List<HashMap<String,Object>> selectCodeList(HashMap<String, Object> hashMap) throws Exception {
		logger.info("service - selectCodeList");
		return dao.selectCodeList(hashMap);
	}
	
	@Override
	public int xls_import(String sqlId, List<HashMap<String,Object>> list) throws Exception {
		logger.info("service - xls_import");
		return dao.xls_import (sqlId, list);
	}
	
	@Override
	public int clearDatabase() throws Exception {
		logger.info("service - clearDatabase");
		return dao.clearDatabase();
	}
	
	@Override
	public List<HashMap<String,Object>> xls_export_m(HashMap<String, Object> hashMap) throws Exception {
		logger.info("service - xls_export_m");
		return dao.xls_export_m(hashMap);
	}
	@Override
	public List<HashMap<String,Object>> xls_export_d(HashMap<String, Object> hashMap) throws Exception {
		logger.info("service - xls_export_d");
		return dao.xls_export_d(hashMap);
	}
	@Override
	public List<HashMap<String,Object>> xls_export_cd(HashMap<String, Object> hashMap) throws Exception {
		logger.info("service - xls_export_cd");
		return dao.xls_export_cd(hashMap);
	}
	
	@Override
	public long selectMusicList_Cnt(HashMap<String, Object> hashMap) throws Exception {
		logger.info("service - selectMusicList_Cnt");
		return dao.selectMusicList_Cnt(hashMap);
	}
	
	@Override
	public long selectMusicList_Detail_Cnt(HashMap<String, Object> hashMap) throws Exception {
		logger.info("service - selectMusicList_Detail_Cnt");
		return dao.selectMusicList_Detail_Cnt(hashMap);
	}
}
