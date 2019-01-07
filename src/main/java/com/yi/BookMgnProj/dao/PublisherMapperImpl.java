package com.yi.BookMgnProj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yi.BookMgnProj.model.Publisher;
import com.yi.BookMgnProj.mvc.MyBatisSqlSessionFactory;

public class PublisherMapperImpl implements PublisherMapper {
	private static final PublisherMapperImpl instance = new PublisherMapperImpl();

	public static PublisherMapperImpl getInstance() {
		return instance;
	}

	private PublisherMapperImpl() {}
	
	private static final String namespace = "com.yi.BookMgnProj.dao.PublisherMapper";

	@Override
	public List<Publisher> selectPublisherByAll() {
		try(SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();){
			return sqlSession.selectList(namespace+".selectPublisherByAll");
		}
	}

	@Override
	public Publisher selectPublisherByNo(Publisher publisher) {
		try(SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();){
			return sqlSession.selectOne(namespace+".selectPublisherByNo",publisher);
		}
	}

	@Override
	public Publisher selectPublisherByName(Publisher publisher) {
		try(SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();){
			return sqlSession.selectOne(namespace+".selectPublisherByName",publisher);
		}
	}

	@Override
	public int insertPublisher(Publisher publisher) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			int res = sqlSession.insert(namespace + ".insertPublisher", publisher);
			sqlSession.commit();
			return res;
		}
	}

}
