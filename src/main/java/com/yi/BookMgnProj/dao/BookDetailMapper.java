package com.yi.BookMgnProj.dao;

import java.util.List;
import java.util.Map;

import com.yi.BookMgnProj.model.BookDetail;

public interface BookDetailMapper {
	List<BookDetail> selectBookDetailByMap(Map<String, Object> map);
}
