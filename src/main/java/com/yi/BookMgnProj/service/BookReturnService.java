package com.yi.BookMgnProj.service;

import com.yi.BookMgnProj.dao.BookMapper;
import com.yi.BookMgnProj.dao.BookMapperImpl;
import com.yi.BookMgnProj.dao.BookRentalInfoMapper;
import com.yi.BookMgnProj.dao.BookRentalInfoMapperImpl;
import com.yi.BookMgnProj.dao.MemberRentalInfoMapper;
import com.yi.BookMgnProj.dao.MemberRentalInfoMapperImpl;
import com.yi.BookMgnProj.dao.OverdueMapper;
import com.yi.BookMgnProj.dao.OverdueMapperImpl;
import com.yi.BookMgnProj.model.Book;
import com.yi.BookMgnProj.model.BookRentalInfo;
import com.yi.BookMgnProj.model.MemberRentalInfo;
import com.yi.BookMgnProj.model.Overdue;

public class BookReturnService {
	private BookRentalInfoMapper bookRentalInfoMapper = BookRentalInfoMapperImpl.getInstance();
	private BookMapper bookMapper = BookMapperImpl.getInstance();
	private MemberRentalInfoMapper memberRentalInfoMapper = MemberRentalInfoMapperImpl.getInstance();
	private OverdueMapper overdueMapper = OverdueMapperImpl.getInstance();
	
	public BookRentalInfo selectRentalNoByBookCode_returnDateNull(BookRentalInfo bookRentalInfo){
		return bookRentalInfoMapper.selectRentalNoByBookCode_returnDateNull(bookRentalInfo);
	}
	
	public int updateReturnDate(BookRentalInfo bookRentalInfo){
		return bookRentalInfoMapper.updateReturnDate(bookRentalInfo);
	}
	
	public int updateMemberRentalInfo2(MemberRentalInfo memberRentalInfo){
		return memberRentalInfoMapper.updateMemberRentalInfo2(memberRentalInfo);
	}
	
	public int updateBookPossible(Book book){
		return bookMapper.updateBookPossible(book);
	}
	
	public Book selectBookBybookCodeOne(Book book){
		return bookMapper.selectBookBybookCodeOne(book);
	}
	
	public Overdue selectOverdueByCode(Overdue overdue){
		return overdueMapper.selectOverdueByCode(overdue);
	}
	
	public int updateCount(Overdue overdue){
		return overdueMapper.updateCount(overdue);
	}
	
	public int updateStopDate(Overdue overdue){
		return overdueMapper.updateStopDate(overdue);
	}
	
	public int updateStopEndDate(Overdue overdue){
		return overdueMapper.updateStopEndDate(overdue);
	}
	
	public int updateAuthority(Overdue overdue){
		return overdueMapper.updateAuthority(overdue);
	}
}
