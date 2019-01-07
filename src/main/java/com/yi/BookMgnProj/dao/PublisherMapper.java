package com.yi.BookMgnProj.dao;

import java.util.List;

import com.yi.BookMgnProj.model.Publisher;

public interface PublisherMapper {
	List<Publisher> selectPublisherByAll();

	Publisher selectPublisherByNo(Publisher publisher);

	Publisher selectPublisherByName(Publisher publisher);

	int insertPublisher(Publisher publisher);
}
