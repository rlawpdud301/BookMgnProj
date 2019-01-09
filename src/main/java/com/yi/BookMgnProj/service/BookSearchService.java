package com.yi.BookMgnProj.service;

import java.util.List;
import java.util.Map;

import com.yi.BookMgnProj.dao.BookDetailMapper;
import com.yi.BookMgnProj.dao.BookDetailMapperImpl;
import com.yi.BookMgnProj.dao.BookMapper;
import com.yi.BookMgnProj.dao.BookMapperImpl;
import com.yi.BookMgnProj.model.Book;
import com.yi.BookMgnProj.model.BookDetail;

public class BookSearchService {
	private BookDetailMapper bookDetailMapper;

	public  BookSearchService()  {
		bookDetailMapper = BookDetailMapperImpl.getInstance();
	}

	public List<BookDetail> selectBookDetailByMap(Map<String, Object> map) {
		return bookDetailMapper.selectBookDetailByMap(map);
		

	}
}
   