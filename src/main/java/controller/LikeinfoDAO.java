package controller;

import db.DBConnPool;

public class LikeinfoDAO extends DBConnPool{
	public LikeinfoDTO getLikeinfo(String userid, String listidx) {
		LikeinfoDTO dto = new LikeinfoDTO();
		
		String query = "select * from likeinfo where userid = ? and listidx = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userid);
			pstmt.setString(2, listidx);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setListidx(rs.getString(2));
				dto.setUserid(rs.getString(3));
				dto.setLikedate(rs.getDate(4));
			}
		}
		catch (Exception e) {
			System.out.println("좋아요 정보 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public int writeLikeinfo(LikeinfoDTO dto) {
		int result = 0;
		
		String query = "insert into likeinfo (idx, listidx, userid) values(seq_likeinfo_num.nextval, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dto.getListidx());
			pstmt.setString(2, dto.getUserid());
			
			result = pstmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("좋아요 정보 작성 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int deleteLikeinfo(String idx) {
		int result = 0;
		
		try {
			String query = "delete from likeinfo where idx = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, idx);
			result = pstmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("좋아요 정보 삭제 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
}