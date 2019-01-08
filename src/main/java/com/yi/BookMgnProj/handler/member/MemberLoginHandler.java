package com.yi.BookMgnProj.handler.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.BookMgnProj.dao.MemberMapper;
import com.yi.BookMgnProj.dao.MemberMapperImpl;
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

			MemberMapper service = MemberMapperImpl.getInstance();
			Map<String, Object> map = new HashMap<>();
			map.put("id", id);
			map.put("password", password);
			Member member = service.loginCheck(map);
			System.out.println(id);
			System.out.println(password);
			System.out.println(member);

			try {
				if (member != null) {
					req.setAttribute("AUTH", member);
					return "/WEB-INF/view/home.jsp";
				} else {
					System.out.println("로그인 실패");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {

			}
		}
		return null;
	}

}