package com.yi.BookMgnProj.service;

import com.yi.BookMgnProj.dao.BookMapper;
import com.yi.BookMgnProj.dao.BookMapperImpl;
import com.yi.BookMgnProj.dao.BookRentalInfoMapper;
import com.yi.BookMgnProj.dao.BookRentalInfoMapperImpl;
import com.yi.BookMgnProj.model.Book;
import com.yi.BookMgnProj.model.BookRentalInfo;

public class BookExtendService {
	private BookRentalInfoMapper bookRentalInfoMapper = BookRentalInfoMapperImpl.getInstance();
	private BookMapper bookMapper = BookMapperImpl.getInstance();
	
	public BookRentalInfo selectRentalNoByBookCode_returnDateNull(BookRentalInfo bookRentalInfo){
		return bookRentalInfoMapper.selectRentalNoByBookCode_returnDateNull(bookRentalInfo);
	}
	
	public int updateReturnDate(BookRentalInfo bookRentalInfo){
		return bookRentalInfoMapper.updateReturnDate(bookRentalInfo);
	}
	
	public Book selectBookBybookCodeOne(Book book){
		return bookMapper.selectBookBybookCodeOne(book);
	}
}
