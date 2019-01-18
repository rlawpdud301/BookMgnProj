package com.yi.BookMgnProj.handler.book;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.BookMgnProj.model.Book;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.book.BookModifyService;

public class BookDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		BookModifyService service = new BookModifyService();
		
		String bookCode = req.getParameter("no");
		System.out.println(bookCode);
		String newBookCode = "D" + bookCode;
		System.out.println(newBookCode);
		
		Map<String, Object> map = new HashMap<>();
		map.put("bookCode", bookCode);
		map.put("newBookCode", newBookCode);
		
		service.deleteBook(map);
		res.sendRedirect(req.getContextPath() + "/bookSearch.do");
		
		return null;
	}

}
