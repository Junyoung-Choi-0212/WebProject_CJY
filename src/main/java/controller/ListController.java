package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.JSFunction;
import util.ListPage;

@WebServlet("/list.do")
public class ListController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String type = req.getParameter("type");
		
		if (type == null || type == "") {
			JSFunction.alertBack(resp, "게시판 type 값이 정해지지 않았습니다!");
			return;
		}
		
		ListDAO dao = new ListDAO();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		if (searchWord != null) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		map.put("type", type); // 게시판 분류 값인 type 값은 검색어가 없어도 추가된다.
		int totalCount = dao.getCount(map);
		
		/* 페이지 처리 start */
		ServletContext application = getServletContext();
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
		
		// 현재 페이지 확인
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		if (pageTemp != null && !pageTemp.equals("")) pageNum = Integer.parseInt(pageTemp);
		
		// 목록에 출력할 게시물 범위 계산
		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;
		map.put("start", start);
		map.put("end", end);
		/* 페이지 처리 end */
		
		List<ListDTO> list = dao.getLists(map);
		dao.close();
		
		// 뷰에 전달할 매개변수 추가
		String pagingImg = ListPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "list.do?type=" + type);
		map.put("pagingImg", pagingImg);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		
		// 전달할 데이터를 request 영역에 저장한 후 ListPage.jsp로 forwarding
		req.setAttribute("type", type);
		req.setAttribute("list", list);
		req.setAttribute("map", map);
		
		req.getRequestDispatcher("JSP/List.jsp").forward(req, resp);
	}
}