package com.yi.BookMgnProj.handler.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.BookMgnProj.model.Member;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.MemberService;

public class MemberRentHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			MemberService service = new MemberService();
			String no = req.getParameter("no");
			Map<String, String> map = new HashMap<>();
			map.put("memberNo", no);
			List<Member> list = service.searchMembernoRent(map);
			req.setAttribute("list", list);
			return "/WEB-INF/view/member/memberRent.jsp";
		}
		return null;
	}

}
