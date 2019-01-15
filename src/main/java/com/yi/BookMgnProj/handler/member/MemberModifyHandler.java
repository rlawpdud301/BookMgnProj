package com.yi.BookMgnProj.handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yi.BookMgnProj.dao.MemberMapper;
import com.yi.BookMgnProj.dao.MemberMapperImpl;
import com.yi.BookMgnProj.model.AUTH;
import com.yi.BookMgnProj.model.Member;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.MemberService;

public class MemberModifyHandler implements CommandHandler {
	private MemberService service = new MemberService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			HttpSession session = req.getSession(false);
			AUTH auth = (AUTH) session.getAttribute("AUTH");
			String id = auth.getId();
			Member member = service.selectMemberByNo(id);
			req.setAttribute("Member", member);

			return "/WEB-INF/view/member/memberModifyForm.jsp";
		}

		else if (req.getMethod().equalsIgnoreCase("post")) {
			String uploadPath = req.getRealPath("upload");
			HttpSession session = req.getSession(false);
			AUTH auth = (AUTH) session.getAttribute("AUTH");
			String id = auth.getId();
			Member member = service.selectMemberByNo(id);
			req.setAttribute("Member", member);
			String memberPhote = member.getPhoto();
			String memberPhone = member.getPhone();
			String memberEmail = member.getEmail();
			String memberAddress = member.getAddress();
			
			try {
				MultipartRequest multi = new MultipartRequest(req, uploadPath, 1024 * 1024 * 10, "utf-8",
						new DefaultFileRenamePolicy());
				String photo = multi.getFilesystemName("photo");
				String password = multi.getParameter("password");
				String tel1 = multi.getParameter("tel1");
				String tel2 = multi.getParameter("tel2");
				String tel3 = multi.getParameter("tel3");
				String email1 = multi.getParameter("email1");
				String email2 = multi.getParameter("emailbox");
				String address = multi.getParameter("address");
				String address2 = multi.getParameter("address2");
				String fullPhone = tel1 + "-" + tel2 + "-" + tel3;
				String fullEmail = email1 + "@" + email2;
				String fullAddress = address + "," + address2;
				
				if (photo == null) {
					member.setPhoto(memberPhote);
				} else {
					member.setPhoto(photo);
				}
				
				if (!tel1.equals("") && !tel2.equals("") && !tel3.equals("")) {
					member.setPhone(fullPhone);
				} else {
					member.setPhone(memberPhone);
				}
				
				if (!email1.equals("") && !email2.equals("")) {
					member.setEmail(fullEmail);
				} else {
					member.setEmail(memberEmail);
				}
				
				if (!address.equals("") && !address2.equals("")) {
					member.setAddress(fullAddress);
				} else {
					member.setAddress(memberAddress);
				}
				
				if (!password.equals("")) {
					member.setPassword(password);
					service.updateMember(member);
				} else {
					service.updateMember2(member);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return "/WEB-INF/view/member/modifySuccess.jsp";
		}

		return null;
	}

}
