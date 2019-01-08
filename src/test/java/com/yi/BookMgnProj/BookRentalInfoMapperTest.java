package com.yi.BookMgnProj;

import java.util.Date;
import java.util.List;

import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import com.yi.BookMgnProj.dao.BookRentalInfoMapper;
import com.yi.BookMgnProj.dao.BookRentalInfoMapperImpl;
import com.yi.BookMgnProj.model.Book;
import com.yi.BookMgnProj.model.BookRentalInfo;
import com.yi.BookMgnProj.model.Member;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class BookRentalInfoMapperTest extends AbstractTest {

	private BookRentalInfoMapper dao = BookRentalInfoMapperImpl.getInstance();

	@Test
	public void test01selectBookRentalInfoByAll() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<BookRentalInfo> rentList = dao.selectBookRentalInfoByAll();
		Assert.assertNotNull(rentList);
	}

	@Test
	public void test02selectBookRentalInfoByCode() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		BookRentalInfo bookRentalInfo1 = new BookRentalInfo();
		bookRentalInfo1.setRentalNo(3);
		BookRentalInfo bookRentalInfo = dao.selectBookRentalInfoByCode(bookRentalInfo1);
		System.out.println(bookRentalInfo);
		Assert.assertNotNull(bookRentalInfo);
	}
	
	@Test
	public void test03insertBookRentalInfo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		BookRentalInfo bookRentalInfo = new BookRentalInfo();
		 
		Member me = new  Member();
		me.setMemberNo("2");
		
		Book bo = new Book();
		bo.setBookCode("00001");
		
		BookRentalInfo bookRentalInfo1 = new BookRentalInfo(4, new Date(), null, new Date(), me, bo);
		int res = dao.insertBookRentalInfo(bookRentalInfo1);
		Assert.assertEquals(1, res);
	}
	
	@Test
	public void test04selectBookRentalMemberInfo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		BookRentalInfo bookRentalInfo1 = new BookRentalInfo();
		bookRentalInfo1.setRentalNo(3);
		
		
		Member m = new Member();
		
		m.setMemberNo("H0001");
		System.out.println(m);
		List<BookRentalInfo> bookRentalInfo = dao.selectBookRentalMemberInfo(m);
		System.out.println(bookRentalInfo.get(0));
		Assert.assertNotNull(bookRentalInfo);
	}

}
