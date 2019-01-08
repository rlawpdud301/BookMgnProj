package com.yi.BookMgnProj.handler.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.BookMgnProj.dao.CategoryBMapper;
import com.yi.BookMgnProj.dao.CategoryBMapperImpl;
import com.yi.BookMgnProj.dao.CategoryMMapper;
import com.yi.BookMgnProj.dao.CategoryMMapperImpl;
import com.yi.BookMgnProj.dao.CategorySMapper;
import com.yi.BookMgnProj.dao.CategorySMapperImpl;
import com.yi.BookMgnProj.model.CategoryB;
import com.yi.BookMgnProj.model.CategoryM;
import com.yi.BookMgnProj.model.CategoryS;
import com.yi.BookMgnProj.mvc.CommandHandler;

public class BookInsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			CategoryBMapper bMapper = CategoryBMapperImpl.getInstance();
			List<CategoryB> categoryBs = bMapper.selectCategoryBByAll();
			CategoryMMapper mMapper = CategoryMMapperImpl.getInstance();
			List<CategoryM> categoryMs = mMapper.selectCategoryMByAll();
			CategorySMapper sMapper = CategorySMapperImpl.getInstance();
			List<CategoryS> categorySs = sMapper.selectCategorySByAll();
			req.setAttribute("CategoryB", categoryBs);
			req.setAttribute("CategoryM", categoryMs);
			req.setAttribute("CategoryS", categorySs);
			return "/WEB-INF/view/book/bookInsertForm.jsp";
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			return "/WEB-INF/view/book/bookInsertForm.jsp";
		}
		return null;
	}

}
