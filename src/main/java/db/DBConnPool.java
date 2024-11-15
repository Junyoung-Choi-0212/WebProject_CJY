package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/*
	JNDI(Java Naming and Directory Interface)
	- 디렉토리 서비스에서 제공하는 데이터 및 객체를 찾아서 참조(Lookup)하는 API로 쉽게 말해 외부에 있는 객체를 이름으로 찾기 위한 기술
	
	DBCP(DataBase Connection Pool : 커넥션 풀)
	- DB와 연결된 커넥션 인스턴스를 미리 만들어 풀(pool)에 만들어 저장하고 필요할 때 가져다쓰고 반납하는 기술
	- DB의 부하를 줄이고 자원을 효율적으로 관리할 수 있다.
*/
public class DBConnPool {
	public Connection con; // DB 연결
	public Statement stmt; // 정적 쿼리 실행
	public PreparedStatement pstmt; // 동적 쿼리 실행
	public ResultSet rs; // select 결과 반환
	
	public DBConnPool() {
		try {
			Context initCtx = new InitialContext(); // context 인스턴스(Tomcat 웹 서버) 생성
			/*
				앞에서 생성한 인스턴스를 통해 JNDI 서비스 구조의 초기 root 디렉토리를 얻어온다.
				해당 디렉토리의 이름은 아래와 같이 이미 지정되어 있으므로 그대로 사용하면 된다.
			*/
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			DataSource source = (DataSource)ctx.lookup("dbcp_webproject"); // server.xml에 등록한 네이밍을 Lookup 하여 DataSource(DB연결을 위한 정보)를 얻어온다.
			con = source.getConnection(); // 커넥션 풀에 생성해 둔 객체를 가져와 사용(DB연결 처리)
			System.out.println("DB 커넥션 풀 연결 성공");
		}
		catch (Exception e) {
			System.out.println("DB 커넥션 풀 연결 실패");
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
			
			System.out.println("DB 커넥션 풀 자원 반납");
		}
		catch (Exception e) { e.printStackTrace(); }
	}
}