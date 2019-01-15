package com.yi.BookMgnProj.dao;

import java.util.List;

import com.yi.BookMgnProj.model.CategoryM;
import com.yi.BookMgnProj.model.CategoryS;

public interface CategorySMapper {
	List<CategoryS> selectCategorySByBNoMno(CategoryM cateM);

	CategoryS selectCategoryAllCode(CategoryS cateS);
}
