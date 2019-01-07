package com.yi.BookMgnProj.dao;

import java.util.List;
import java.util.Map;

import com.yi.BookMgnProj.model.BookBest10;



public interface BookBest10Mapper {
	List<BookBest10> selectBookBest10ByMap(Map<String, Object> map);
	
	List<BookBest10> selectBookByMap(Map<String, Object> map);

	List<BookBest10> selectBookByMapForeSum(Map<String, Object> map);
	
	
}
