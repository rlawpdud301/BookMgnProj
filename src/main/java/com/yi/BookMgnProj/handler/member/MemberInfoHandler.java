package com.yi.BookMgnProj.handler.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yi.BookMgnProj.model.AUTH;
import com.yi.BookMgnProj.model.BookRentalInfo;
import com.yi.BookMgnProj.model.BookStat;
import com.yi.BookMgnProj.model.Member;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.member.MemberInfoService;

public class MemberInfoHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		MemberInfoService service = new MemberInfoService();
		HttpSession session = req.getSession(false);
		AUTH auth = (AUTH) session.getAttribute("AUTH");
		String id = auth.getId();
		Member member = service.selectMemberByNo(id);
		req.setAttribute("Member", member);

		List<BookRentalInfo> list = service.selectBookRentalMemberInfo(member);
		req.setAttribute("List", list);

		List<BookRentalInfo> lists = service.selectBookByMemberNoReturnDateNull(member);
		req.setAttribute("Lists", lists);

		List<BookStat> listCateB = service.selectRentalBookInfoByCategoryB(member);
		req.setAttribute("ListCateB", listCateB);

		return "/WEB-INF/view/member/memberInfoForm.jsp";
	}
}
