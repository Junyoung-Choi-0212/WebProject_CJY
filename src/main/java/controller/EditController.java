package controller;

import java.io.IOException;

import file.FileManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util.JSFunction;

@WebServlet("/edit.do")
@MultipartConfig(
	maxFileSize = 1024 * 1024 * 1,
	maxRequestSize = 1024 * 1024 * 10
)
public class EditController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		if (session.getAttribute("UserId") == null) {
			JSFunction.alertBack(resp, "로그인 후 이용해주세요.");
			return; // 추가적인 코드 실행 차단
		}
		
		// 작성자 인증
		if (!req.getParameter("authorid").equals(session.getAttribute("UserId").toString())) {
			JSFunction.alertBack(resp, "작성자 본인만 수정할 수 있습니다.");
			return;
		}
		
		String ofile = "";
		String sfile = "";
		
		// ------------------------------ file upload ---------------------------------
		String saveDirectory = req.getServletContext().getRealPath("/Uploads");
		try { ofile = FileManager.uploadFile(req, saveDirectory); } // form에서 전송한 파일 업로드 처리
		catch(Exception e) {
			JSFunction.alertBack(resp, "파일 업로드 오류입니다."); // 문제가 있는 경우 예외처리
			return;
		}
		
		if (ofile != "") sfile = FileManager.renameFile(saveDirectory, ofile);
		// ------------------------------ file upload ---------------------------------
		
		String idx = req.getParameter("idx");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String prevOfile = req.getParameter("prevOfile");
		String prevSfile = req.getParameter("prevSfile");
		
		// DTO에 값 저장
		ListDTO dto = new ListDTO();
		dto.setIdx(idx);
		dto.setTitle(title);
		dto.setContent(content);
		if (ofile != "") { // 파일 수정(새로 업로드)이 되었다면
			// 새로 업로드한 파일 정보로 교체
			dto.setOfile(ofile);
			dto.setSfile(sfile);
			
			// 기존 파일 삭제
			FileManager.deleteFile(req, "/Uploads", prevSfile);
		}
		else { // 파일 수정(새로 업로드)이 되지 않았다면
			dto.setOfile(prevOfile);
			dto.setSfile(prevSfile);
		}
		
		ListDAO dao = new ListDAO();
		int result = dao.updateList(dto);
		dao.close();
		
		if (result == 1) resp.sendRedirect("view.do?type=" + req.getParameter("type") + "&idx=" + idx);
		else JSFunction.alertLocation(resp, "비밀번호 검증을 다시 진행해주세요.", "view.do?type=" + req.getParameter("type") + "&idx=" + idx);
	}
}