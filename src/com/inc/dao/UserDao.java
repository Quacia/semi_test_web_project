package com.inc.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.inc.util.MyBatisConnector;
import com.inc.vo.User;

public class UserDao {
	private static UserDao single;
	private SqlSessionFactory factory;

	private UserDao() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}

	public static UserDao getInstance() {
		if (single == null) {
			single = new UserDao();
		}

		return single;
	}

	public int getIdCount(String id) {
		SqlSession session = factory.openSession();
		int count = session.selectOne("user.idCount", id);
		session.close();
		
		return count;
	}

	public void signUp(User user) {
		SqlSession session = factory.openSession(true);
		session.insert("user.insert", user);
		session.close();
	}

	public User selectOne(String id) {
		SqlSession session = factory.openSession();
		User user = session.selectOne("user.selectOne", id);
		
		session.close();
		return user;
	}
}