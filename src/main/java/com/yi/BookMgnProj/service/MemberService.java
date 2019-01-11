package com.yi.BookMgnProj.service;

import java.sql.Connection;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yi.BookMgnProj.dao.MemberMapper;
import com.yi.BookMgnProj.dao.MemberMapperImpl;
import com.yi.BookMgnProj.model.Member;
import com.yi.BookMgnProj.mvc.MyBatisSqlSessionFactory;

public class MemberService {
	private MemberMapper dao = MemberMapperImpl.getInstance();
	
	public int insertMember(Member member){
		return dao.insertMember(member);
	}
	public List<Member> selectMemberByNoList(Member member) {
		return dao.selectMemberByNoList(member);
	}
/*	public List<Member> selectMemberByNojumin(Member member){
		return dao.selectMemberByNojumin(member);
	}*/
	public boolean duplicatedJumin(String jumin){
			
		try(SqlSession session = MyBatisSqlSessionFactory.openSession()){
			MemberMapper dao = session.getMapper(MemberMapper.class);
			Member mem = dao.selectMemberByNojumin(jumin);
			System.out.println("mem은"+mem);
			if(mem == null){
				return true;
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		return false;
	}

}	
