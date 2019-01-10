package com.yi.BookMgnProj.dao;

import java.util.HashMap;
import java.util.List;

import com.yi.BookMgnProj.model.CategoryM;
import com.yi.BookMgnProj.model.CategoryS;


public interface CategorySMapper {
	List<CategoryS> selectCategorySByAll();
	List<CategoryS> selectCategorySByBNoMno(CategoryM cateM);
	CategoryS selectCategoryAllCode(CategoryS cateS);
	CategoryS categoryS(HashMap<String, Integer> map);
}
