<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%-- sign out --%>
<c:set var="out" value="0"/>
<%
	session.invalidate();
%>
<jsp:forward page="Index.jsp"/>

