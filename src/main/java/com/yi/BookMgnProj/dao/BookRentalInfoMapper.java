package com.yi.BookMgnProj.dao;

import java.util.List;
import java.util.Map;

import com.yi.BookMgnProj.model.Book;
import com.yi.BookMgnProj.model.BookRentalInfo;
import com.yi.BookMgnProj.model.Member;


public interface BookRentalInfoMapper {
	List<BookRentalInfo> selectBookRentalInfoByAll();

	BookRentalInfo selectBookRentalInfoByCode(BookRentalInfo bookRentalInfo);

	int insertBookRentalInfo(BookRentalInfo bookRentalInfo);

	List<BookRentalInfo> selectBookRentalInfoByBookCode(Book book);

	List<BookRentalInfo> selectBookRentalInfoByMemberNo(Member member);

	int nextCode();

	List<BookRentalInfo> selectBookRentalMemberInfo(Member member);
	
	List<BookRentalInfo> selectBookByMemberNoReturnDateNull(Member member);

	int updateReturnDate(BookRentalInfo bookRentalInfo);

	BookRentalInfo selectRentalNoByBookCode(BookRentalInfo bookRentalInfo);

	List<BookRentalInfo> selectRentalBookInfoByCategoryB(Member member);

	BookRentalInfo selectRentalNoByBookCode_returnDateNull(BookRentalInfo bookRentalInfo);


}
