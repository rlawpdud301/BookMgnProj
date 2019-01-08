package com.yi.BookMgnProj.handler.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.yi.BookMgnProj.mvc.CommandHandler;

public class BookInsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/book/bookInsertForm.jsp";
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			return "/WEB-INF/view/book/bookInsertForm.jsp";
		}
		return null;
	}

}
