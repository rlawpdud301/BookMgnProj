package com.yi.BookMgnProj.service;

import org.apache.ibatis.session.SqlSession;

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
import com.yi.BookMgnProj.mvc.MyBatisSqlSessionFactory;

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
	
	public int tra_book_return(BookRentalInfo bookRentalInfo, MemberRentalInfo memberRentalInfo, Book book){
		SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();
		int res = 0;
		try {
			res += sqlSession.update("com.yi.BookMgnProj.dao.BookRentalInfoMapper.updateReturnDate", bookRentalInfo);
			res += sqlSession.update("com.yi.BookMgnProj.dao.BookMapper.updateBookPossible", book);
			res += sqlSession.update("com.yi.BookMgnProj.dao.MemberRentalInfoMapper.updateMemberRentalInfo2", memberRentalInfo);
			if(res == 3){
				sqlSession.commit();
			}else{
				throw new Exception();
			}
		} catch (Exception e) {
			sqlSession.rollback();
			throw new RuntimeException(e.getCause());
		}finally {
			sqlSession.close();
		}
		return res;
	}
}
