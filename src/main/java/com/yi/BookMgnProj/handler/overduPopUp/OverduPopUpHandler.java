package com.yi.BookMgnProj.handler.overduPopUp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.BookMgnProj.dao.OverduedetailMapper;
import com.yi.BookMgnProj.dao.OverduedetailMapperImpl;
import com.yi.BookMgnProj.model.Overdue;
import com.yi.BookMgnProj.model.OverduePopup;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.OverduedetailService;

public class OverduPopUpHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			OverduedetailService service = new OverduedetailService();
			Map<String, Object> map = new HashMap<String, Object>();
			/*map.put("over", 1); */
			List<OverduePopup> list = service.selectAllbyMap(map);
			req.setAttribute("list", list);
			return "/WEB-INF/view/overdupopup.jsp"; 
		}
		return null;  
	}

}


 