<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//member only
	if(session.getAttribute("USER_ID") == null){
		out.println("<script>");
		out.println("	alert('로그인 후 이용하세요.');");
		out.println("	location.replace('"+request.getContextPath()+"/Session06/Login.jsp');");
		out.println("</script>");
		return;
	}
%>