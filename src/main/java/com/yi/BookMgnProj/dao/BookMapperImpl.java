package com.yi.BookMgnProj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.yi.BookMgnProj.model.Book;
import com.yi.BookMgnProj.mvc.MyBatisSqlSessionFactory;

public class BookMapperImpl implements BookMapper {
	private static final BookMapperImpl instance = new BookMapperImpl();

	public static BookMapperImpl getInstance() {
		return instance;
	}

	private BookMapperImpl() {
	}

	private static final String namespace = "com.yi.BookMgnProj.dao.BookMapper";

	@Override
	public List<Book> selectBookByAll() {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + ".selectBookByAll");
		}
	}

	@Override
	public List<Book> selectbookbybookCode(Book book) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + ".selectbookbybookCode", book);
		}
	}

	@Override
	public int insertBook(Book book) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			int res = sqlSession.insert(namespace + ".insertBook", book);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public Book selectBookByBookNo(int book) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + ".selectBookByBookNo", book);
		}
	}

	@Override
	public int updateBook(Book book) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			int res = sqlSession.update(namespace + ".updateBook", book);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public List<Book> selectbookbyOther(Map<String, Object> map) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + ".selectbookbyOther", map);
		}
	}

	@Override
	public int updateBookPossible(Book book) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			int res = sqlSession.update(namespace + ".updateBookPossible", book);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int deleteBook(Map<String, Object> map) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			int res = sqlSession.update(namespace + ".deleteBook", map);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public Book selectBookBybookCodeOne(Book book) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + ".selectBookBybookCodeOne", book);
		}
	}

	@Override
	public int updateBookMap(Map<String, Object> map) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			int res = sqlSession.update(namespace + ".updateBook", map);
			sqlSession.commit();
			return res;
		}
	}

}
