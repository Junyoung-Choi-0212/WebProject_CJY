package controller;

import java.io.IOException;

import file.FileManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util.JSFunction;

@WebServlet("/delete.do")
public class DeleteController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		if (session.getAttribute("UserId") == null) {
			JSFunction.alertBack(resp, "로그인 후 이용해주세요.");
			return; // 추가적인 코드 실행 차단
		}
		
		// 글 가져오기
		String idx = req.getParameter("idx");
		String type = req.getParameter("type");
		ListDAO dao = new ListDAO();
		ListDTO dto = dao.getList(type, idx);
		
		// 작성자 인증
		if (!dto.getAuthorid().equals(session.getAttribute("UserId").toString())) {
			JSFunction.alertBack(resp, "작성자 본인만 수정할 수 있습니다.");
			return;
		}
		
		// 게시물 삭제
		int result = dao.deleteList(idx);
		dao.close();
		
		// 게시물 삭제 성공 시 첨부파일도 삭제
		if (result == 1) {
			String saveFileName = dto.getSfile();
			FileManager.deleteFile(req, "/Uploads", saveFileName);
		}
		
		resp.sendRedirect("list.do?type=" + type);
	}
}