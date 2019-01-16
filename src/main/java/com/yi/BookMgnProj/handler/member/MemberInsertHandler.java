package com.yi.BookMgnProj.handler.member;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yi.BookMgnProj.model.Member;
import com.yi.BookMgnProj.model.MemberRentalInfo;
import com.yi.BookMgnProj.model.Overdue;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.MemberService;

public class MemberInsertHandler implements CommandHandler {
	private MemberService service;
	private String mn;
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			return "/WEB-INF/view/member/memberInsertForm.jsp";
		}
		else if(req.getMethod().equalsIgnoreCase("post")){
			String uploadPath = req.getRealPath("upload");
			System.out.println("uploadHandler --------------------- ");
			File dir = new File(uploadPath);
			if(dir.exists() == false){ //upload폴더가 없을때, 만들어지게한다.
				dir.mkdirs();
			}
			try{
				MultipartRequest multi = new MultipartRequest(req, 
															uploadPath,//서버측 upload경로
															1024*1024*10, //10M
															"utf-8",
															new DefaultFileRenamePolicy()//이름을 '자동'으로해줌
															);				
				String file1 = multi.getFilesystemName("file1");//file1의 키의 파일의 이름을 받아옴
								
				
				service = new MemberService();
				String password = multi.getParameter("password");
				String korName = multi.getParameter("korName");
				String engName = multi.getParameter("engName");
				String tel1 = multi.getParameter("tel1");
				String tel2 = multi.getParameter("tel2");
				String tel3 = multi.getParameter("tel3");
				String jumin1 = multi.getParameter("jumin1");
				String jumin2 = multi.getParameter("jumin2");
				String email1 = multi.getParameter("email1"); 
				String email2 = multi.getParameter("emailbox");
				String address = multi.getParameter("address");
				String address2 = multi.getParameter("address2");
				boolean checkbox = multi.getParameter("checkbox") != null;
				String uni = multi.getParameter("uni");
				String photo = file1;
				
				Member member = new Member();
				member.setPassword(password);
				member.setKorName(korName);
				member.setEngName(engName);			
				member.setPhone(tel1+"-"+tel2+"-"+tel3);
				member.setJumin(jumin1 +"-"+ jumin2);
				member.setEmail(email1+"@"+email2);
				member.setAddress(address + "," + address2);
				member.setAdmin(checkbox);
				member.setUniqueness(uni);
				member.setPhoto(photo);
				
				if(file1 == null){
					member.setPhoto("noman.png");
				}else{
					member.setPhoto(photo);
				}
				
				String make = multi.getParameter("engName").substring(0, 1);
				System.out.println("make는:"+make);
				int i = 0;
				
				if(service.selectMemberByNoList(member).equals(null)){
					make = make + "0001";
				}else{
					i = service.selectMemberByNoList(member).size()+1;
					member.setMemberNo(make);
				}
				mn = String.format("%s%04d", make, i);
				mn = mn.toUpperCase();
				member.setMemberNo(mn);
				service.insertMember(member);
				insertRentailInfo();
				insertOverdue();
				req.setAttribute("result","고객님의 아이디는"+mn+"입니다.");
				return "/WEB-INF/view/member/insertSuccess.jsp";				
			}catch(Exception e){
				e.printStackTrace();
			}		
		}
		return null;
	}
	public void insertRentailInfo(){
		MemberRentalInfo memberRentalInfo = new MemberRentalInfo();
		memberRentalInfo.setMemberNo(mn);
		memberRentalInfo.setGrade(1);
		memberRentalInfo.setNowTotal(3);
		memberRentalInfo.setTotal(0);
		int res = service.insertMemberRentalInfo(memberRentalInfo);
	}
	public void insertOverdue(){
		Overdue overdue = new Overdue();
		overdue.setMemberNo(mn);
		overdue.setStopDate(0);
		overdue.setOverdueCount(0);
		overdue.setRentalAuthority(true);
		overdue.setStopEndDate(new Date());
		service.insertoverDue(overdue);
	}
}
