package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util.JSFunction;

@WebServlet("/like.do")
public class LikeController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idx = req.getParameter("idx");
		String userid = req.getParameter("userid");
		String result = "";
		
		HttpSession session = req.getSession();
		
		if (userid == null) {
			JSFunction.alertBack(resp, "로그인 후 이용해주세요.");
			return; // 추가적인 코드 실행 차단
		}
		
		LikeinfoDAO likedao = new LikeinfoDAO();
		ListDAO listdao = new ListDAO();
		
		LikeinfoDTO likeinfo = likedao.getLikeinfo(userid, idx); // 이미 좋아요를 누른 이력이 있는지 확인
		
		String likeinfoidx = likeinfo.getIdx(); 
		if(likeinfoidx != null) { // 이전에 좋아요를 눌렀던 글인 경우
			likedao.deleteLikeinfo(likeinfoidx);
			listdao.updateLikecount(idx, "minus");
			result = "minus";
		}
		else { // 이전에 좋아요를 누르지 않았던 글이거나 좋아요를 취소한 글의 경우
			LikeinfoDTO dto = new LikeinfoDTO();
			dto.setListidx(idx);
			dto.setUserid(userid);
			likedao.writeLikeinfo(dto);
			listdao.updateLikecount(idx, "plus");
			result = "plus";
		}
		
		listdao.close();
		likedao.close();
		
		resp.setContentType("text/plain");
		resp.setCharacterEncoding("UTF-8");
		resp.getWriter().write(result);
	}
}