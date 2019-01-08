<%@page import="java.util.Date"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<% 
		String BookCode = request.getParameter("BookCode");
		System.out.println("BookCode = " + BookCode);
	%>
	{
		"date":"<%=BookCode %>",
		"id":"<%=BookCode %>"
	}
