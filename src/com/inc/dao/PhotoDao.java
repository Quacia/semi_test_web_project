package com.inc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.inc.util.MyBatisConnector;
import com.inc.vo.Photo;

public class PhotoDao {
	private static PhotoDao single;
	private SqlSessionFactory factory;

	private PhotoDao() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}

	public static PhotoDao getInstance() {
		if (single == null) {
			single = new PhotoDao();
		}

		return single;
	}

	public List<Photo> selectList(Map<String, Object> pageMap) {
		SqlSession session = factory.openSession();
		List<Photo> photoList = session.selectList("photo.selectList", pageMap);
		session.close();
		return photoList;
	}

	public void insert(Photo photo) {
		SqlSession session = factory.openSession(true);
		session.insert("photo.insert", photo);
		session.close();
	}

	public void delete(int id) {
		SqlSession session = factory.openSession(true);
		session.delete("photo.delete", id);
		session.close();
	}

	public int totalCount(Map<String, Object> pageMap) {
		SqlSession session = factory.openSession();
		int totalCount = session.selectOne("photo.totalCount", pageMap);
		session.close();
		return totalCount;
	}
}
