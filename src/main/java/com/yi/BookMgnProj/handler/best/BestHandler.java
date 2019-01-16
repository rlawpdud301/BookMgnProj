package com.yi.BookMgnProj.handler.best;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.codehaus.jackson.map.ObjectMapper;

import com.yi.BookMgnProj.model.BookBest10;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.Best3Service;

public class BestHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		Map<String, Object> map = new HashMap<>();
		Best3Service service = new Best3Service();
		if(req.getMethod().equalsIgnoreCase("get")){
			
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
		
			return "/WEB-INF/view/BEST.jsp";
		}
		if(req.getMethod().equalsIgnoreCase("post")){
			map.put("fristrentalDate", req.getParameter("fristrentalDate"));
			map.put("lastrentalDate", req.getParameter("lastrentalDate"));
			List<BookBest10> list = service.selectBookBest10ByMap(map);
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(list);
			res.setContentType("application/json;charset=utf-8");
			PrintWriter pw = res.getWriter();
			pw.println(json);
			pw.flush();// 고객에게 데이터를보냄

		}
		return null;
	}

}
