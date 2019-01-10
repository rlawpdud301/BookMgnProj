package com.yi.BookMgnProj.handler.book;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.yi.BookMgnProj.model.Book;
import com.yi.BookMgnProj.model.CategoryB;
import com.yi.BookMgnProj.model.CategoryM;
import com.yi.BookMgnProj.model.CategoryS;
import com.yi.BookMgnProj.model.Publisher;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.book.BookInsertService;
import com.yi.BookMgnProj.service.book.CategoryService;

public class BookInsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			CategoryService service = new CategoryService();
			List<CategoryB> listB = service.selectCategoryBByAll();
			req.setAttribute("listB", listB);
			return "/WEB-INF/view/book/bookInsertForm.jsp";
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			BookInsertService service = new BookInsertService();
			
			String author = req.getParameter("author");
			
			String translator = req.getParameter("translator");
			
			String title = req.getParameter("title");
			
			String price = req.getParameter("price");
			int won = Integer.parseInt(price);
			
			String image = req.getParameter("image");
			
			if (image.equals("")) {
				image = "default.jpg";
			}
			
			String bCode = req.getParameter("cateB");
			int b = Integer.parseInt(bCode);
			
			String mCode = req.getParameter("cateM");
			int m = Integer.parseInt(mCode);
			
			String sCode = req.getParameter("cateS");
			int s = Integer.parseInt(sCode);
			
			String pubName = req.getParameter("publisher");
			
			CategoryB cateB = service.selectCategoryBByAll().get(b);
			
			CategoryM cateM = service.selectCategoryMByBNo(cateB).get(m);
			
			HashMap<String, Integer> map2 = new HashMap<>();
			map2.put("b", b);
			map2.put("m", m);
			map2.put("s", s);
			
			CategoryS cateS = service.categoryS(map2);

			Book book = new Book();

			book.setAuthor(author);
			book.setTranslator(translator);
			book.setTitle(title);
			book.setPrice(won);
			book.setRentalPossible(true);
			book.setImage(image);
			book.setCateBNo(cateB);
			book.setCateMNo(cateM);
			book.setCateSNo(cateS);

			Publisher publisher = new Publisher();
			int i = 0, j = 0, max = 0;
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
			} else {
				JOptionPane.showMessageDialog(null, "출판사를 입력해주세요.");
			}
			System.out.println(publisher.getPubNo());
			book.setPubNo(publisher);

			Map<String, Object> map = new HashMap<>();

			map.put("title", book.getTitle());
			map.put("author", book.getAuthor());
			map.put("translator", book.getTranslator());
			map.put("pubNo", book.getPubNo().getPubNo());

			if (service.selectbookbyOther(map) != null) {
				if (service.selectbookbyOther(map).size() > 0) {
					i = service.selectbookbyOther(map).get(0).getBookNo();
					j = service.selectbookbyOther(map).size() + 1;
				} else {
					for (int k = 0; k < service.selectBookByAll().size(); k++) {
						if (max < service.selectBookByAll().get(k).getBookNo()) {
							max = service.selectBookByAll().get(k).getBookNo();
						}
					}
					i = max + 1;
					j = 1;
				}
			}
			
			String bookCode = String.format("%s%05d%02d", bCode + mCode + sCode, i, j);
			book.setBookCode(bookCode);
			book.setBookNo(i);
			
			service.insertBook(book);
			return "/WEB-INF/view/book/bookInsertForm.jsp";
		}
		return null;
	}

}
