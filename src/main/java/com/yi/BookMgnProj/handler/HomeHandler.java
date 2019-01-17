package com.yi.BookMgnProj.handler;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.BookMgnProj.model.BookBest10;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.Best3Service;

public class HomeHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		
		return "/WEB-INF/view/home.jsp";
	}

}
