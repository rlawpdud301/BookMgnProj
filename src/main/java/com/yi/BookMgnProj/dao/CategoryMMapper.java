package com.yi.BookMgnProj.dao;

import java.util.List;

import com.yi.BookMgnProj.model.CategoryB;
import com.yi.BookMgnProj.model.CategoryM;

public interface CategoryMMapper {

	List<CategoryM> selectCategoryMByBNo(CategoryB cateB);
}
