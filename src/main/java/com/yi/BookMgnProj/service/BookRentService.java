package com.yi.BookMgnProj.service;

import java.sql.SQLException;

import javax.management.RuntimeErrorException;

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

public class BookRentService {
	private BookRentalInfoMapper bookRentalInfoMapper = BookRentalInfoMapperImpl.getInstance();
	private BookMapper bookMapper = BookMapperImpl.getInstance();
	private MemberRentalInfoMapper memberRentalInfoMapper = MemberRentalInfoMapperImpl.getInstance();
	private OverdueMapper overdueMapper = OverdueMapperImpl.getInstance();
	
	public int nextCode(){
		return bookRentalInfoMapper.nextCode();
	}
	
	public int insertBookRentalInfo(BookRentalInfo bookRentalInfo) {
		return bookRentalInfoMapper.insertBookRentalInfo(bookRentalInfo);
	}
	
	public int updateBookPossible(Book book) {
		return bookMapper.updateBookPossible(book);
	}
	
	public Book selectBookBybookCodeOne(Book book){
		return bookMapper.selectBookBybookCodeOne(book);
	}
	
	public int updateMemberRentalInfo(MemberRentalInfo memberRentalInfo) {
		return memberRentalInfoMapper.updateMemberRentalInfo(memberRentalInfo);
	}
	
	public MemberRentalInfo selectMemberRentalInfoByCode(MemberRentalInfo memberRentalInfo){
		return memberRentalInfoMapper.selectMemberRentalInfoByCode(memberRentalInfo);
	}
	
	public int updateAuthority(Overdue overdue){
		return overdueMapper.updateAuthority(overdue);
	}
	
	public int tra_book_rent(BookRentalInfo bookRentalInfo, Book book, MemberRentalInfo memberRentalInfo){
		SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();
		int res = 0;
		try {
			res += sqlSession.insert("com.yi.BookMgnProj.dao.BookRentalInfoMapper.insertBookRentalInfo", bookRentalInfo);
			res += sqlSession.update("com.yi.BookMgnProj.dao.BookMapper.updateBookPossible", book);
			res += sqlSession.update("com.yi.BookMgnProj.dao.MemberRentalInfoMapper.updateMemberRentalInfo", memberRentalInfo);
			if(res == 3){
				sqlSession.commit();
			}else{
				throw new Exception();
			}
		}catch (Exception e) {
			sqlSession.rollback();
			throw new RuntimeException(e.getCause());
		}finally {
			sqlSession.close();
		}
		return res;
	}
	
}
