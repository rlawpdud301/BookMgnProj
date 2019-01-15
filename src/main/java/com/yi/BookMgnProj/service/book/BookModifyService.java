package com.yi.BookMgnProj.service.book;

import java.util.List;
import java.util.Map;

import com.yi.BookMgnProj.dao.BookDetailMapper;
import com.yi.BookMgnProj.dao.BookDetailMapperImpl;
import com.yi.BookMgnProj.dao.BookMapper;
import com.yi.BookMgnProj.dao.BookMapperImpl;
import com.yi.BookMgnProj.dao.PublisherMapper;
import com.yi.BookMgnProj.dao.PublisherMapperImpl;
import com.yi.BookMgnProj.model.Book;
import com.yi.BookMgnProj.model.BookDetail;
import com.yi.BookMgnProj.model.Publisher;

public class BookModifyService {
	private BookDetailMapper bookDetailMapper;
	private BookMapper bookMapper;
	private PublisherMapper publisherMapper;

	public BookModifyService() {
		bookDetailMapper = BookDetailMapperImpl.getInstance();
		bookMapper = BookMapperImpl.getInstance();
		publisherMapper = PublisherMapperImpl.getInstance();
	}

	public BookDetail selectBookDetailByBookCode(String bookCode) {
		return bookDetailMapper.selectBookDetailByBookCode(bookCode);
	}

	public Book selectBookBybookCodeOne(Book book) {
		return bookMapper.selectBookBybookCodeOne(book);
	}

	public int updateBookMap(Map<String, Object> map) {
		return bookMapper.updateBookMap(map);
	}

	public Publisher selectPublisherByName(Publisher publisher) {
		return publisherMapper.selectPublisherByName(publisher);
	}

	public List<Publisher> selectPublisherByAll() {
		return publisherMapper.selectPublisherByAll();
	}

	public int insertPublisher(Publisher publisher) {
		return publisherMapper.insertPublisher(publisher);
	}
}
