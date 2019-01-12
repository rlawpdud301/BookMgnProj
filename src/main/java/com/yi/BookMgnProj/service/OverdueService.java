package com.yi.BookMgnProj.service;

import java.util.List;
import java.util.Map;

import com.yi.BookMgnProj.dao.OverdueMapper;
import com.yi.BookMgnProj.dao.OverdueMapperImpl;
import com.yi.BookMgnProj.model.BookDetail;
import com.yi.BookMgnProj.model.Overdue;

public class OverdueService {
	private OverdueMapper overdueMapper = OverdueMapperImpl.getInstance();
	
	public List<Overdue> selectOverdueByAll() {
		return overdueMapper.selectOverdueByAll();
	}
}
