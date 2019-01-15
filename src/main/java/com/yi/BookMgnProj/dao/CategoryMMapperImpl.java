package com.yi.BookMgnProj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yi.BookMgnProj.model.CategoryB;
import com.yi.BookMgnProj.model.CategoryM;
import com.yi.BookMgnProj.mvc.MyBatisSqlSessionFactory;

public class CategoryMMapperImpl implements CategoryMMapper {
	private static final CategoryMMapperImpl instance = new CategoryMMapperImpl();

	public static CategoryMMapperImpl getInstance() {
		return instance;
	}

	private CategoryMMapperImpl() {}

	private static final String namespace = "com.yi.BookMgnProj.dao.CategoryMMapper";

	@Override
	public List<CategoryM> selectCategoryMByBNo(CategoryB cateB) {
		try (SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + ".selectCategoryMByBNo", cateB);
		}
	}

}
