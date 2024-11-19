package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util.CookieManager;
import util.JSFunction;

@WebServlet("/login.do")
public class LoginController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		String id = req.getParameter("id");
		String password = req.getParameter("password");
		String remember = req.getParameter("remember");
		
		System.out.println("=================Parameter print====================");
		System.out.println("id : " + id);
		System.out.println("password : " + password);
		System.out.println("remember : " + remember);
		System.out.println("=================Parameter print====================");
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMemberDTO(id, password);
		dao.close();
		
		if (dto.getId() != null) {
			// 세션에 정보 저장
			session.setAttribute("UserId", dto.getId());
			session.setAttribute("UserName", dto.getName());
			session.setAttribute("UserEmail", dto.getEmail());
			
			if (remember != null && remember.equals("Y")) CookieManager.makeCookie(resp, "loginId", id, 86400); // 로그인 id 저장, 기간은 하루
			else CookieManager.deleteCookie(resp, "loginId"); // 로그인은 성공했으나 체크를 해제한 상태 -> 쿠키 삭제
			
			JSFunction.alertLocation(resp, dto.getName() + "님 환영합니다.", "JSP/index.jsp");
//			resp.sendRedirect("JSP/index.jsp");
		}
		else {
			System.out.println("===========로그인 실패============");
			JSFunction.alertLocation(resp, "입력하신 회원 정보가 존재하지 않습니다.\n회원이 아니시라면 회원가입부터 진행해주세요.", "JSP/Login.jsp");
		}
	}
}