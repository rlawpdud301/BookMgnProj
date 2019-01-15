package com.yi.BookMgnProj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.yi.BookMgnProj.model.MemberBest10;
import com.yi.BookMgnProj.mvc.MyBatisSqlSessionFactory;

public class MemberBest10MapperImpl implements MemberBest10Mapper {
	private static final MemberBest10MapperImpl instance = new MemberBest10MapperImpl();

	public static MemberBest10MapperImpl getInstance() {
		return instance;
	}

	private MemberBest10MapperImpl() {}

	private static final String namespace = "com.yi.BookMgnProj.dao.MemberBest10Mapper";

	@Override
	public List<MemberBest10> selectMemberBest10ByMap(Map<String, Object> map) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + ".selectMemberBest10ByMap", map);
		}
	}

}
