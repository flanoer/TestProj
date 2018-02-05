<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Celebrate</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value='/signin.css'/>" rel="stylesheet">
  </head>

  <body>
	<%-- header start --%>
    <jsp:include page="/Template/Top.jsp">
        <jsp:param value="1" name="activeJoin"/>
    </jsp:include>
	<%-- header end --%>
    <div class="container">
      <form class="form-signin" action="<c:url value='/BBS/List.do'/>">
		<c:if test="${empty mem and not empty already}" var="result"/><img src="" alt="celebrate img"/>
        <c:if test="${not result }"><h2 class="form-signin-heading">${mem.name }님의 회원가입을 축하합니다~</h2></c:if>
        <c:if test="${result }"><h2 class="form-signin-heading">${already.name }님 반갑습니다.</h2></c:if>
      	<div class="row">당신의 아이디는 :<c:if test="${not result}">${mem.id }</c:if><c:if test="${result }">${already.id }</c:if></div>
        <div class="row">당신의 이메일 주소 : <c:if test="${not result}">${mem.email }</c:if><c:if test="${result }">${already.email }</c:if></div>
        <div class="row">당신의 가입일 : <c:if test="${not result}">${mem.regiDate }</c:if><c:if test="${result }">${already.regiDate }</c:if></div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Go to Board</button>
        <a href="Signout.jsp"><button class="btn btn-lg btn-danger btn-block">Sign out</button></a>
      </form>

    </div> <!-- /container -->
  </body>
</html>
