package com.yi.BookMgnProj.handler.rent;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.BookMgnProj.dao.BookRentalInfoMapperImpl;
import com.yi.BookMgnProj.model.Book;
import com.yi.BookMgnProj.model.BookRentalInfo;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.BookReturnService;

public class BookReturnHandler implements CommandHandler {
	private BookReturnService service;
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			return "/WEB-INF/view/rent/BookReturnForm.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			service = new BookReturnService();
			String bookCode = req.getParameter("bookCode");
			
			Book book = new Book();
			book.setBookCode(bookCode);
			
			BookRentalInfo bookRentalInfo = new BookRentalInfo();
			bookRentalInfo.setBookCode(book);
			
			BookRentalInfoMapperImpl impl = BookRentalInfoMapperImpl.getInstance();
			
			BookRentalInfo bookRentalInfo1 = impl.selectRentalNoByBookCode_returnDateNull(bookRentalInfo);
			String rNo = String.valueOf(bookRentalInfo1.getRentalNo());
			int rno = Integer.parseInt(rNo);
			bookRentalInfo.setRentalNo(rno);
			bookRentalInfo.setReturnDate(new Date());
			impl.updateReturnDate(bookRentalInfo);
			
			return "/WEB-INF/view/rent/BookReturnResult.jsp";
		}
		return null;
	}

}
