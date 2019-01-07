package com.yi.BookMgnProj.dao;

import java.util.List;

import com.yi.BookMgnProj.model.OverduePopup;

public interface OverduePopupMapper {
	List<OverduePopup> selectAll();
	void updatedat();
	int selectDate();
	List<OverduePopup> selectAllRentInfo();
	
}
