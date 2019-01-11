package com.yi.BookMgnProj.handler.rent;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.BookMgnProj.dao.BookRentalInfoMapperImpl;
import com.yi.BookMgnProj.model.Book;
import com.yi.BookMgnProj.model.BookRentalInfo;
import com.yi.BookMgnProj.model.MemberRentalInfo;
import com.yi.BookMgnProj.model.Overdue;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.BookReturnService;

public class BookReturnHandler implements CommandHandler {
	private BookReturnService service;
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			return "/WEB-INF/view/rent/BookReturnForm.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			try {
				service = new BookReturnService();
				String bookCode = req.getParameter("bookCode");
				
				Book book = new Book();
				book.setBookCode(bookCode);
				
				BookRentalInfo bookRentalInfo = new BookRentalInfo();
				bookRentalInfo.setBookCode(book);
				
				Book book2 = service.selectBookBybookCodeOne(book);
				if(book2.isRentalPossible()){
					throw new Exception("isRental");
				}
				
				
				BookRentalInfo bookRentalInfo1 = service.selectRentalNoByBookCode_returnDateNull(bookRentalInfo);
				String rNo = String.valueOf(bookRentalInfo1.getRentalNo());
				int rno = Integer.parseInt(rNo);
				bookRentalInfo.setRentalNo(rno);
				bookRentalInfo.setReturnDate(new Date());
				service.updateReturnDate(bookRentalInfo);
				
				
				String mNo = String.valueOf(bookRentalInfo1.getMemberNo());
				MemberRentalInfo memberRentalInfo = new MemberRentalInfo();
				memberRentalInfo.setMemberNo(mNo);
				service.updateMemberRentalInfo2(memberRentalInfo);
				
				
				book.setRentalPossible(true);
				service.updateBookPossible(book);
				
				Date turnDate = bookRentalInfo1.getReturnSchedule();
				
				Date date = new Date();
				Calendar cal = Calendar.getInstance ( );
				// 오늘날짜
				cal.setTime ( date );
				
				Calendar cal2 = Calendar.getInstance ( );
				// 반납예정일
				cal2.setTime ( turnDate );  
				
				int count = 0;
				while ( !cal2.after ( cal ) ) {
				count++;
				//다음날로 바뀜
				cal2.add ( Calendar.DATE, 1 );   
				System.out.println ( cal2.get ( Calendar.YEAR ) + "년 " + ( cal2.get ( Calendar.MONTH ) + 1 ) + "월 " + cal2.get ( Calendar.DATE ) + "일" );
				}
				System.out.println ( "연체일은 " + count + "일 입니다." );
				
				
				Overdue overdue = new Overdue();
				overdue.setMemberNo(mNo);
				
				Overdue stopdate = service.selectOverdueByCode(overdue);
				overdue.setStopDate(stopdate.getStopDate()+count);
				overdue.setOverdueCount(stopdate.getOverdueCount()+count);
				
				//정지 종료일 계산
				Date today = new Date();
				Calendar cal3 = Calendar.getInstance ( );
				cal3.setTime(today);
				cal3.add ( Calendar.DATE, stopdate.getStopDate()+count ); 
				System.out.println( cal3.get ( Calendar.YEAR ) + "년 " + ( cal3.get ( Calendar.MONTH ) + 1 ) + "월 " + cal3.get ( Calendar.DATE ) + "일" );
			
			
				Date d = new Date(cal3.getTimeInMillis());
				
				service.updateCount(overdue);
				service.updateStopDate(overdue);
				if(overdue.getStopDate() > 0) {
					overdue.setStopEndDate(d);
				}else {
					overdue.setStopEndDate(new Date());
				}
				
				service.updateStopEndDate(overdue);
				
				//정지일수가 1일이라도 있거나 연체횟수 100넘으면 대여권한 박탈
				if(overdue.getStopDate() > 0 || overdue.getOverdueCount() > 100) {
					overdue.setRentalAuthority(false);
				}else {
					overdue.setRentalAuthority(true);
				}
				
				service.updateAuthority(overdue);
				
				if(count > 0){
					String rs = "1";
					String cn = ""+count+"";
					req.setAttribute("rs", rs);
					req.setAttribute("cn", cn);
				}
				
				return "/WEB-INF/view/rent/BookReturnResult.jsp";
			} catch (Exception e) {
				if(e.getMessage().equals("isRental")){
					String st = "1";
					req.setAttribute("st", st);
					return "/WEB-INF/view/rent/BookReturnForm.jsp";
				}
				if(req.getParameter("bookCode") == null){
					String st = "2";
					req.setAttribute("st", st);
					return "/WEB-INF/view/rent/BookReturnForm.jsp";
				}
			}
			
		}
		return null;
	}

}
