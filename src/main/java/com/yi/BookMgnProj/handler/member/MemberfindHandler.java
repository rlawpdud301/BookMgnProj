package com.yi.BookMgnProj.handler.member;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.BookMgnProj.model.Member;
import com.yi.BookMgnProj.mvc.CommandHandler;
import com.yi.BookMgnProj.service.MemberService;

public class MemberfindHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			return "/WEB-INF/view/member/memberfind.jsp";
		}
		if(req.getMethod().equalsIgnoreCase("post")){
			Map<String, Object> map = new HashMap<>();
			MemberService service = new MemberService();
			String phone = (req.getParameter("tel1")+"-"+ req.getParameter("tel2") + "-" + req.getParameter("tel3")).trim();
			map.put("phone", phone);
						
			if (req.getParameter("name") != null) {
				map.put("korName", req.getParameter("name").trim());
				
				Member member = service.searchIdAndPw(map);
				if(member==null){
					req.removeAttribute("name");
					req.removeAttribute("phone");
					req.setAttribute("result", "정보가 올바르지 않습니다 확인바랍니다.");
					return "/WEB-INF/view/member/memberfind.jsp";
				}
				req.removeAttribute("name");
				req.removeAttribute("phone");
				req.setAttribute("result","고객님의 아이디는"+ member.getMemberNo() + "입니다");
				
				/*res.sendRedirect("find.do");*/
				/*return null;*/
				return "/WEB-INF/view/member/memberfindsuccess.jsp";
			}

			if (req.getParameter("id") != null) {
				map.put("memberNo", req.getParameter("id").trim());
				String pass = "";
				for (int i = 0; i < 4; i++) {
					double random = Math.random();
					int num = (int) (random * 26) + 65;
					String a = ((char) num + "").trim();
					pass = pass + a;
				}
				for (int i = 0; i < 5; i++) {
					double random = Math.random();
					int num = (int) (random * 10);
					String a = (num + "").trim();
					pass = pass + a;
				}
				map.put("password", pass);
				int result = service.changePW(map);
				
				if (result == 1) {
					req.setAttribute("result", "임시 비밀번호가 이메일로 발송되었습니다 로그인후 반드시 변경해주세요.");
					req.removeAttribute("id");
					req.removeAttribute("phone");
					Member member = service.searchIdAndPw(map);
					String from = "rlawpdud301";
			        String passWd = "dnlqh1220";
			        String[] to = { member.getEmail() }; // 보낼 메일 목록
			        String subject = "○○도서관입니다 비밀번호를 반드시 변경해주세요";  // 메일 제목
			        String body = "고객님의 임시 비밀번호는 "+pass+" 입니다 로그인하여 비밀번호를 변경해주세요 ";       // 메일 내용

			        sendFromGMail(from, passWd, to, subject, body);
			        return "/WEB-INF/view/member/memberfindsuccess.jsp";
				}
				req.removeAttribute("id");
				req.removeAttribute("phone");
				req.setAttribute("result", "정보가 올바르지 않습니다 확인바랍니다.");
				return "/WEB-INF/view/member/memberfind.jsp";
			}
			
			
			
			
			
		}
		return "/WEB-INF/view/member/memberfind.jsp";
	}
	private static void sendFromGMail(String from, String pass, String[] to, String subject, String body) {
        Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);
   /*  JOptionPane.showConfirmDialog(null, message);*/

        try {
            message.setFrom(new InternetAddress(from));
            InternetAddress[] toAddress = new InternetAddress[to.length];

            // To get the array of addresses
            for( int i = 0; i < to.length; i++ ) {
                toAddress[i] = new InternetAddress(to[i]);
            }

            for( int i = 0; i < toAddress.length; i++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }

            message.setSubject(subject);
            message.setText(body);
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }
        catch (AddressException ae) {
            ae.printStackTrace();
        }
        catch (MessagingException me) {
            me.printStackTrace();
        }
    }

}
