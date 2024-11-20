package controller;

import java.io.IOException;

import file.FileManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.JSFunction;

@WebServlet("/download.do")
public class DownloadController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String type = req.getParameter("type");
		
		String ofile = req.getParameter("ofile");
		String sfile = req.getParameter("sfile");
		String idx = req.getParameter("idx");
		
		FileManager.download(req, resp, "/Uploads", sfile, ofile);
		
		ListDAO dao = new ListDAO();
		dao.updateDowncount(idx);
		dao.close();
	}
}