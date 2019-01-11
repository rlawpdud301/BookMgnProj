package com.yi.BookMgnProj.handler.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.yi.BookMgnProj.model.Member;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.MemberService;

public class duplicatedjuminHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			String jumin = req.getParameter("juminduple");
			System.out.println("주민번호는?"+jumin);
			MemberService service = new MemberService();
			boolean result = service.duplicatedJumin(jumin);
			System.out.println("결과는"+result);
			req.setAttribute("result", result);
			return "/WEB-INF/view/member/duplicatedjumin.jsp";
		}
		return null;
	}

}
