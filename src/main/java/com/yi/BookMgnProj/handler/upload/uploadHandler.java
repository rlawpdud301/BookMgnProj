package com.yi.BookMgnProj.handler.upload;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.UpdatableResultSet;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yi.BookMgnProj.mvc.CommandHandler;

public class uploadHandler implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			return "WEB-INF/view/uploadForm.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
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
			String desc = multi.getParameter("desc");
			
			req.setAttribute("file1", file1);
			req.setAttribute("desc", desc);
			
/*			return "/WEB-INF/view/member/memberInsertForm.jsp";*/
/*			return "UploadForm.jsp";*/
			return "WEB-INF/view/uploadSuccess.jsp";
		}catch(Exception e){
			e.printStackTrace();
		}
		}	
		return null;
	
	}
}
