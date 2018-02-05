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
    <title>Sign in to my web</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value='/dashboard.css'/>" rel="stylesheet">
    <link href="<c:url value='/signin.css'/>" rel="stylesheet">
    <script src="<c:url value='/myjs/myjs2.js'/>"></script>
<%
	if(request.getAttribute("SigninPlease") != null){
%>
	<script>
		alert('<%= request.getAttribute("SigninPlease") %>');
	</script>
<%	} %>
  </head>

  <body>
  	<c:if test="${not empty pw_incorrect }">
       	<script>
       		alert('${pw_incorrect}');
       	</script>
  		<c:set var="id" value="${param.id }"/>
	</c:if>
	<%-- header start --%>
    <jsp:include page="/Template/Top.jsp">
    	<jsp:param value="1" name="activeSign"/>
    </jsp:include>
	<%-- header end --%>
    <div class="container">
      <form class="form-signin" action="<c:url value='/Info.do'/>" method="post" onsubmit="return isValidate(this)">
        <input type="hidden" name="mode" value="signIn"/>
        <h2 class="form-signin-heading">Please sign in</h2>
        <div class="row">
      		<span style="color:red;font-weight: bold;" id="validate"></span>
      	</div>
      	<div class="row">
	        <label for="inputName" class="sr-only">ID</label>
	        <input type="text" id="inputName" name="id" class="form-control" value=<c:if test="${empty id }" var="result">"ID"</c:if><c:if test="${not result }">${id }</c:if> onfocus="fnUserMy(1,this)" onblur="fnUserMy(2,this)">
        </div>
        <div class="row">
	        <label for="inputPassword" class="sr-only">Password</label>
	        <input type="text" id="inputPassword" name="pw" class="form-control" value="Password" onfocus="fnPassMy(1,this)" onblur="fnPassMy(2,this)">
        </div>
        <div class="row">
        	<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        </div>
      </form>

    </div> <!-- /container -->
  </body>
</html>
