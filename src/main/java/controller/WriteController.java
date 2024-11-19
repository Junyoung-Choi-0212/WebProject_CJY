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

@WebServlet("/write.do")
@MultipartConfig(
	maxFileSize = 1024 * 1024 * 1,
	maxRequestSize = 1024 * 1024 * 10
)
public class WriteController extends HttpServlet{
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
		
		String type = req.getParameter("type");
		
		if (type == null || type == "") {
			JSFunction.alertBack(resp, "게시판 type 값이 정해지지 않았습니다!");
			return;
		}
		
		req.setAttribute("type", type);
		req.getRequestDispatcher("JSP/Write.jsp").forward(req, resp);
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
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String authorid = session.getAttribute("UserId").toString();
		String authorname = session.getAttribute("UserName").toString();
		String type = req.getParameter("type");
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
		
		System.out.println("=================Parameter print====================");
		System.out.println("title : " + title);
		System.out.println("content : " + content);
		System.out.println("authorid : " + authorid);
		System.out.println("authorname : " + authorname);
		if (ofile != null && !ofile.equals("")) System.out.println("ofile : " + ofile);
		if (sfile != null && !sfile.equals("")) System.out.println("sfile : " + sfile);
		System.out.println("type : " + type);
		System.out.println("=================Parameter print====================");
		
		ListDTO dto = new ListDTO();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setAuthorid(authorid);
		dto.setAuthorname(authorname);
		if (ofile != null && !ofile.equals("")) dto.setOfile(ofile);
		if (sfile != null && !sfile.equals("")) dto.setSfile(sfile);
		dto.setListtype(type);
		
		ListDAO dao = new ListDAO();
		int result = dao.writeList(dto);
		dao.close();
		if (result == 1) resp.sendRedirect("list.do?type=" + type);
		else JSFunction.alertBack(resp, "글 쓰기에 실패했습니다.");
	}
}