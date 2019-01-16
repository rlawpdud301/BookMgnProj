package com.yi.BookMgnProj.handler.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yi.BookMgnProj.dao.MemberMapper;
import com.yi.BookMgnProj.dao.MemberMapperImpl;
import com.yi.BookMgnProj.model.AUTH;
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

			try {
				if (member != null) {
					HttpSession session = req.getSession();
					AUTH auth = new AUTH();  
					auth.setId(member.getMemberNo());
					auth.setAdmin(member.isAdmin());
					auth.setKorName(member.getKorName());
					session.setAttribute("AUTH", auth);
					res.sendRedirect(req.getContextPath()+"/home.do");
				} else {
					String error = "회원번호 또는 비밀번호를 다시 한 번 확인해주세요.";
					req.setAttribute("Error", error);
					return "/WEB-INF/view/member/memberLoginForm.jsp";
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {

			}
		}
		return null;
	}

}