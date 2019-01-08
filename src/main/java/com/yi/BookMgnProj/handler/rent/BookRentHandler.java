package com.yi.BookMgnProj.handler.rent;

import java.text.SimpleDateFormat;
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
			
			String rentalNo = req.getParameter("rentalNo");
			String rentalDate = req.getParameter("rentalDate");
			String returnDate = req.getParameter("returnDate");
			String returnSchedule = req.getParameter("returnSchedule");
			String memberNo = req.getParameter("memberNo");
			String bookCode = req.getParameter("bookCode");
			
			int rentalNo1 = Integer.parseInt(rentalNo);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date rentalDate1 = sdf.parse(rentalDate);
			Date returnDate1 = sdf.parse(returnDate);
			Date returnSchedule1 = sdf.parse(returnSchedule);
			Member member = new Member();
			member.setMemberNo(memberNo);
			Book book = new Book();
			book.setBookCode(bookCode);
			
			BookRentalInfo bookRentalInfo = new BookRentalInfo();
			bookRentalInfo.setRentalNo(rentalNo1);
			bookRentalInfo.setRentalDate(rentalDate1);
			bookRentalInfo.setReturnDate(returnDate1);
			bookRentalInfo.setReturnSchedule(returnSchedule1);
			bookRentalInfo.setMemberNo(member);
			bookRentalInfo.setBookCode(book);
			
			
			BookRentalInfoMapperImpl impl = BookRentalInfoMapperImpl.getInstance();
			impl.insertBookRentalInfo(bookRentalInfo);
			impl.nextCode();
			
			return "/WEB-INF/view/rent/BookRentResult.jsp";
			
		}
		return null;
	}

}
