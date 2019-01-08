package com.yi.BookMgnProj.handler.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.BookMgnProj.dao.BookMapper;
import com.yi.BookMgnProj.dao.BookMapperImpl;
import com.yi.BookMgnProj.dao.MemberMapper;
import com.yi.BookMgnProj.dao.MemberMapperImpl;
import com.yi.BookMgnProj.model.Book;
import com.yi.BookMgnProj.model.Member;
import com.yi.BookMgnProj.mvc.CommandHandler;

public class MemberLoginHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/member/memberLoginForm.jsp";
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			String id = req.getParameter("id");
			String password = req.getParameter("password");
			System.out.println(id);
			System.out.println(password);
			
			MemberMapper mapper = MemberMapperImpl.getInstance();
			Map<String, Object> map = new HashMap<>();
			map.put("id", id);
			map.put("password", password);
			mapper.loginCheck(map);
			Member member = mapper.selectMemberByNo(id);
			
			System.out.println(member);
			
			if (member.getPassword().equals(password)) {
				System.out.println("비밀번호 일치");
			} else {
				System.out.println("비밀번호 불일치");
			}
			
			res.sendRedirect("/WEB-INF/view/admin.jsp");
		}
		return null;
	}

}