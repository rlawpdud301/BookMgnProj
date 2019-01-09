package com.yi.BookMgnProj.handler.rent;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.BookMgnProj.dao.BookMapperImpl;
import com.yi.BookMgnProj.dao.BookRentalInfoMapperImpl;
import com.yi.BookMgnProj.dao.MemberRentalInfoMapperImpl;
import com.yi.BookMgnProj.model.Book;
import com.yi.BookMgnProj.model.BookRentalInfo;
import com.yi.BookMgnProj.model.Member;
import com.yi.BookMgnProj.model.MemberRentalInfo;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.BookRentService;

public class BookRentHandler implements CommandHandler {
	private BookRentService service;
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			return "/WEB-INF/view/rent/BookRentForm.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			service = new BookRentService();
			String memberNo = req.getParameter("memberNo");
			String bookCode = req.getParameter("bookCode");
			
			Member member = new Member();
			member.setMemberNo(memberNo);
			Book book = new Book();
			book.setBookCode(bookCode);
			
			int no = service.nextCode();
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
			
			
			MemberRentalInfo memberRentalInfo = new MemberRentalInfo();
			memberRentalInfo.setMemberNo(member.getMemberNo());
			
			
			
			/*MemberRentalInfo total = impl3.selectMemberTotalByCode(memberRentalInfo);
			if(total.getTotal()== 100){
				impl3.updateMemberRentalInfoGrade(memberRentalInfo);
				
			}*/
			
			
			service.insertBookRentalInfo(bookRentalInfo);
			/* 도서 대여가능여부 false*/
			
			book.setRentalPossible(false);
			service.updateBookPossible(book);
			
			/*회원 대여가능권수 -1, 총대여권수 +1*/
			System.out.println(memberRentalInfo);
			service.updateMemberRentalInfo(memberRentalInfo);
			
			
			return "/WEB-INF/view/rent/BookRentResult.jsp";
			
		}
		return null;
	}

}
