package com.yi.BookMgnProj.handler.member;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.yi.BookMgnProj.model.Member;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.MemberService;

public class MemberSearchHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			return "/WEB-INF/view/MemberSearch.jsp";
		}
		if(req.getMethod().equalsIgnoreCase("post")){
			MemberService service = new MemberService();
			List<Member> list = service.selectMemberByAll();
			
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(list);
			res.setContentType("application/json;charset=utf-8");
			System.out.println("json은"+json);
			PrintWriter pw = res.getWriter();
			pw.print(json);
			pw.flush();
		}
		return null;
	}

}
