package com.yi.BookMgnProj.handler.rent;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.yi.BookMgnProj.model.OverduePopup;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.OverduedetailService;

public class ReturnOverduedetailHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		OverduedetailService service = new OverduedetailService();
		Map<String, Object> map = new HashMap<String, Object>();
		if(req.getMethod().equalsIgnoreCase("get")){
			List<OverduePopup> list = service.selectAllbyMap(map);
			req.setAttribute("list", list);
			return "/WEB-INF/view/rent/bookReturnOverdueinfo.jsp";
		}
		if(req.getMethod().equalsIgnoreCase("post")){
			System.out.println("ReturnOverduedetailHandler-post");
			if(req.getParameter("over")!= null){
				if(req.getParameter("over").equals("1")){
					map.put("over", 1);
				}
			}
			
			if(req.getParameter("selected")!=null){
				map.put(req.getParameter("selected").trim(),req.getParameter("item").trim());
			}
			if(req.getParameter("rentalNo")!=null){
				map.put("rentalNo",req.getParameter("rentalNo"));
			}
			List<OverduePopup> list = service.selectAllbyMap(map);
			
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(list);
			System.out.println(json);

			
			res.setContentType("application/json;charset=utf-8");
			PrintWriter pw = res.getWriter();
			pw.println(json);
			pw.flush();// 고객에게 데이터를보냄
			return null;
		}
		return null;  
	}

}
