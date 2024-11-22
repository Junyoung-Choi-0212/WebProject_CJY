package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util.JSFunction;

@WebServlet("/myinfo.do")
public class MyInfoController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 로그인 확인을 위해 request 내장객체로 session 내장객체를 얻어온다.
		HttpSession session = req.getSession();
		
		// session 영역에 회원 인증에 관련된 속성이 없다면 로그인 페이지로 이동
		if (session.getAttribute("UserId") == null) {
			JSFunction.alertBack(resp, "로그인 후 이용해주세요.");
			return; // 추가적인 코드 실행 차단
		}
		
		String id = session.getAttribute("UserId").toString();
		String name = session.getAttribute("UserName").toString();
		String email = session.getAttribute("UserEmail").toString();
		
		System.out.println("=================Parameter print====================");
		System.out.println("id : " + id + ", name : " + name + ", email : " + email);
		System.out.println("=================Parameter print====================");
		
		MemberDAO dao = new MemberDAO();
		MemberDTO user = dao.getMemberDTO(id, name, email);
		System.out.println("=================Return print====================");
		System.out.println("dto.id : " + user.getId() + ", dto.name : " + user.getName());
		System.out.println("=================Return print====================");
		dao.close();
		
		req.setAttribute("user", user);
		req.getRequestDispatcher("JSP/MyInfo.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 로그인 확인을 위해 request 내장객체로 session 내장객체를 얻어온다.
		HttpSession session = req.getSession();
		
		// session 영역에 회원 인증에 관련된 속성이 없다면 로그인 페이지로 이동
		if (session.getAttribute("UserId") == null) {
			JSFunction.alertBack(resp, "로그인 후 이용해주세요.");
			return; // 추가적인 코드 실행 차단
		}
		
		String idx = req.getParameter("idx");
		String id = req.getParameter("id");
		String password = req.getParameter("password");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		
		System.out.println("=================Parameter print====================");
		System.out.println("idx : " + idx);
		System.out.println("id : " + id);
		System.out.println("password : " + password);
		System.out.println("name : " + name);
		System.out.println("email : " + email);
		System.out.println("phone : " + phone);
		System.out.println("=================Parameter print====================");
		
		MemberDAO dao = new MemberDAO();
		
		MemberDTO duplicatedChk = dao.getMemberDTO(id);
		
		// 변경하려는 ID를 사용 중인 사람이 있거나 그 아이디를 사용 중인 사람이 본인이 아닐 경우
		if (duplicatedChk.getId() != null && !duplicatedChk.getIdx().equals(idx)) {
			JSFunction.alertBack(resp, "입력하신 아이디는 사용 중 입니다.\n다른 아이디를 입력해주세요.");
			dao.close();
			return;
		}
		
		MemberDTO dto = new MemberDTO();
		dto.setIdx(idx);
		dto.setId(id);
		dto.setPassword(password);
		dto.setName(name);
		dto.setEmail(email);
		dto.setPhone(phone);
		
		int result = dao.update(dto);
		dao.close();
		
		if (result == 1) {
			session.setAttribute("UserId", id);
			session.setAttribute("UserName", name);
			session.setAttribute("UserEmail", email);
			
			doGet(req, resp);
		}
		else JSFunction.alertBack(resp, "회원 정보 수정에 실패했습니다.");
	}
}