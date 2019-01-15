package com.yi.BookMgnProj.handler.member;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		else if(req.getMethod().equalsIgnoreCase("post")){
			MemberService service = new MemberService();
			if(req.getParameter("list") != null){
				
				List<Member> list = service.selectMemberByAll();
				
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(list);
				res.setContentType("application/json;charset=utf-8");
				System.out.println("json은"+json);
				PrintWriter pw = res.getWriter();
				pw.print(json);
				pw.flush();
			}
			 if(req.getParameter("memberNo") != null){
					Map<String, String> map = new HashMap<>(); 	
					String no = req.getParameter("memberNo");
					map.put("memberNo", no);
					List<Member> mnolist = service.searchMemberNo(map);
					ObjectMapper mnoOm = new ObjectMapper();
					String mnojson = mnoOm.writeValueAsString(mnolist);
					res.setContentType("application/json;charset=utf-8");
					System.out.println("mjson은"+mnojson);
					PrintWriter mnpw = res.getWriter();
					mnpw.print(mnojson);
					mnpw.flush();
			}
			 if(req.getParameter("korName") != null){
					Map<String, String> map = new HashMap<>(); 	
					String name = req.getParameter("korName");
					map.put("korName", name);
					List<Member> mnalist = service.searchMemberName(map);
					ObjectMapper mnaOm = new ObjectMapper();
					String mnajson = mnaOm.writeValueAsString(mnalist);
					res.setContentType("application/json;charset=utf-8");
					System.out.println("mjson은"+mnajson);
					PrintWriter mnpw = res.getWriter();
					mnpw.print(mnajson);
					mnpw.flush();			
			}
			 if(req.getParameter("phone") != null){
					Map<String, String> map = new HashMap<>(); 	
					String phone = req.getParameter("phone");
					map.put("phone", phone);
					List<Member> phonelist = service.searchMemberPhone(map);
					ObjectMapper mnaOm = new ObjectMapper();
					String phonejson = mnaOm.writeValueAsString(phonelist);
					res.setContentType("application/json;charset=utf-8");
					System.out.println("mjson은"+phonejson);
					PrintWriter mnpw = res.getWriter();
					mnpw.print(phonejson);
					mnpw.flush();
			}
		}	
		return null;
	
	}
	
}
