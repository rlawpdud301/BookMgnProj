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
import com.yi.BookMgnProj.model.Overdue;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.BookRentService;

public class BookRentHandler implements CommandHandler {
	private BookRentService service;
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			return "/WEB-INF/view/rent/BookRentForm.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			try{
				service = new BookRentService();
				String memberNo = req.getParameter("memberNo");
				String bookCode = req.getParameter("bookCode");
				
				Member member = new Member();
				member.setMemberNo(memberNo);
				
				MemberRentalInfo memberRentalInfo = new MemberRentalInfo();
				memberRentalInfo.setMemberNo(member.getMemberNo());
				
				System.out.println(member+"post");
				Book book = new Book();
				book.setBookCode(bookCode);
				
				Book book2 = service.selectBookBybookCodeOne(book);
				if(book2.isRentalPossible() == false){
					String st = "1";
					req.setAttribute("st", st);
					return "/WEB-INF/view/rent/BookRentForm.jsp";
				}
				MemberRentalInfo memberRentalInfo2 = service.selectMemberRentalInfoByCode(memberRentalInfo);
				memberRentalInfo2.getNowTotal();
				if(memberRentalInfo2.getNowTotal() < 1){
					String st = "2";
					req.setAttribute("st", st);
					return "/WEB-INF/view/rent/BookRentForm.jsp";
				}
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
				
				book.setRentalPossible(false);
				
				/*대여+도서 대여가능여부 false+회원 대여가능권수 -1, 총대여권수 +1*/
				service.tra_book_rent(bookRentalInfo, book, memberRentalInfo);
				/*service.insertBookRentalInfo(bookRentalInfo);
				 도서 대여가능여부 false
				service.updateBookPossible(book);
				
				회원 대여가능권수 -1, 총대여권수 +1
				System.out.println(memberRentalInfo);
				service.updateMemberRentalInfo(memberRentalInfo);*/
				
				/* 대여후에 회원의 대여가능권수가 0이 되면 대여가능여부 false로 변경 */
				MemberRentalInfo memberRentalInfo3 = service.selectMemberRentalInfoByCode(memberRentalInfo);
				if(memberRentalInfo3.getNowTotal() == 0){
					Overdue overdue = new Overdue();
					overdue.setMemberNo(member.getMemberNo());
					overdue.setRentalAuthority(false);
					service.updateAuthority(overdue);
				}
				return "/WEB-INF/view/rent/BookRentResult.jsp";
				
			}catch (Exception e) {
				String st = "3";
				req.setAttribute("st", st);
				return "/WEB-INF/view/rent/BookRentForm.jsp";
			}
			
		}
		return null;
	}

}
