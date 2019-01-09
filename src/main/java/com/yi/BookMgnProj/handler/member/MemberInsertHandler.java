package com.yi.BookMgnProj.handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.BookMgnProj.model.Member;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.MemberService;

public class MemberInsertHandler implements CommandHandler {
	private MemberService service;
	private String mn;
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			return "/WEB-INF/view/member/memberInsertForm.jsp";
		}
		else if(req.getMethod().equalsIgnoreCase("post")){
			service = new MemberService();
			String password = req.getParameter("password");
			String korName = req.getParameter("korName");
			String engName = req.getParameter("engName");
			String tel1 = req.getParameter("tel1");
			String tel2 = req.getParameter("tel2");
			String tel3 = req.getParameter("tel3");
			String jumin1 = req.getParameter("jumin1");
			String jumin2 = req.getParameter("jumin2");
			String email1 = req.getParameter("email1"); 
			String email2 = req.getParameter("emailbox");
			String address = req.getParameter("address");
			String address2 = req.getParameter("address2");
			boolean checkbox = req.getParameter("checkbox") != null;
			String uni = req.getParameter("uni");
			String photo = req.getParameter("photo");
			
			Member member = new Member();
			member.setPassword(password);
			member.setKorName(korName);
			member.setEngName(engName);			
			member.setPhone(tel1+"-"+tel2+"-"+tel3);
			member.setJumin(jumin1 + jumin2);
			member.setEmail(email1+"@"+email2);
			member.setAddress(address + address2);
			member.setAdmin(checkbox);
			member.setUniqueness(uni);
			member.setPhoto(photo);
			
			String make = req.getParameter("engName").substring(0, 1);
			System.out.println("make는:"+make);
			int i = 0;
			
			if(service.selectMemberByNoList(member).equals(null)){
				make = make + "0001";
			}else{
				i = service.selectMemberByNoList(member).size()+1;
				member.setMemberNo(make);
			}
			mn = String.format("%s%04d", make, i);
			mn = mn.toUpperCase();
			member.setMemberNo(mn);
			service.insertMember(member);
			
			return "success.do";
		}
		return null;
	}

}
