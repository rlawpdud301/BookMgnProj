package com.yi.BookMgnProj.handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.BookMgnProj.mvc.CommandHandler;

public class insertSuccessHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		return "/WEB-INF/view/member/insertSuccess.jsp";
	}

}
