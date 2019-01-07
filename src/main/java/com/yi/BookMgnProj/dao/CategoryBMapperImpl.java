package com.yi.BookMgnProj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yi.BookMgnProj.model.CategoryB;
import com.yi.BookMgnProj.mvc.MyBatisSqlSessionFactory;



public class CategoryBMapperImpl implements CategoryBMapper {
	private static final CategoryBMapperImpl instance = new CategoryBMapperImpl();

	public static CategoryBMapperImpl getInstance() {
		return instance;
	}

	private CategoryBMapperImpl() {}

	private static final String namespace = "com.yi.BookMgnProj.dao.CategoryBMapper";

	@Override
	public List<CategoryB> selectCategoryBByAll() {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + ".selectCategoryBByAll");
		}
	}

}
