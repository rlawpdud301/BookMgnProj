package com.yi.BookMgnProj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yi.BookMgnProj.model.MemberRentalInfo;
import com.yi.BookMgnProj.mvc.MyBatisSqlSessionFactory;

public class MemberRentalInfoMapperImpl implements MemberRentalInfoMapper {
	
	private static final MemberRentalInfoMapperImpl instance = new MemberRentalInfoMapperImpl();
	public static MemberRentalInfoMapperImpl getInstance() {
		return instance;
	}
	private MemberRentalInfoMapperImpl() {}
	
	private static final String namespace = "com.yi.BookMgnProj.dao.MemberRentalInfoMapper";
	
	@Override
	public List<MemberRentalInfo> selectMemberRentalInfoByAll() {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + ".selectMemberRentalInfoByAll");
		}
	}

	@Override
	public MemberRentalInfo selectMemberRentalInfoByCode(MemberRentalInfo memberRentalInfo) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + ".selectMemberRentalInfoByCode", memberRentalInfo);
		}
	}
	
	
	@Override
	public int insertMemberRentalInfo(MemberRentalInfo memberRentalInfo) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			int res = sqlSession.insert(namespace + ".insertMemberRentalInfo", memberRentalInfo);
			sqlSession.commit();
			return res;
		}
	}
	@Override
	public int updateMemberRentalInfo(MemberRentalInfo memberRentalInfo) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			int res = sqlSession.update(namespace + ".updateMemberRentalInfo", memberRentalInfo);
			sqlSession.commit();
			return res;
		}
	}
	@Override
	public int updateMemberRentalInfo2(MemberRentalInfo memberRentalInfo) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			int res = sqlSession.update(namespace + ".updateMemberRentalInfo2", memberRentalInfo);
			sqlSession.commit();
			return res;
		}
	}
	@Override
	public MemberRentalInfo selectMemberNowTotalByCode(MemberRentalInfo memberRentalInfo) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + ".selectMemberNowTotalByCode", memberRentalInfo);
		}
	}
	@Override
	public MemberRentalInfo selectMemberTotalByCode(MemberRentalInfo memberRentalInfo) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + ".selectMemberTotalByCode", memberRentalInfo);
		}
	}
	@Override
	public int updateMemberRentalInfoGrade(MemberRentalInfo memberRentalInfo) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			int res = sqlSession.update(namespace + ".updateMemberRentalInfoGrade", memberRentalInfo);
			sqlSession.commit();
			return res;
		}
	}
	@Override
	public MemberRentalInfo selectMemberGradeByCode(MemberRentalInfo memberRentalInfo) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + ".selectMemberGradeByCode", memberRentalInfo);
		}
	}
	
	

}
