package utils;

import java.io.PrintWriter;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.jsp.JspWriter;

/* 
	자주 사용하는 JavaScript의 함수를 클래스로 정의
 	메소드 생성 시 static 키워드를 추가하면 클래스의 인스턴스를 생성하지 않아도 클래스명으로 즉시 메소드 호출이 가능 
*/
public class JSFunction {
	/*
		Servlet에서 JavaScript를 실행할 수 있도록 정의한 메소드.
		JSP로 forward 하지 않고 즉시 출력해야하므로 contenttype 을 먼저 설정하고 있다.
	*/
	public static void alertLocation(HttpServletResponse resp, String msg, String url) {
		try {
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter writer = resp.getWriter();
			// 경고 창을 띄우고 특정 페이지로 이동할 수 있는 JS 코드 작성
			String script = ""
					+ "<script>"
					+ "	alert(`" + msg + "`);"
					+ "	location.href = '" + url +  "';"
					+ "</script>";
			writer.println(script);
		}
		catch(Exception e) {}
	}
	
	public static void alertLocation(String msg, String url, JspWriter out) {
		/*
			Java 클래스에서는 JSP의 내장객체를 즉시 사용할 수 없으므로 매개변수로 전달받아 사용해야한다.
			여기서 웹 브라우저에 문자열을 출력하기 위해 out 내장객체를 JspWriter 타입으로 받은 후 사용한다.
		*/
		try {
			String script = ""
					+ "<script>"
					+ "	alert(`" + msg + "`);"
					+ "	location.href = '" + url +  "';"
					+ "</script>";
			out.println(script);
		}
		catch(Exception e) {}
	}
	
	// 경고창을 띄우고 뒤로 한 번 이동하는 JS 코드 작성
	public static void alertBack(HttpServletResponse resp, String msg) {
		try {
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter writer = resp.getWriter();
			String script = ""
					+ "<script>"
					+ "	alert(`" + msg + "`);"
					+ "	history.back();"
					+ "</script>";
			writer.println(script);
		}
		catch(Exception e) {}
	}
	
	public static void alertBack(String msg, JspWriter out) {
		try {
			String script = ""
					+ "<script>"
					+ "	alert(`" + msg + "`);"
					+ "	history.back();"
					+ "</script>";
			out.println(script);
		}
		catch(Exception e) {}
	}
}