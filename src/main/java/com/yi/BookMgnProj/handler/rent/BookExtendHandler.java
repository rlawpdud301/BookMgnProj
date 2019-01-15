package com.yi.BookMgnProj.handler.rent;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.BookMgnProj.dao.BookRentalInfoMapperImpl;
import com.yi.BookMgnProj.model.Book;
import com.yi.BookMgnProj.model.BookRentalInfo;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.BookExtendService;

public class BookExtendHandler implements CommandHandler {
	private BookExtendService service;
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			return "/WEB-INF/view/rent/BookExtendForm.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			try {
				service = new BookExtendService();
				String bookCode = req.getParameter("bookCode");
				System.out.println(bookCode);
				Book book = new Book();
				book.setBookCode(bookCode);
				
				BookRentalInfo bookRentalInfo = new BookRentalInfo();
				bookRentalInfo.setBookCode(book);
				
				Book book2 = service.selectBookBybookCodeOne(book);
				if(book2.isRentalPossible() == true){
					throw new Exception("isRental");
				}
				
				BookRentalInfo bookRentalInfo1 = service.selectRentalNoByBookCode_returnDateNull(bookRentalInfo);
				String rNo = String.valueOf(bookRentalInfo1.getRentalNo());
				int rno = Integer.parseInt(rNo);
				bookRentalInfo.setRentalNo(rno);
				bookRentalInfo.setReturnSchedule(bookRentalInfo1.getReturnSchedule());
				
				Date rs = bookRentalInfo.getReturnSchedule();
				System.out.println(rs);
				Calendar cal = Calendar.getInstance ( );
				cal.setTime(rs);
				System.out.println( cal.get ( Calendar.YEAR ) + "년 " + ( cal.get ( Calendar.MONTH ) + 1 ) + "월 " + cal.get ( Calendar.DATE ) + "일" );
				cal.add ( Calendar.DATE, 7); 
				System.out.println( cal.get ( Calendar.YEAR ) + "년 " + ( cal.get ( Calendar.MONTH ) + 1 ) + "월 " + cal.get ( Calendar.DATE ) + "일" );
			
			
				Date d = new Date(cal.getTimeInMillis());
				
				bookRentalInfo.setReturnSchedule(d);
				
				
				Date rentalDate = bookRentalInfo1.getRentalDate();
				
				Calendar cal2 = Calendar.getInstance ( );
				
				cal2.setTime ( rs );
				
				Calendar cal3 = Calendar.getInstance ( );
				
				cal3.setTime ( rentalDate );  
				
				int count = 0;
				while ( !cal3.after ( cal2 ) ) {
				count++;
				//다음날로 바뀜
				cal3.add ( Calendar.DATE, 1 );   
				System.out.println ( cal3.get ( Calendar.YEAR ) + "년 " + ( cal3.get ( Calendar.MONTH ) + 1 ) + "월 " + cal3.get ( Calendar.DATE ) + "일" );
				}
				
				
				if(count > 21){
					String st = "3";
					req.setAttribute("st", st);
					return "/WEB-INF/view/rent/BookExtendForm.jsp";
				}else{
					service.updateReturnDate(bookRentalInfo);
				}
				
				return "/WEB-INF/view/rent/BookExtendResult.jsp";
			} catch (Exception e) {
				if(e.getMessage()!= null && e.getMessage().equals("isRental")){
					String st = "1";
					req.setAttribute("st", st);
					e.printStackTrace();
					return "/WEB-INF/view/rent/BookExtendForm.jsp";
				}
				if(req.getParameter("bookCode") == null){
					String st = "2";
					req.setAttribute("st", st);
					e.printStackTrace();
					return "/WEB-INF/view/rent/BookExtendForm.jsp";
				}
				e.printStackTrace();
			}
			
		}
		return null;
	}

}
