package com.yi.BookMgnProj.handler.rent;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.BookMgnProj.dao.BookRentalInfoMapperImpl;
import com.yi.BookMgnProj.model.Book;
import com.yi.BookMgnProj.model.BookRentalInfo;
import com.yi.BookMgnProj.mvc.CommandHandler;

public class BookExtendHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			return "/WEB-INF/view/rent/BookExtendForm.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			String bookCode = req.getParameter("bookCode");
			
			Book book = new Book();
			book.setBookCode(bookCode);
			
			BookRentalInfo bookRentalInfo = new BookRentalInfo();
			bookRentalInfo.setBookCode(book);
			
			BookRentalInfoMapperImpl impl = BookRentalInfoMapperImpl.getInstance();
			
			BookRentalInfo bookRentalInfo1 = impl.selectRentalNoByBookCode(bookRentalInfo);
			String rNo = String.valueOf(bookRentalInfo1.getRentalNo());
			int rno = Integer.parseInt(rNo);
			bookRentalInfo.setRentalNo(rno);
			BookRentalInfo bookRentalInfo2 = impl.selectBookRentalInfoByCode(bookRentalInfo);
			Date rs = bookRentalInfo2.getReturnSchedule();
			
			Calendar cal = Calendar.getInstance ( );
			cal.setTime(rs);
			System.out.println( cal.get ( Calendar.YEAR ) + "년 " + ( cal.get ( Calendar.MONTH ) + 1 ) + "월 " + cal.get ( Calendar.DATE ) + "일" );
			cal.add ( Calendar.DATE, 7); 
			System.out.println( cal.get ( Calendar.YEAR ) + "년 " + ( cal.get ( Calendar.MONTH ) + 1 ) + "월 " + cal.get ( Calendar.DATE ) + "일" );
		
		
			Date d = new Date(cal.getTimeInMillis());
			
			bookRentalInfo.setReturnSchedule(d);
			impl.updateReturnDate(bookRentalInfo);
			
			return "/WEB-INF/view/rent/BookExtendResult.jsp";
		}
		return null;
	}

}
