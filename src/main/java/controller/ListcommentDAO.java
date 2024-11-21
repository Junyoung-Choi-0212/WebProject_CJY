package controller;

import java.util.List;
import java.util.Vector;

import db.DBConnPool;

public class ListcommentDAO extends DBConnPool{
	public int writeComment(ListcommentDTO dto) {
		int result = 0;
		
		String query = "insert into listcomment(idx, listidx, useridx, userid, username, content) values(seq_listcomment_num.nextval, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dto.getListidx());
			pstmt.setString(2, dto.getUseridx());
			pstmt.setString(3, dto.getUserid());
			pstmt.setString(4, dto.getUsername());
			pstmt.setString(5, dto.getContent());
			
			result = pstmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("댓글 작성 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List<ListcommentDTO> getComments(String listidx) {
		List<ListcommentDTO> comments = new Vector<ListcommentDTO>();
		
		String query = "select * from listcomment where listidx = ? order by idx";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, listidx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ListcommentDTO dto = new ListcommentDTO();
				dto.setIdx(rs.getString(1));
				dto.setListidx(rs.getString(2));
				dto.setUsername(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setUseridx(rs.getString(6));
				dto.setUserid(rs.getString(7));
				
				comments.add(dto);
			}
		}
		catch (Exception e) {
			System.out.println("댓글 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return comments;
	}
	
	public int updateComment(ListcommentDTO dto) {
		int result = 0;
		
		String query = "update listcomment set content = ? where idx = ?";
		System.out.println("update listcomment set content = " + dto.getContent() + " where idx = " + dto.getIdx());
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dto.getContent());
			System.out.println("content set");
			pstmt.setString(2, dto.getIdx());
			System.out.println("idx set");
			result = pstmt.executeUpdate();
			System.out.println("댓글 update 작업 끝");
		}
		catch (Exception e) {
			System.out.println("댓글 수정 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int deleteComment(String idx) {
		int result = 0;
		
		try {
			String query = "delete from listcomment where idx = ?";
			System.out.println("delete from listcomment where idx = " + idx);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, idx);
			result = pstmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("댓글 삭제 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
}