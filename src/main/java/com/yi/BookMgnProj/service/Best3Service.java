package com.yi.BookMgnProj.service;

import java.util.List;
import java.util.Map;

import com.yi.BookMgnProj.dao.BookBest10Mapper;
import com.yi.BookMgnProj.dao.BookBest10MapperImpl;
import com.yi.BookMgnProj.model.BookBest10;
import com.yi.BookMgnProj.model.BookDetail;

public class Best3Service {
	private BookBest10Mapper bookBest10Mapper;

	public  Best3Service()  {
		bookBest10Mapper = BookBest10MapperImpl.getInstance();
	}
	
	public List<BookBest10> selectBookBest10ByMap(Map<String, Object> map) {
		return bookBest10Mapper.selectBookBest10ByMap(map);
	}
}
