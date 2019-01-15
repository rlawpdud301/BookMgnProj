package com.yi.BookMgnProj.handler.book;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yi.BookMgnProj.model.Book;
import com.yi.BookMgnProj.model.BookDetail;
import com.yi.BookMgnProj.model.CategoryB;
import com.yi.BookMgnProj.model.CategoryM;
import com.yi.BookMgnProj.model.CategoryS;
import com.yi.BookMgnProj.model.Publisher;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.book.BookInsertService;
import com.yi.BookMgnProj.service.book.BookModifyService;

public class BookModifyHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		BookModifyService service = new BookModifyService();

		if (req.getMethod().equalsIgnoreCase("get")) {
			String no = req.getParameter("no");
			BookDetail book = service.selectBookDetailByBookCode(no);
			req.setAttribute("Book", book);

			return "/WEB-INF/view/book/bookModifyForm.jsp";
		}

		else if (req.getMethod().equalsIgnoreCase("post")) {
			String uploadPath = req.getRealPath("upload");
			File dir = new File(uploadPath);
			if (dir.exists() == false) { // upload폴더가 없을때, 만들어지게한다.
				dir.mkdirs();
			}

			try {
				MultipartRequest multi = new MultipartRequest(req, uploadPath, 1024 * 1024 * 10, "utf-8",
						new DefaultFileRenamePolicy());
				
				String bookCode = multi.getParameter("bookCode");
				
				Book book = new Book();
				book.setBookCode(bookCode);
				book = service.selectBookBybookCodeOne(book);

				String title = multi.getParameter("title");

				String author = multi.getParameter("author");

				String translator = multi.getParameter("translator");

				String pubName = multi.getParameter("publisher");
				
				String price = multi.getParameter("price");
				
				String image = multi.getFilesystemName("image");
				
				boolean rentalPossible = true;
				
				int won = Integer.parseInt(price);
				
				Publisher publisher = new Publisher();
				int i = 0;
				String pubNo = "";

				if (!pubName.equals("")) {
					publisher.setPubName(pubName);
					if (service.selectPublisherByName(publisher) != null) {
						pubNo = service.selectPublisherByName(publisher).getPubNo();
						publisher.setPubNo(pubNo);
					} else {
						i = service.selectPublisherByAll().size() + 1;
						pubNo = String.format("P%04d", i);
						publisher.setPubNo(pubNo);
						service.insertPublisher(publisher);
					}
				}
				
				Map<String, Object> map = new HashMap<>();
				map.put("bookCode", bookCode);
				map.put("title", title);
				map.put("author", author);
				map.put("translator", translator);
				map.put("pubNo", publisher);
				map.put("price", won);
				
				if (image != null) {
					map.put("image", image);
				} else {
					map.put("image", book.getImage());
				}
				
				map.put("rentalPossible", rentalPossible);
				
				service.updateBookMap(map);
				
				return "/WEB-INF/view/book/bookModifySuccess.jsp";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

}
