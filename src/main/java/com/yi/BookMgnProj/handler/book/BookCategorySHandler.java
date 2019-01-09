package com.yi.BookMgnProj.handler.book;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.yi.BookMgnProj.model.CategoryB;
import com.yi.BookMgnProj.model.CategoryM;
import com.yi.BookMgnProj.model.CategoryS;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.book.CategoryService;

public class BookCategorySHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		CategoryService service = new CategoryService();
		String cateB = req.getParameter("cateB");
		String cateM = req.getParameter("cateM");
		int bCode = Integer.parseInt(cateB);
		int mCode = Integer.parseInt(cateM);
		CategoryB b = new CategoryB();
		CategoryM m = new CategoryM();
		b.setbCode(bCode);
		m.setmCode(mCode);
		m.setbCode(b);
		List<CategoryS> listS = service.selectCategorySByBNoMno(m);

		ObjectMapper om = new ObjectMapper();
		String json = om.writeValueAsString(listS);

		res.setContentType("application/json;charset=utf-8");
		PrintWriter pw = res.getWriter();
		pw.print(json);
		pw.flush();

		return null;
	}

}
