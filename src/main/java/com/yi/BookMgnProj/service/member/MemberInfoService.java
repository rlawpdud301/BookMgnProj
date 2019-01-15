package com.yi.BookMgnProj.service.member;

import java.util.List;

import com.yi.BookMgnProj.dao.BookRentalInfoMapper;
import com.yi.BookMgnProj.dao.BookRentalInfoMapperImpl;
import com.yi.BookMgnProj.dao.MemberMapper;
import com.yi.BookMgnProj.dao.MemberMapperImpl;
import com.yi.BookMgnProj.model.BookRentalInfo;
import com.yi.BookMgnProj.model.BookStat;
import com.yi.BookMgnProj.model.Member;

public class MemberInfoService {
	private MemberMapper memberMapper;
	private BookRentalInfoMapper bookRentalInfoMapper;

	public MemberInfoService() {
		memberMapper = MemberMapperImpl.getInstance();
		bookRentalInfoMapper = BookRentalInfoMapperImpl.getInstance();
	}

	public Member selectMemberByNo(String member) {
		return memberMapper.selectMemberByNo(member);
	}

	public List<BookRentalInfo> selectBookByMemberNoReturnDateNull(Member member) {
		return bookRentalInfoMapper.selectBookByMemberNoReturnDateNull(member);
	}

	public List<BookRentalInfo> selectBookRentalMemberInfo(Member member) {
		return bookRentalInfoMapper.selectBookRentalMemberInfo(member);
	}

	public List<BookStat> selectRentalBookInfoByCategoryB(Member member) {
		return bookRentalInfoMapper.selectRentalBookInfoByCategoryB(member);
	}
}
