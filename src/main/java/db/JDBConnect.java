package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletContext;

public class JDBConnect {
	public Connection con; // DB 연결
	public Statement stmt; // 정적 쿼리 실행
	public PreparedStatement pstmt; // 동적 쿼리 실행
	public ResultSet rs; // select 결과 반환
	
	public JDBConnect() { // 기본 생성자
		try {
			Class.forName("oracle.jdbc.OracleDriver"); // Oracle driver 메모리에 로드
			String url = "jdbc:oracle:thin:@localhost:1521:xe"; // connection url 생성
			// Oracle DB 계정 id, pw
			String id = "webproject_db";
			String pwd = "1234";
			
			con = DriverManager.getConnection(url, id, pwd); // 연결 시도
			
			System.out.println("DB 연결 성공(기본 생성자)"); // Connection 인스턴스가 반환되면 연결 성공
		}
		catch (Exception e) { e.printStackTrace(); }
	}
	public JDBConnect(String driver, String url, String id, String pwd) { // 인자 생성자1(4개의 매개변수)
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결 성공(인수 생성자 1)");
		}
		catch (Exception e) { e.printStackTrace(); }
	}
	public JDBConnect(ServletContext application) { // 인자 생성자2(1개의 매개변수)
		try {
			/*
				application 내장객체의 원본 타입을 매개변수로 선언
				내장객체를 매개변수를 통해 전달받았으르모 Java 클래스 내에서 web.xml에 접근 가능
				ㄴ> JSP에서 DB 연결을 위해 반복적으로 사용했던 코드를 줄일 수 있음
			*/ 
			String driver = application.getInitParameter("OracleDriver");
			String url = application.getInitParameter("OracleURL");
			String id = application.getInitParameter("OracleId");
			String pwd = application.getInitParameter("OraclePwd");
			
			System.out.println(driver + "=" + url + "=" + id + "=" + pwd); // 디버깅을 위한 출력
			
			Class.forName(driver); // 드라이버 로드
			con = DriverManager.getConnection(url, id, pwd); // DB 연결
			
			System.out.println("DB 연결 성공(인수 생성자 2)");
		}
		catch (Exception e) { e.printStackTrace(); }
	}
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
			
			System.out.println("JDBC 자원 해제");
		}
		catch (Exception e) { e.printStackTrace(); }
	}
}