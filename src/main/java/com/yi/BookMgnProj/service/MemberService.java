package com.yi.BookMgnProj.service;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.yi.BookMgnProj.dao.MemberMapper;
import com.yi.BookMgnProj.dao.MemberMapperImpl;
import com.yi.BookMgnProj.model.Member;
import com.yi.BookMgnProj.mvc.MyBatisSqlSessionFactory;

public class MemberService {
	private static MemberMapper dao = MemberMapperImpl.getInstance();

	public int insertMember(Member member) {
		return dao.insertMember(member);
	}

	public List<Member> selectMemberByNoList(Member member) {
		return dao.selectMemberByNoList(member);
	}

	public Member selectMemberByNo(String member) {
		return dao.selectMemberByNo(member);
	}

	public boolean duplicatedJumin(String jumin) {
		try {
			Member mem = dao.selectMemberByNojumin(jumin);
			System.out.println("mem은" + mem);
			if (mem == null) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public List<Member> selectMemberByAll() {
		return dao.selectMemberByAll();
	}

	public Member searchIdAndPw(Map<String, Object> map) {
		return dao.searchIdAndPw(map);
	}

	public int changePW(Map<String, Object> map) {
		return dao.changePW(map);
	}
	public List<Member> searchMembernoRent(Map<String, String> map){
		return dao.searchMembernoRent(map);
	}
	/*회원번호, 회원이름, 전화번호로 검색*/
	public List<Member> searchMemberNo(Map<String, String> map){
		return dao.searchMemberNo(map);
	}
	public List<Member> searchMemberName(Map<String, String> map){
		return dao.searchMemberName(map);
	}
	public List<Member> searchMemberPhone(Map<String, String>map){
		return dao.searchMemberPhone(map);
	}

	public int updateMember(Member member) {
		return dao.updateMember(member);
	}

	public int updateMember2(Member member) {
		return dao.updateMember2(member);
	}

	public int deleteMemberNo(Map<String, Object> map) {
		return dao.deleteMemberNo(map);
	}
}
