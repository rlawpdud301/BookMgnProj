package com.yi.BookMgnProj.handler.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.BookMgnProj.mvc.CommandHandler;

public class BookModifyHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		return "/WEB-INF/view/book/bookModifyForm.jsp";
	}

}
