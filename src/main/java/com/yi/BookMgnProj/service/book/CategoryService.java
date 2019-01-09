package com.yi.BookMgnProj.service.book;

import java.util.List;

import com.yi.BookMgnProj.dao.CategoryBMapper;
import com.yi.BookMgnProj.dao.CategoryBMapperImpl;
import com.yi.BookMgnProj.dao.CategoryMMapper;
import com.yi.BookMgnProj.dao.CategoryMMapperImpl;
import com.yi.BookMgnProj.dao.CategorySMapper;
import com.yi.BookMgnProj.dao.CategorySMapperImpl;
import com.yi.BookMgnProj.model.CategoryB;
import com.yi.BookMgnProj.model.CategoryM;
import com.yi.BookMgnProj.model.CategoryS;

public class CategoryService {
	private CategoryBMapper categoryBMapper;
	private CategoryMMapper categoryMMapper;
	private CategorySMapper categorySMapper;

	public CategoryService() {
		categoryBMapper = CategoryBMapperImpl.getInstance();
		categoryMMapper = CategoryMMapperImpl.getInstance();
		categorySMapper = CategorySMapperImpl.getInstance();
	}

	public List<CategoryB> selectCategoryBByAll() {
		return categoryBMapper.selectCategoryBByAll();
	}

	public List<CategoryM> selectCategoryMByAll() {
		return categoryMMapper.selectCategoryMByAll();
	}

	public List<CategoryM> selectCategoryMByBNo(CategoryB cateB) {
		return categoryMMapper.selectCategoryMByBNo(cateB);
	}

	public List<CategoryS> selectCategorySByAll() {
		return categorySMapper.selectCategorySByAll();
	}

	public List<CategoryS> selectCategorySByBNoMno(CategoryM cateM) {
		return categorySMapper.selectCategorySByBNoMno(cateM);
	}

	public CategoryS selectCategoryAllCode(CategoryS cateS) {
		return categorySMapper.selectCategoryAllCode(cateS);
	}

}
