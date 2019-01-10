package com.yi.BookMgnProj.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yi.BookMgnProj.model.CategoryM;
import com.yi.BookMgnProj.model.CategoryS;
import com.yi.BookMgnProj.mvc.MyBatisSqlSessionFactory;


public class CategorySMapperImpl implements CategorySMapper {
	private static final CategorySMapperImpl instance = new CategorySMapperImpl();

	public static CategorySMapperImpl getInstance() {
		return instance;
	}

	private CategorySMapperImpl() {}
	private static final String namespace = "com.yi.BookMgnProj.dao.CategorySMapper";
																		
	@Override
	public List<CategoryS> selectCategorySByAll() {
		try(SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();){
			return sqlSession.selectList(namespace+".selectCategorySByAll");
		}
	}
	
	@Override
	public List<CategoryS> selectCategorySByBNoMno(CategoryM cateM) {
		try(SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();){
			return sqlSession.selectList(namespace+".selectCategorySByBNoMno",cateM);
		}
	}

	@Override
	public CategoryS selectCategoryAllCode(CategoryS cateS) {
		try(SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();){
			return sqlSession.selectOne(namespace+".selectCategoryAllCode",cateS);
		}
	}

	@Override
	public CategoryS categoryS(HashMap<String, Integer> map) {
		try(SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();){
			return sqlSession.selectOne(namespace+".categoryS",map);
		}
	}

}
