package com.yi.BookMgnProj.dao;

import java.util.List;

import org.apache.ibatis.annotations.Update;

import com.yi.BookMgnProj.model.Overdue;

public interface OverdueMapper {
	List<Overdue> selectOverdueByAll();

	Overdue selectOverdueByCode(Overdue overdue);

	Overdue selectOverdueByMemberNo(Overdue overdue);

	int insertOverdue(Overdue overdue);

	int updateCount(Overdue overdue);

	int updateStopDate(Overdue overdue);

	int updateAuthority(Overdue overdue);

	int updateStopEndDate(Overdue overdue);

	@Update("update overdue set stop_date = if(Datediff(stop_end_date, now())< 1, 0, Datediff(stop_end_date, now())) , rental_authority = if(Datediff(stop_end_date, now())< 1,   1, 0)")
	int updateDiffAuthority();
}
