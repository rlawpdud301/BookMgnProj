package com.yi.BookMgnProj.dao;

import java.util.List;
import java.util.Map;

import com.yi.BookMgnProj.model.MemberBest10;

public interface MemberBest10Mapper {
	List<MemberBest10> selectMemberBest10ByMap(Map<String, Object> map);
}
