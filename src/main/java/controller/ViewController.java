package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/view.do")
public class ViewController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String type = req.getParameter("type");
		String idx = req.getParameter("idx");
		
		ListDAO dao = new ListDAO();
		ListDTO dto = dao.getList(type, idx);
		dao.close();
		
//		dto.setContent(dto.getContent().replaceAll("\r\n", "<br />")); // table로 보여준다면 필요한 작업이나 textarea로 보여줄 때는 필요 없는 작업이다.
		
		if (dto.getListtype().toString().equals("DATA")) {
			String ext = null, fileName = dto.getSfile(), mimeType = null;
			if (fileName != null) ext = fileName.substring(fileName.lastIndexOf(".") + 1);
			
			String[] extArray1 = { "png", "jpg", "gif", "pcx", "bmp" };
			String[] extArray2 = { "mp3", "wav" };
			String[] extArray3 = { "mp4", "avi", "wmv" };
			
			if (mimeContains(extArray1, ext)) mimeType = "img";
			if (mimeContains(extArray2, ext)) mimeType = "audio";
			if (mimeContains(extArray3, ext)) mimeType = "video";
			
			System.out.println("MIME타입 = " + mimeType);
			req.setAttribute("mimeType", mimeType);
		}
		
		req.setAttribute("type", type);
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("JSP/View.jsp").forward(req, resp);
	}
	
	public boolean mimeContains(String[] strArr, String ext) {
		boolean retValue = false;
		
		for (String s : strArr) { if (s.equalsIgnoreCase(ext)) retValue = true; }
		
		return retValue;
	}
}