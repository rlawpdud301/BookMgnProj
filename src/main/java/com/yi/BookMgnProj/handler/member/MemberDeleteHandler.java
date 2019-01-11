package com.yi.BookMgnProj.handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yi.BookMgnProj.dao.MemberMapper;
import com.yi.BookMgnProj.dao.MemberMapperImpl;
import com.yi.BookMgnProj.model.AUTH;
import com.yi.BookMgnProj.model.Member;
import com.yi.BookMgnProj.mvc.CommandHandler;

public class MemberDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			HttpSession session = req.getSession(false);
			AUTH auth = (AUTH) session.getAttribute("AUTH");
			String id = auth.getId();
			MemberMapper service = MemberMapperImpl.getInstance();
			Member member = service.selectMemberByNo(id);
			req.setAttribute("Member", member);
		}

		else if (req.getMethod().equalsIgnoreCase("post")) {

		}

		return null;
	}

}
