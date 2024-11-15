package controller;

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
}