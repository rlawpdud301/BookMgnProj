package com.yi.BookMgnProj.handler.book;

import java.io.PrintWriter;
import java.util.ArrayList;
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
		HashMap<String, Object> map = new HashMap<>();
		CategoryService service = new CategoryService();

		String cateB = req.getParameter("cateB");
		String cateM = req.getParameter("cateM");
		if (cateB == null && cateM == null) {
			List<CategoryB> listB = new ArrayList<>();
			CategoryB cB = new CategoryB();
			cB.setbName("선택해주세요");
			listB.add(cB);
			for (CategoryB categoryB : service.selectCategoryBByAll()) {
				listB.add(categoryB);
			}
			map.put("list", listB);
		} else if (cateM == null) {
			List<CategoryM> listM = new ArrayList<>();
			CategoryM cM = new CategoryM();
			cM.setmName("선택해주세요");
			listM.add(cM);
			CategoryB b = new CategoryB();
			b.setbCode(Integer.parseInt(cateB));
			for (CategoryM categoryM : service.selectCategoryMByBNo(b)) {
				listM.add(categoryM);
			}
			map.put("list", listM);
		} else {
			List<CategoryS> listS = new ArrayList<>();
			CategoryS cS = new CategoryS();
			cS.setsName("선택해주세요");
			listS.add(cS);
			CategoryM m = new CategoryM();
			m.setmCode(Integer.parseInt(cateM));
			CategoryB b = new CategoryB();
			b.setbCode(Integer.parseInt(cateB));
			m.setbCode(b);
			for (CategoryS categoryS : service.selectCategorySByBNoMno(m)) {
				listS.add(categoryS);
			}
			map.put("list", listS);
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
