package com.yi.BookMgnProj.handler;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.BookMgnProj.model.BookBest10;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.Best3Service;

public class HomeHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		Map<String, Object> map = new HashMap<>();
		if(req.getMethod().equalsIgnoreCase("get")){
			Best3Service service = new Best3Service();
			Date fristrentalDate = new Date();
			fristrentalDate.setDate(fristrentalDate.getDate()-1);
			Date lastrentalDate = new Date();
			lastrentalDate.setDate(fristrentalDate.getDate()-7);
			map.put("fristrentalDate", fristrentalDate);
			map.put("lastrentalDate", lastrentalDate);
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		
			List<BookBest10> list = service.selectBookBest10ByMap(map);
			req.setAttribute("list", list);
			
			req.setAttribute("fristrentalDate", date.format(fristrentalDate));
			req.setAttribute("lastrentalDate", date.format(lastrentalDate));

		
			return "/WEB-INF/view/home.jsp";
		}
		
		return "/WEB-INF/view/home.jsp";
	}

}
