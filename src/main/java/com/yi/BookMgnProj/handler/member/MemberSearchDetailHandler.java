package com.yi.BookMgnProj.handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.BookMgnProj.model.Member;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.MemberService;

public class MemberSearchDetailHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			MemberService service = new MemberService();
			String no = req.getParameter("no");
			Member mno = service.selectMemberByNo(no);
			req.setAttribute("mno", mno);
			return "/WEB-INF/member/memberSearchDeatail.jsp";
		}
		return null;
	}

}
