<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	Object user = session.getAttribute("UserName");
	out.print("<script>alert('" + user + "님 이용해주셔서 감사합니다.');</script>");	

	session.removeAttribute("UserId");
	session.removeAttribute("UserName");

	out.print("<script>location.href = 'Login.jsp';</script>");
%>