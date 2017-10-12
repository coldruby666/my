package com.app.my;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository("mDao")
public class mDaoImpl implements mDao {

	private static final Logger logger = LoggerFactory.getLogger(mDaoImpl.class);
	
	@Inject
    private SqlSession session;
	
	private static String namespace = "m";
	
	@Override
	public List<HashMap<String,Object>> selectGroupList() throws Exception {
		logger.info("dao - selectGroupList");
		return session.selectList(namespace + "." + "selectGroupList_Main");
	}
	
	@Override
	public List<HashMap<String,Object>> selectGroupList_Detail(HashMap<String, Object> hashMap) throws Exception {
		logger.info("dao - selectGroupList_Detail");
		return session.selectList(namespace + "." + "selectGroupList_Detail", hashMap);
	}
	
	@Override
	public List<HashMap<String,Object>> selectMusicList(HashMap<String, Object> hashMap) throws Exception {
		logger.info("dao - selectMusicList");
		return session.selectList(namespace + "." + "selectMusicList", hashMap);
	}
	
	@Override
	public List<HashMap<String,Object>> selectMusicList_Detail(HashMap<String, Object> hashMap) throws Exception {
		logger.info("dao - selectMusicList_Detail");
		return session.selectList(namespace + "." + "selectMusicList_Detail", hashMap);
	}
	
	@Override
	public int crudData(HashMap<String, Object> hashMap) throws Exception {
		logger.info("dao - crudData");
		
		int sqlStat = 0;
		
		switch(hashMap.get("crud").toString()) {
			case "C" :
				sqlStat = session.insert(namespace + "." + hashMap.get("sqlId"), hashMap);
				break;
			case "U" :
				sqlStat = session.update(namespace + "." + hashMap.get("sqlId"), hashMap);
				break;
			case "D" :
				
				// 앨범삭제면 관련 트랙도 삭제
				if (hashMap.get("sqlId").equals("deleteM")) {
					sqlStat = session.delete(namespace + "." + "deleteM_d", hashMap);
				}
				
				sqlStat = session.delete(namespace + "." + hashMap.get("sqlId"), hashMap);
				break;
		}
		
		return sqlStat;
	}
	
	@Override
	public List<HashMap<String,Object>> selectData(HashMap<String, Object> hashMap) throws Exception {
		logger.info("dao - selectData");
		return session.selectList(namespace + "." + hashMap.get("sqlId"), hashMap);
	}
	
	@Override
	public List<HashMap<String,Object>> selectCodeList(HashMap<String, Object> hashMap) throws Exception {
		logger.info("dao - selectCodeList");
		return session.selectList(namespace + "." + "selectCodeList", hashMap);
	}
	
	@Override
	public int clearDatabase() throws Exception {
		logger.info("dao - clearDatabase");
		
		int stats = 0;
		stats = stats + session.delete (namespace + "." + "clearDatabase");
		return stats;
	}
	
	@Override
	public int xls_import(String sqlId, List<HashMap<String,Object>> list) throws Exception {
		logger.info("dao - xls_import");
		return session.insert (namespace + "." + sqlId, list);
	}
	
	@Override
	public List<HashMap<String,Object>> xls_export_m(HashMap<String, Object> hashMap) throws Exception {
		logger.info("dao - xls_export_m");
		return session.selectList(namespace + "." + "xls_export_m", hashMap);
	}
	
	@Override
	public List<HashMap<String,Object>> xls_export_d(HashMap<String, Object> hashMap) throws Exception {
		logger.info("dao - xls_export_d");
		return session.selectList(namespace + "." + "xls_export_d", hashMap);
	}
	
	@Override
	public List<HashMap<String,Object>> xls_export_cd(HashMap<String, Object> hashMap) throws Exception {
		logger.info("dao - xls_export_cd");
		return session.selectList(namespace + "." + "xls_export_cd", hashMap);
	}
	
	@Override
	public long selectMusicList_Cnt(HashMap<String, Object> hashMap) throws Exception {
		logger.info("dao - selectMusicList_Cnt");
		List<HashMap<String,Object>> tmpList = session.selectList(namespace + "." + "selectMusicList_Cnt", hashMap);
		return (long) tmpList.get(0).get("cnt");
	}
	
	@Override
	public long selectMusicList_Detail_Cnt(HashMap<String, Object> hashMap) throws Exception {
		logger.info("dao - selectMusicList_Cnt");
		List<HashMap<String,Object>> tmpList = session.selectList(namespace + "." + "selectMusicList_Detail_Cnt", hashMap);
		return (long) tmpList.get(0).get("cnt");
	}
}
