package com.yi.BookMgnProj.service;

import java.util.List;

import com.yi.BookMgnProj.dao.BookMapper;
import com.yi.BookMgnProj.dao.BookMapperImpl;
import com.yi.BookMgnProj.model.Book;

public class BookSearchService {
	private BookMapper bookMapper;

	public  BookSearchService()  {
		bookMapper = BookMapperImpl.getInstance();
	}
	public List<Book> selectbookbybookCode(Book book) {
		return bookMapper.selectbookbybookCode(book);
	}
}
   