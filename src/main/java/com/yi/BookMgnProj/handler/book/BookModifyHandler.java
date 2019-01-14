package com.yi.BookMgnProj.handler.book;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.BookMgnProj.dao.BookDetailMapper;
import com.yi.BookMgnProj.dao.BookDetailMapperImpl;
import com.yi.BookMgnProj.dao.BookMapper;
import com.yi.BookMgnProj.dao.BookMapperImpl;
import com.yi.BookMgnProj.model.Book;
import com.yi.BookMgnProj.model.BookDetail;
import com.yi.BookMgnProj.mvc.CommandHandler;

public class BookModifyHandler implements CommandHandler {
	private BookMapper service = BookMapperImpl.getInstance();
	private BookDetailMapper dao = BookDetailMapperImpl.getInstance();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			String no = req.getParameter("no");
			Map<String, Object> map = new HashMap<>();
			map.put("bookCode", no);
			List<BookDetail> list = dao.selectBookDetailByMap(map);
			req.setAttribute("Book", list.get(0));

			return "/WEB-INF/view/book/bookModifyForm.jsp";
		}

		if (req.getMethod().equalsIgnoreCase("post")) {
			
			return "/WEB-INF/view/book/bookModifyForm.jsp";
		}
		return null;
	}

}
