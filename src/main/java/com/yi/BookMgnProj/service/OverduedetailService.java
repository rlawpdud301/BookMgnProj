package com.yi.BookMgnProj.service;

import java.util.List;
import java.util.Map;

import com.yi.BookMgnProj.dao.OverduedetailMapper;
import com.yi.BookMgnProj.dao.OverduedetailMapperImpl;
import com.yi.BookMgnProj.model.OverduePopup;

public class OverduedetailService {
	private OverduedetailMapper overduePopupMapper = OverduedetailMapperImpl.getInstance();
	
	public List<OverduePopup> selectAllbyMap(Map<String, Object> map) {
		return overduePopupMapper.selectAllbyMap(map);
	}
	
}
