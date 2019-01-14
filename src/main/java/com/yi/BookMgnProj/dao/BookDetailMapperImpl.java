package com.yi.BookMgnProj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.yi.BookMgnProj.dao.BookDetailMapper;
import com.yi.BookMgnProj.model.BookDetail;
import com.yi.BookMgnProj.mvc.MyBatisSqlSessionFactory;

public class BookDetailMapperImpl implements BookDetailMapper {
	private static final BookDetailMapperImpl instance = new BookDetailMapperImpl();

	public static BookDetailMapperImpl getInstance() {
		return instance;
	}

	private BookDetailMapperImpl() {}

	private static final String namespace = "com.yi.BookMgnProj.dao.BookDetailMapper";

	@Override
	public List<BookDetail> selectBookDetailByMap(Map<String, Object> map) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + ".selectBookDetailByMap", map);
		}
	}

	@Override
	public BookDetail selectBookDetailByBookCode(String bookCode) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + ".selectBookDetailByBookCode", bookCode);
		}
	}

}
