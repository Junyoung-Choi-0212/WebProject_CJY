package controller;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import db.DBConnPool;

public class ListDAO extends DBConnPool{
	public int getCount(Map<String, Object> map) {
		int totalCount = 0;
		String query = "select count(*) from list"; // 그룹함수 count() 사용
		
		if (map.get("searchWord") != null) query += " where " + map.get("searchField") + " like '%" + map.get("searchWord") + "%' and listtype = '" + map.get("type") + "'";
		else query += " where listtype = '" +  map.get("type") + "'";
		
		try {
			stmt = con.createStatement(); // Statement(정적 쿼리) 인스턴스 생성
			rs = stmt.executeQuery(query); // 결과를 ResultSet 으로 반환받는다.
			rs.next(); // count() 함수는 조건에 상관없이 결과가 항상 인출되므로 if()와 같은 조건 없이 바로 next() 함수를 실행할 수 있다.
			totalCount = rs.getInt(1); // 결과 저장
		}
		catch (Exception e) { 
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	public List<ListDTO> getLists(Map<String, Object> map) {
		List<ListDTO> list = new Vector<ListDTO>();
		
		String query = 
				" select * from ( "
				+ " select Tb.*, ROWNUM rNum from ( "
						+ " select * from list ";
		if (map.get("searchWord") != null) {
			query += " where " + map.get("searchField") + " like '%" + map.get("searchWord") + "%' and listtype = '" + map.get("type") + "'";
		}
		else query += " where listtype = '" + map.get("type") + "'";
		query += " order by idx desc "
				+ " ) Tb "
				+ " ) "
				+ " where rNum between ? and ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, map.get("start").toString());
			pstmt.setString(2, map.get("end").toString());
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ListDTO dto = new ListDTO();
				
				dto.setIdx(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setAuthorid(rs.getString(4));
				dto.setAuthorname(rs.getString(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setVisitcount(rs.getInt(9));
				dto.setPostdate(rs.getDate(10));
				dto.setListtype(rs.getString(11));
				
				list.add(dto);
			}
		}
		catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ListDTO getList(String type, String idx) {
		ListDTO dto = new ListDTO();
		
		String query = "select * from list where listtype = ? and idx = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, type);
			pstmt.setString(2, idx);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setAuthorid(rs.getString(4));
				dto.setAuthorname(rs.getString(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setVisitcount(rs.getInt(9));
				dto.setPostdate(rs.getDate(10));
				dto.setListtype(rs.getString(11));
			}
		}
		catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public int writeList(ListDTO dto) {
		int result = 0;
		
		try {
			String query = "insert into list (idx, title, content, authorid, authorname, ofile, sfile, listtype) values (seq_list_num.nextval, ?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getAuthorid());
			pstmt.setString(4, dto.getAuthorname());
			pstmt.setString(5, dto.getOfile());
			pstmt.setString(6, dto.getSfile());
			pstmt.setString(7, dto.getListtype());
			
			result = pstmt.executeUpdate();
		}
		catch (Exception e) { 
			System.out.println("게시글 작성 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int updateList(ListDTO dto) {
		int result = 0;
		
		try {
			String query = "update list set title = ?, content = ?, ofile = ?, sfile = ? where idx = ?";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getOfile());
			pstmt.setString(4, dto.getSfile());
			pstmt.setString(5, dto.getIdx());
			
			result = pstmt.executeUpdate();
		}
		catch (Exception e) { 
			System.out.println("게시글 수정 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int deleteList(String idx) {
		int result = 0;
		
		try {
			String query = "delete from list where idx = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, idx);
			result = pstmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
}
