package com.yi.BookMgnProj.handler.book;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.yi.BookMgnProj.model.CategoryB;
import com.yi.BookMgnProj.model.CategoryM;
import com.yi.BookMgnProj.model.CategoryS;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.book.CategoryService;

public class BookCategoryHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		CategoryService service = new CategoryService();
		HashMap<String, Object> map = new HashMap<>();
		String cateB = req.getParameter("cateB");
		String cateM = req.getParameter("cateM");
		int bCode = Integer.parseInt(cateB);
		CategoryB b = new CategoryB();
		b.setbCode(bCode);

		List<CategoryM> listM = service.selectCategoryMByBNo(b);
		map.put("listM", listM);

		if (cateM != null) {
			int mCode = Integer.parseInt(cateM);
			CategoryM m = new CategoryM();
			m.setmCode(mCode);
			m.setbCode(b);
			
			List<CategoryS> listS = service.selectCategorySByBNoMno(m);
			map.put("listS", listS);
		}

		ObjectMapper om = new ObjectMapper();
		String json = om.writeValueAsString(map);

		res.setContentType("application/json;charset=utf-8");
		PrintWriter pw = res.getWriter();
		pw.print(json);
		pw.flush();

		return null;
	}

}
