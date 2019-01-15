package com.yi.BookMgnProj.handler.rent;

import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.yi.BookMgnProj.dao.BookRentalInfoMapperImpl;
import com.yi.BookMgnProj.model.Book;
import com.yi.BookMgnProj.model.BookRentalInfo;
import com.yi.BookMgnProj.model.MemberRentalInfo;
import com.yi.BookMgnProj.model.Overdue;
import com.yi.BookMgnProj.model.OverduePopup;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.BookReturnService;
import com.yi.BookMgnProj.service.OverduedetailService;

public class BookReturnHandler implements CommandHandler {
	private BookReturnService service;
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			OverduedetailService service = new OverduedetailService();
			Map<String, Object> map = new HashMap<String, Object>();
			List<OverduePopup> list = service.selectAllbyMap(map);
			req.setAttribute("list", list);
			
			return "/WEB-INF/view/rent/BookReturnForm.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
				service = new BookReturnService();
				String bookCode = req.getParameter("bookCode");
				
				Book book = new Book();
				book.setBookCode(bookCode);
				
				String st = "";	
				BookRentalInfo bookRentalInfo = new BookRentalInfo();
				bookRentalInfo.setBookCode(book);
				Book book2 = service.selectBookBybookCodeOne(book);
				System.out.println(book2.isRentalPossible());
				if(book2.isRentalPossible()){
					st = "대여중인 도서가 아닙니다.";
				}
				
				
				BookRentalInfo bookRentalInfo1 = service.selectRentalNoByBookCode_returnDateNull(bookRentalInfo);
				String rNo = String.valueOf(bookRentalInfo1.getRentalNo());
				int rno = Integer.parseInt(rNo);
				bookRentalInfo.setRentalNo(rno);
				bookRentalInfo.setReturnDate(new Date());
				
				
				String mNo = String.valueOf(bookRentalInfo1.getMemberNo());
				MemberRentalInfo memberRentalInfo = new MemberRentalInfo();
				memberRentalInfo.setMemberNo(mNo);
				
				book.setRentalPossible(true);
				
				service.tra_book_return(bookRentalInfo, memberRentalInfo, book);
				
				/*service.updateReturnDate(bookRentalInfo);
				service.updateMemberRentalInfo2(memberRentalInfo);
				service.updateBookPossible(book);*/
				
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
					st = "반납완료! "+count+"일 연체되었습니다.";
				}
				

				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(st);
				System.out.println(json);

				
				res.setContentType("application/json;charset=utf-8");
				PrintWriter pw = res.getWriter();
				pw.println(json);
				pw.flush();// 고객에게 데이터를보냄
				return null;
			
		}
		return null;
	}

}
