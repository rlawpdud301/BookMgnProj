package com.yi.BookMgnProj.handler.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.BookMgnProj.model.Member;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.MemberService;

public class MemberOutHandler implements CommandHandler {
	private MemberService service = new MemberService();
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
		Map<String, Object> map = new HashMap<String, Object>();
		String no = req.getParameter("no");
		String pass = req.getParameter("password");
		System.out.println("no는"+no);
		System.out.println("pass는"+pass);

		map.put("newMemberNo", "D("+no+")");
		
		map.put("memberNo", no);
		map.put("password", pass.substring(0,0));
		service.deleteMemberNo(map);
		return "/WEB-INF/view/member/memberOutSuccess.jsp";
	}
		return null;
	}
}