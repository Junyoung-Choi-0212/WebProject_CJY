package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/comment/edit.do")
public class EditCommentController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idx = req.getParameter("idx");
		String comment = req.getParameter("comment");
		
		ListcommentDTO dto = new ListcommentDTO();
		dto.setIdx(idx);
		dto.setContent(comment);
		
		ListcommentDAO dao = new ListcommentDAO();
		int result = dao.updateComment(dto);
		dao.close();
		
		resp.setContentType("text/plain");
		resp.setCharacterEncoding("UTF-8");
		resp.getWriter().write(result);
	}
}