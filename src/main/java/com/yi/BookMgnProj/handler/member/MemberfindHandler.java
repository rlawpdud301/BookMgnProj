package com.yi.BookMgnProj.handler.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.BookMgnProj.mvc.CommandHandler;

public class MemberfindHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			return "/WEB-INF/view/member/memberfind.jsp";
		}
		if(req.getMethod().equalsIgnoreCase("post")){
			Map<String, Object> map = new HashMap<>();
			
			if (req.getParameter("name") != null) {
				map.put("korName", req.getParameter("name").trim());
			}

			if (req.getParameter("id") != null) {
				map.put("memberNo", req.getParameter("id").trim());
			}
			
			String phone = (req.getParameter("tel1")+"-"+ req.getParameter("tel2") + "-" + req.getParameter("tel3")).trim();
			map.put("phone", phone);
			
			
			
		}
		return null;
	}

}
