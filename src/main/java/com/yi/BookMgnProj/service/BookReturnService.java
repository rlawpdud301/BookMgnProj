package com.yi.BookMgnProj.service;

import com.yi.BookMgnProj.dao.BookMapper;
import com.yi.BookMgnProj.dao.BookMapperImpl;
import com.yi.BookMgnProj.dao.BookRentalInfoMapper;
import com.yi.BookMgnProj.dao.BookRentalInfoMapperImpl;
import com.yi.BookMgnProj.dao.MemberRentalInfoMapper;
import com.yi.BookMgnProj.dao.MemberRentalInfoMapperImpl;

public class BookReturnService {
	private BookRentalInfoMapper bookRentalInfoMapper = BookRentalInfoMapperImpl.getInstance();
	private BookMapper bookMapper = BookMapperImpl.getInstance();
	private MemberRentalInfoMapper memberRentalInfoMapper = MemberRentalInfoMapperImpl.getInstance();
	
	
}
