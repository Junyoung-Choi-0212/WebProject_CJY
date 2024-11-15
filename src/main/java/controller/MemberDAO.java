package controller;

import java.sql.Date;

import db.DBConnPool;

public class MemberDAO extends DBConnPool{
	public int register(MemberDTO dto) {
		int result = 0;
		
		try {
			String query = "insert into member (idx, id, password, name, email, phone) values (seq_member_num.nextval, ?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(query); // 쿼리를 인수로 prepardStatement 인스턴스 생성
			// 인스턴스를 통해 파라미터 설정
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getPhone());
			
			// 쿼리 실행(insert의 경우 입력된 행의 갯수가 반환됨)
			result = pstmt.executeUpdate();
		}
		catch (Exception e) { 
			System.out.println("회원 가입 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO(); // 인스턴스
		
		String query = "select * from member where id = ? and password = ?"; // 로그인 form 에서 입력한 아이디, 비밀번호를 통해 select 할 수 있게 쿼리를 작성
		
		try {
			pstmt = con.prepareStatement(query); // 실행을 위한 prepared 인스턴스 생성
			// query 변수의 매개변수
			pstmt.setString(1, uid);
			pstmt.setString(2, upass);
			rs = pstmt.executeQuery(); // 실행
			
			if (rs.next()) { // 회원 정보가 있다면 DIO 객체에 저장
				dto.setIdx(rs.getString(1));
				dto.setId(rs.getString(2));
				dto.setPassword(rs.getString(3));
				dto.setName(rs.getString(4));
				dto.setEmail(rs.getString(5));
				dto.setPhone(rs.getString(6));
				dto.setRegidate(rs.getString(7));
			}
		}
		catch (Exception e) { 
			System.out.println("로그인 중 예외 발생");
			e.printStackTrace(); 
		}
		
		return dto;
	}
}