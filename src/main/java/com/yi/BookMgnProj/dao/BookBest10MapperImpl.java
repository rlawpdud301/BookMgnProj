package com.yi.BookMgnProj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.yi.BookMgnProj.model.BookBest10;
import com.yi.BookMgnProj.mvc.MyBatisSqlSessionFactory;

public class BookBest10MapperImpl implements BookBest10Mapper {
	private static final BookBest10MapperImpl instance = new BookBest10MapperImpl();

	public static BookBest10MapperImpl getInstance() {
		return instance;
	}

	private BookBest10MapperImpl() {}

	private static final String namespace = "com.yi.BookMgnProj.dao.BookBest10Mapper";

	@Override
	public List<BookBest10> selectBookBest10ByMap(Map<String, Object> map) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + ".selectBookBest10ByMap", map);
		}
	}

	@Override
	public List<BookBest10> selectBookByMap(Map<String, Object> map) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + ".selectBookByMap", map);
		}
	}

	@Override
	public List<BookBest10> selectBookByMapForeSum(Map<String, Object> map) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + ".selectBookByMapForeSum", map);
		}
	}

}
