package com.yi.BookMgnProj;

import java.util.HashMap;

import org.junit.Test;

import com.yi.BookMgnProj.dao.CategorySMapper;
import com.yi.BookMgnProj.dao.CategorySMapperImpl;
import com.yi.BookMgnProj.model.CategoryS;

public class BookMapperTest {

	@Test
	public void test() {
		CategorySMapper service = CategorySMapperImpl.getInstance();
		HashMap<String, Integer> map = new HashMap<>();
		map.put("b", 2);
		map.put("m", 3);
		map.put("s", 3);
		CategoryS cateS = service.categoryS(map);
		System.out.println(cateS);
	}

}
