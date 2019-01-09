package com.yi.BookMgnProj.service;

import com.yi.BookMgnProj.dao.BookMapper;
import com.yi.BookMgnProj.dao.BookMapperImpl;
import com.yi.BookMgnProj.dao.BookRentalInfoMapper;
import com.yi.BookMgnProj.dao.BookRentalInfoMapperImpl;
import com.yi.BookMgnProj.dao.MemberRentalInfoMapper;
import com.yi.BookMgnProj.dao.MemberRentalInfoMapperImpl;
import com.yi.BookMgnProj.model.Book;
import com.yi.BookMgnProj.model.BookRentalInfo;
import com.yi.BookMgnProj.model.MemberRentalInfo;

public class BookRentService {
	private BookRentalInfoMapper bookRentalInfoMapper = BookRentalInfoMapperImpl.getInstance();
	private BookMapper bookMapper = BookMapperImpl.getInstance();
	private MemberRentalInfoMapper memberRentalInfoMapper = MemberRentalInfoMapperImpl.getInstance();
	
	public int nextCode(){
		return bookRentalInfoMapper.nextCode();
	}
	
	public int insertBookRentalInfo(BookRentalInfo bookRentalInfo) {
		return bookRentalInfoMapper.insertBookRentalInfo(bookRentalInfo);
	}
	
	public int updateBookPossible(Book book) {
		return bookMapper.updateBookPossible(book);
	}
	
	public int updateMemberRentalInfo(MemberRentalInfo memberRentalInfo) {
		return memberRentalInfoMapper.updateMemberRentalInfo(memberRentalInfo);
	}
}
