package com.inc.util;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisConnector {
	private static MyBatisConnector single;
	
	private SqlSessionFactory factory;

	private MyBatisConnector() {
		Reader reader;
		try {
			reader = Resources.getResourceAsReader(
					"config/mybatis/mybatis-context.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public static MyBatisConnector getInstance() {
		if (single == null) {
			single = new MyBatisConnector();
		}
		return single;
	}
	
	public SqlSessionFactory getSqlSessionFactory() {
		return factory;
	}
}





