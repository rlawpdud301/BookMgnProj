package com.yi.BookMgnProj.dao;

import java.util.List;
import java.util.Map;

import com.yi.BookMgnProj.model.Book;

public interface BookMapper {
	List<Book> selectBookByAll();

	List<Book> selectbookbybookCode(Book book);

	List<Book> selectbookbyOther(Map<String, Object> map);

	Book selectBookByBookNo(int i);

	int insertBook(Book book);

	int updateBook(Book book);

	int updateBookPossible(Book book);

	int deleteBook(Map<String, Object> map);

	Book selectBookBybookCodeOne(Book book);

	int updateBookMap(Map<String, Object> map);
}
