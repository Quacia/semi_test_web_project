package com.inc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.inc.util.MyBatisConnector;
import com.inc.vo.Book;

public class BookDao {
	private static BookDao single;
	private SqlSessionFactory factory;

	private BookDao() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}

	public static BookDao getInstance() {
		if (single == null) {
			single = new BookDao();
		}

		return single;
	}

	public List<Book> selectList(Map<String, Object> pageMap) {
		SqlSession session = factory.openSession();
		List<Book> bookList = session.selectList("guestbook.selectList", pageMap);
		session.close();
		return bookList;
	}

	public void insert(Book book) {
		SqlSession session = factory.openSession(true);
		session.insert("guestbook.insert", book);
		session.close();
	}

	public void delete(int id) {
		SqlSession session = factory.openSession(true);
		session.delete("guestbook.delete", id);
		session.close();
	}

	public Book selectOne(int id) {
		SqlSession session = factory.openSession();
		Book book = session.selectOne("guestbook.selectOne", id);
		session.close();
		return book;
	}

	public void update(Book book) {
		SqlSession session = factory.openSession(true);
		session.update("guestbook.update", book);
		session.close();
	}

	public int totalCount(Map<String, Object> pageMap) {
		SqlSession session = factory.openSession();
		int totalCount = session.selectOne("guestbook.totalCount", pageMap);
		session.close();
		return totalCount;
	}
}
