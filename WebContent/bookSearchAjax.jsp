<%@page import="java.util.List"%>
<%@page import="com.yi.BookMgnProj.service.BookSearchService"%>
<%@page import="com.yi.BookMgnProj.model.Book"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<% 
		String bookCode = request.getParameter("BookCode");
		Book book = new Book();
		book.setBookCode(bookCode);
		BookSearchService service = new BookSearchService();
		List<Book> list = service.selectbookbybookCode(book);
		System.out.println(list);
		/* request.setAttribute("list", list); */
	%>
	{
		"list":"<%=list %>"
	}
