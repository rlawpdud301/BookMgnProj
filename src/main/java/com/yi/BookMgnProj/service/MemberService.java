package com.yi.BookMgnProj.service;

import java.util.List;

import com.yi.BookMgnProj.dao.MemberMapper;
import com.yi.BookMgnProj.dao.MemberMapperImpl;
import com.yi.BookMgnProj.model.Member;

public class MemberService {
	private MemberMapper dao = MemberMapperImpl.getInstance();
	
	public int insertMember(Member member){
		return dao.insertMember(member);
	}
	public List<Member> selectMemberByNoList(Member member) {
		return dao.selectMemberByNoList(member);
	}
}	
