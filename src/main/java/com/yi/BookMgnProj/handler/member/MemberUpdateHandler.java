package com.yi.BookMgnProj.handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.BookMgnProj.model.Member;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.MemberService;

public class MemberUpdateHandler implements CommandHandler {
	private MemberService service = new MemberService();
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			String no = req.getParameter("no");
			Member member = service.selectMemberByNo(no);
			req.setAttribute("no", no);
			req.setAttribute("Member", member);
			return "/WEB-INF/view/member/memberUpdateForm.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			
			String no = req.getParameter("no");
			System.out.println("no는" + no);
			String uni = req.getParameter("uni");
			Member member = new Member();
			member.setMemberNo(no);
			System.out.println(no);
			member.setUniqueness(uni);
			service.updateDetail(member);
			return "/WEB-INF/view/member/memberUpdateSuccess.jsp";
		}
		return null;
	}

}
