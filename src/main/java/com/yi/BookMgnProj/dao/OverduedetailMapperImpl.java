package com.yi.BookMgnProj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.yi.BookMgnProj.model.OverduePopup;
import com.yi.BookMgnProj.mvc.MyBatisSqlSessionFactory;

public class OverduedetailMapperImpl implements OverduedetailMapper {

	private static final OverduedetailMapperImpl instance = new OverduedetailMapperImpl();

	public static OverduedetailMapperImpl getInstance() {
		return instance;
	}

	private OverduedetailMapperImpl() {
	}
	
	private static final String namespace = "com.yi.BookMgnProj.dao.OverduedetailMapper";
	
	@Override
	public List<OverduePopup> selectAll() {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + ".selectAll");
		}
	}

	@Override
	public void updatedat() {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			int res = sqlSession.update(namespace + ".updatedat");
			sqlSession.commit();
		}
		
	}

	@Override
	public int selectDate() {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + ".selectDate");
		}
	}

	@Override
	public List<OverduePopup> selectAllRentInfo() {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + ".selectAllRentInfo");
		}
	}

	@Override
	public List<OverduePopup> selectAllbyMap(Map<String, Object> map) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + ".selectAllbyMap",map);
		}
	}

}
