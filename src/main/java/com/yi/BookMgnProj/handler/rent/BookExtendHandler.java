package com.yi.BookMgnProj.handler.rent;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
import com.yi.BookMgnProj.model.OverduePopup;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.BookExtendService;
import com.yi.BookMgnProj.service.OverduedetailService;

public class BookExtendHandler implements CommandHandler {
	private BookExtendService service;
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			OverduedetailService service = new OverduedetailService();
			Map<String, Object> map = new HashMap<String, Object>();
			List<OverduePopup> list = service.selectAllbyMap(map);
			req.setAttribute("list", list);
			return "/WEB-INF/view/rent/BookExtendForm.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
				service = new BookExtendService();
				String bookCode = req.getParameter("bookCode");
				System.out.println(bookCode);
				Book book = new Book();
				book.setBookCode(bookCode);
				
				String st = "";
				BookRentalInfo bookRentalInfo = new BookRentalInfo();
				bookRentalInfo.setBookCode(book);
				
				Book book2 = service.selectBookBybookCodeOne(book);
				if(book2.isRentalPossible() == true){
					st = "대여중인 도서가 아닙니다.";
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
					st = "더 이상 연장이 불가능합니다";
				}else{
					service.updateReturnDate(bookRentalInfo);
					st = "연장 되었습니다";
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
