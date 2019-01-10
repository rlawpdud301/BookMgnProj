package com.yi.BookMgnProj.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.yi.BookMgnProj.model.Member;



public interface MemberMapper {
	Member selectMemberByNo(Member member);

	List<Member> selectMemberByAll();

	int insertMember(Member member);

	int updateMember(Member member);
	
	int updateMember2(Member member);
	
	int updateDetail(Member member);
	
	int deleteMember(int id);

	int deleteMember(String id);
	
	int deleteMemberNo(Map<String, Object> map);
	
	Member selectMemberByNo(String member);
	
	List<Member> selectMemberByMemberNo();
	
	List<Member> selectMemberByNoList(Member member);
	
	
	//�봽濡쒖떆�� �빐�떆留�
//	List<Map<String, String>> searchMemberNo(Map<String, String> map);
	List<Member> searchMemberNo(Map<String, String> map);

	/*Member searchMemberName(Map<String, String> map);*/
	List<Member> searchMemberName(Map<String, String> map);
	
	List<Member> searchMemberPhone(Map<String, String>map);
	//���뿬�맂 梨� �솗�씤�븯湲� �빐�돩留�
	List<Member> searchMembernoRent(Map<String, String> map);
	
	Member searchIdAndPw(Map<String, Object> map);
	
	int changePW(Map<String, Object> map);

	/*List<Member> selectMemberByNojumin(Member member);*/
	Member selectMemberByNojumin(String member);
	
	Member loginCheck(Map<String, Object> map);
}
