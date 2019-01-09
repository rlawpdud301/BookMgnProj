package com.yi.BookMgnProj.handler.BookSearch;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.yi.BookMgnProj.model.Book;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.BookSearchService;

public class BooksearchJsonHamdler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String bookCode = req.getParameter("BookCode");
		Book book = new Book();
		book.setBookCode(bookCode);
		BookSearchService service = new BookSearchService();
		
		List<Book> list = service.selectbookbybookCode(book);
		
		/*json자동만드는라이브러리*/
		ObjectMapper om = new ObjectMapper();
		String json = om.writeValueAsString(list);
		System.out.println(json);
		
		res.setContentType("application/json;charset=utf-8");
		PrintWriter pw = res.getWriter();
		pw.println(json);
		pw.flush();//고객에게 데이터를보냄
		return null;
	}

}
