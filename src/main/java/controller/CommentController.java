package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.JSFunction;

@WebServlet("/comment.do")
public class CommentController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String type = req.getParameter("type");
		String listidx = req.getParameter("idx");
		String userid = req.getParameter("userid");
		String username = req.getParameter("username");
		String useremail = req.getSession().getAttribute("UserEmail").toString();
		String comment = req.getParameter("comment");
		
		if (userid == null) {
			JSFunction.alertBack(resp, "로그인 후 이용해주세요.");
			return; // 추가적인 코드 실행 차단
		}
		
		// 변경 가능한 값인 userid, username 값이 아닌 변경 불가능한 값인 useridx 값을 가져온다.
		MemberDAO memberdao = new MemberDAO();
		MemberDTO memberdto = memberdao.getMemberDTO(userid, username, useremail);
		String useridx = memberdto.getIdx();
		memberdao.close();
		
		// insert 할 데이터들 세팅
		ListcommentDTO listdto = new ListcommentDTO();
		listdto.setListidx(listidx);
		listdto.setUseridx(useridx);
		listdto.setUserid(userid);
		listdto.setUsername(username);
		listdto.setContent(comment);
		
		// insert
		ListcommentDAO listdao = new ListcommentDAO();
		int result = listdao.writeComment(listdto);
		listdao.close();
		
		if (result == 1) resp.sendRedirect("view.do?type=" + type + "&idx=" + listidx);
		else JSFunction.alertBack(resp, "댓글 작성에 실패했습니다.");
	}
}