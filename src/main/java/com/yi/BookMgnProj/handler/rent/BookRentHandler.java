package com.yi.BookMgnProj.handler.rent;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.BookMgnProj.dao.BookRentalInfoMapperImpl;
import com.yi.BookMgnProj.model.Book;
import com.yi.BookMgnProj.model.BookRentalInfo;
import com.yi.BookMgnProj.model.Member;
import com.yi.BookMgnProj.mvc.CommandHandler;

public class BookRentHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			return "/WEB-INF/view/rent/BookRentForm.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			
			String memberNo = req.getParameter("memberNo");
			String bookCode = req.getParameter("bookCode");
			
			Member member = new Member();
			member.setMemberNo(memberNo);
			Book book = new Book();
			book.setBookCode(bookCode);
			
			BookRentalInfoMapperImpl impl = BookRentalInfoMapperImpl.getInstance();
			int no = impl.nextCode();
			Date date = new Date();
			Date date1 = new Date();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			sdf.format(date1);
			date1.setDate(date1.getDate() + 7);
			
			
			BookRentalInfo bookRentalInfo = new BookRentalInfo();
			bookRentalInfo.setRentalNo(no);
			bookRentalInfo.setRentalDate(date);
			bookRentalInfo.setReturnDate(null);
			bookRentalInfo.setReturnSchedule(date1);
			bookRentalInfo.setMemberNo(member);
			bookRentalInfo.setBookCode(book);
			
			
			
			impl.insertBookRentalInfo(bookRentalInfo);
			
			
			return "/WEB-INF/view/rent/BookRentResult.jsp";
			
		}
		return null;
	}

}
