package com.yi.BookMgnProj.dao;

import java.util.List;
import java.util.Map;

import com.yi.BookMgnProj.model.OverduePopup;

public interface OverduedetailMapper {
	List<OverduePopup> selectAll();
	void updatedat();
	int selectDate();
	List<OverduePopup> selectAllRentInfo();
	List<OverduePopup> selectAllbyMap(Map<String, Object> map);
}
