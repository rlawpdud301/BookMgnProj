package com.yi.BookMgnProj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yi.BookMgnProj.model.Overdue;
import com.yi.BookMgnProj.mvc.MyBatisSqlSessionFactory;

public class OverdueMapperImpl implements OverdueMapper {

	private static final OverdueMapperImpl instance = new OverdueMapperImpl();

	public static OverdueMapperImpl getInstance() {
		return instance;
	}

	private OverdueMapperImpl() {}

	private static final String namespace = "com.yi.BookMgnProj.dao.OverdueMapper";

	@Override
	public List<Overdue> selectOverdueByAll() {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + ".selectOverdueByAll");
		}
	}

	@Override
	public Overdue selectOverdueByCode(Overdue overdue) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + ".selectOverdueByCode", overdue);
		}
	}

	@Override
	public Overdue selectOverdueByMemberNo(Overdue overdue) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + ".selectOverdueByMemberNo", overdue);
		}
	}

	@Override
	public int insertOverdue(Overdue overdue) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			int res = sqlSession.insert(namespace + ".insertOverdue", overdue);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int updateCount(Overdue overdue) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			int res = sqlSession.update(namespace + ".updateCount", overdue);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int updateStopDate(Overdue overdue) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			int res = sqlSession.update(namespace + ".updateStopDate", overdue);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int updateAuthority(Overdue overdue) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			int res = sqlSession.update(namespace + ".updateAuthority", overdue);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int updateStopEndDate(Overdue overdue) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			int res = sqlSession.update(namespace + ".updateStopEndDate", overdue);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int updateDiffAuthority() {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			int res = sqlSession.update(namespace + ".updateDiffAuthority");
			sqlSession.commit();
			return res;
		}
	}

}
