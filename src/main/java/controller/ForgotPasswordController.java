package controller;

import java.io.IOException;
import java.util.Properties;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import util.JSFunction;

@WebServlet("/forgotpassword.do")
public class ForgotPasswordController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		
		// 1. 사용자 정보를 가져온다.
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMemberDTO(id);
		
		if (!dto.getId().equals(id)) { // 입력한 아이디의 사용자가 없는 경우 
			JSFunction.alertBack(resp, "입력하신 아이디의 사용자가 존재하지 않습니다!");
			dao.close();
			return;
		}
		
		// 2. 임시 비밀번호를 생성한다.
		String cNumber = "";
		for (int i = 0; i < 8; i++) {
			int sel1 = (int) (Math.random() * 3); // 0:숫자 / 1,2:영어

			if (sel1 == 0) {
				int num = (int) (Math.random() * 10); // 0~9
				cNumber += num;
			} else {
				char ch = (char) (Math.random() * 26 + 65); // A~Z
				int sel2 = (int) (Math.random() * 2); // 0:소문자 / 1:대문자
				if (sel2 == 0) {
					ch = (char) (ch + ('a' - 'A')); // 대문자로 변경
				}
				cNumber += ch;
			}
		}
		String AuthenticationKey = cNumber.toString();
		
		// 3. 임시 비밀번호로 변경
		int result = dao.updateTempPassword(id, AuthenticationKey);
		if (result != 1) {
			JSFunction.alertBack(resp, "임시 비밀번호로 변경 중 에러가 발생했습니다!");
			dao.close();
			return;
		}
		dao.close();
		
		// 4. SMTP로 이메일을 보내기 위해 정보를 가져오기
		String subject = "[WebProject-CJY] 임시 비밀번호 발급"; // 이메일 제목
		String fromEmail = "cjy@noreply.com"; // 보내는 사람으로 표시될 이메일
		String fromUserName = "관리자"; // 보내는 사람 이름
		String toEmail = dto.getEmail(); // 받는사람(',' 로 여러 개 나열 가능)
		
		final String smtpEmail = "choijunyoung0212@gmail.com"; // SMTP를 보낼 이메일
		final String password = "mftzeyjnijqtjlwb"; // SMTP 비밀번호(2차 인증 이후 앱 생성)
		
		Properties p = System.getProperties(); // 객체 p에 필수로 넣어야하는 작업들
		p.setProperty("mail.transport.protocol", "smtp");
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "587");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.ssl.protocols", "TLSv1.2");
		p.put("mail.smtp.socketFactory.port", "587");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		
		try {
			// 5. 이메일 전송을 위해 가져온 정보를 저장
			Session session = Session.getDefaultInstance(p);
			
			MimeMessage msg = new MimeMessage(session); // MimeMessage 객체 생성

			msg.setFrom(new InternetAddress(fromEmail, fromUserName)); // 송신자(보내는 사람) 지정
			msg.addRecipient(RecipientType.TO, new InternetAddress(toEmail)); // 수신자(받는사람) 지정
			msg.setSubject(subject); // 이메일 제목 지정
			
			StringBuffer sb = new StringBuffer(); // 가변성 문자열 저장 객체
			sb.append("<h3>[WebProject-CJY] 비밀번호 찾기 임시 비밀번호입니다.</h3>\n");
			sb.append("<h3>임시 비밀번호 : <span style='color:red'>" + cNumber + "</span></h3>\n");
			msg.setText("임시 비밀번호는 ["+ cNumber +"] 입니다.");
			
			// 6. 이메일 전송
			Transport t = session.getTransport("smtp");
			t.connect(smtpEmail, password);
			t.sendMessage(msg, msg.getAllRecipients());
			t.close();
			
			// 7. 성공 응답
			resp.setContentType("text/plain");
			resp.setCharacterEncoding("UTF-8");
			resp.getWriter().write("success");
		}
		catch (Exception e) {
			JSFunction.alertBack(resp, "이메일 전송 중 오류가 발생했습니다.");
			return;
		}
	}
}