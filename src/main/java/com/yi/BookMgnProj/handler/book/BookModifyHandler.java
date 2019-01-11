package com.yi.BookMgnProj.handler.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.BookMgnProj.dao.BookMapper;
import com.yi.BookMgnProj.dao.BookMapperImpl;
import com.yi.BookMgnProj.model.Book;
import com.yi.BookMgnProj.mvc.CommandHandler;

public class BookModifyHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			String bookCode = req.getParameter("");
			BookMapper service = BookMapperImpl.getInstance();
			Book book = new Book();
			book.setBookCode(bookCode);
			book = service.selectBookBybookCodeOne(book);
			System.out.println(book);
			return "/WEB-INF/view/book/bookModifyForm.jsp";
		}

		if (req.getMethod().equalsIgnoreCase("post")) {

		}
		return null;
	}

}
