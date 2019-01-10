package com.yi.BookMgnProj.service.book;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yi.BookMgnProj.dao.BookMapper;
import com.yi.BookMgnProj.dao.BookMapperImpl;
import com.yi.BookMgnProj.dao.CategoryBMapper;
import com.yi.BookMgnProj.dao.CategoryBMapperImpl;
import com.yi.BookMgnProj.dao.CategoryMMapper;
import com.yi.BookMgnProj.dao.CategoryMMapperImpl;
import com.yi.BookMgnProj.dao.CategorySMapper;
import com.yi.BookMgnProj.dao.CategorySMapperImpl;
import com.yi.BookMgnProj.dao.PublisherMapper;
import com.yi.BookMgnProj.dao.PublisherMapperImpl;
import com.yi.BookMgnProj.model.Book;
import com.yi.BookMgnProj.model.CategoryB;
import com.yi.BookMgnProj.model.CategoryM;
import com.yi.BookMgnProj.model.CategoryS;
import com.yi.BookMgnProj.model.Publisher;

public class BookInsertService {
	private BookMapper bookMapper;
	private PublisherMapper publisherMapper;
	private CategoryBMapper bMapper;
	private CategoryMMapper mMapper;
	private CategorySMapper sMapper;

	public BookInsertService() {
		bookMapper = BookMapperImpl.getInstance();
		publisherMapper = PublisherMapperImpl.getInstance();
		bMapper = CategoryBMapperImpl.getInstance();
		mMapper = CategoryMMapperImpl.getInstance();
		sMapper = CategorySMapperImpl.getInstance();
	}

	public List<Book> selectBookByAll() {
		return bookMapper.selectBookByAll();
	}

	public int insertBook(Book book) {
		return bookMapper.insertBook(book);
	}

	public List<Book> selectbookbyOther(Map<String, Object> map) {
		return bookMapper.selectbookbyOther(map);
	}

	public List<Publisher> selectPublisherByAll() {
		return publisherMapper.selectPublisherByAll();
	}

	public Publisher selectPublisherByName(Publisher publisher) {
		return publisherMapper.selectPublisherByName(publisher);
	}

	public int insertPublisher(Publisher publisher) {
		return publisherMapper.insertPublisher(publisher);
	}

	public List<CategoryB> selectCategoryBByAll() {
		return bMapper.selectCategoryBByAll();
	}

	public List<CategoryM> selectCategoryMByAll() {
		return mMapper.selectCategoryMByAll();
	}

	public List<CategoryM> selectCategoryMByBNo(CategoryB cateB) {
		return mMapper.selectCategoryMByBNo(cateB);
	}

	public List<CategoryS> selectCategorySByAll() {
		return sMapper.selectCategorySByAll();
	}

	public List<CategoryS> selectCategorySByBNoMno(CategoryM cateM) {
		return sMapper.selectCategorySByBNoMno(cateM);
	}

	public int updatetBook(Book book) {
		return bookMapper.updateBook(book);
	}
	
	public CategoryS categoryS(HashMap<String, Integer> map) {
		return sMapper.categoryS(map);
	}
}
