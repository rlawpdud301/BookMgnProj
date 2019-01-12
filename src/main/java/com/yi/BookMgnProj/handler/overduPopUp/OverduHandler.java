package com.yi.BookMgnProj.handler.overduPopUp;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.BookMgnProj.model.Overdue;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.OverdueService;

public class OverduHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			OverdueService service = new OverdueService();
			List<Overdue> list = service.selectOverdueByAll();
			req.setAttribute("list", list);
			return "/WEB-INF/view/overdupopup.jsp";
		}
		return null;
	}

}
