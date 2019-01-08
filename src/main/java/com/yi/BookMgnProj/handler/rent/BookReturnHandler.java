package com.yi.BookMgnProj.handler.rent;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.BookMgnProj.dao.BookRentalInfoMapperImpl;
import com.yi.BookMgnProj.model.Book;
import com.yi.BookMgnProj.model.BookRentalInfo;
import com.yi.BookMgnProj.mvc.CommandHandler;

public class BookReturnHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			return "/WEB-INF/view/rent/";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			String bookCode = req.getParameter("bookCode");
			Book book = new Book();
			book.setBookCode(bookCode);
			
			BookRentalInfo bookRentalInfo = new BookRentalInfo();
			bookRentalInfo.setBookCode(book);
			BookRentalInfoMapperImpl impl = BookRentalInfoMapperImpl.getInstance();
			BookRentalInfo bookRentalInfo1 = impl.selectRentalNoByBookCode(bookRentalInfo);
			impl.updateReturnDate(bookRentalInfo1);
			
			return "/WEB-INF/view/rent/BookReturnResult.jsp";
		}
		return null;
	}

}
