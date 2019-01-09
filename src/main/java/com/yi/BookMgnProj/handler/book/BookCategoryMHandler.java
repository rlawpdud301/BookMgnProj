package com.yi.BookMgnProj.handler.book;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.yi.BookMgnProj.model.CategoryB;
import com.yi.BookMgnProj.model.CategoryM;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.book.CategoryService;

public class BookCategoryMHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		CategoryService service = new CategoryService();
		String cateB = req.getParameter("cateB");
		int bCode = Integer.parseInt(cateB);
		CategoryB b = new CategoryB();
		
		b.setbCode(bCode);
		List<CategoryM> listM = service.selectCategoryMByBNo(b);
		
		ObjectMapper om = new ObjectMapper();
		String json = om.writeValueAsString(listM);
		
		res.setContentType("application/json;charset=utf-8");
		PrintWriter pw = res.getWriter();
		pw.print(json);
		pw.flush();
		
		return null;
	}

}
