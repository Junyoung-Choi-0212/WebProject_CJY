package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.JSFunction;

@WebServlet("/register.do")
public class RegisterController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String password = req.getParameter("password");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		
		System.out.println("=================Parameter print====================");
		System.out.println("id : " + id);
		System.out.println("password : " + password);
		System.out.println("name : " + name);
		System.out.println("email : " + email);
		System.out.println("phone : " + phone);
		System.out.println("=================Parameter print====================");
		
		MemberDAO dao = new MemberDAO();
		
		MemberDTO duplicatedChk = dao.getMemberDTO(id);
		
		if (duplicatedChk.getId() != null) {
			JSFunction.alertBack(resp, "입력하신 아이디는 사용 중 입니다.\n다른 아이디를 입력해주세요.");
			dao.close();
			return;
		}
		
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPassword(password);
		dto.setName(name);
		dto.setEmail(email);
		dto.setPhone(phone);
		
		
		int result = dao.register(dto);
		dao.close();
		
		if (result == 1) resp.sendRedirect("JSP/Login.jsp");
		else JSFunction.alertLocation(resp, "회원 가입에 실패했습니다.", "JSP/Register.jsp");
	}
}