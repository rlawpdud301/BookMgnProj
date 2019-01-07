package com.yi.BookMgnProj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yi.BookMgnProj.model.Post;
import com.yi.BookMgnProj.mvc.MyBatisSqlSessionFactory;

public class PostMapperImpl implements PostMapper {
	private static final String namespace = "com.yi.BookMgnProj.dao.PostMapper";
	
	@Override
	public List<Post> selectPostByAll() {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + ".selectPostByAll");
		}
	}

	@Override
	public List<Post> selectPostByDoro(Post post) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + ".selectPostByDoro",post);
		}
	}

}
