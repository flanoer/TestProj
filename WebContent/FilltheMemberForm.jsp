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
    <title>Please Fill the Member assignment form</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value='/dashboard.css'/>" rel="stylesheet">
    <link href="<c:url value='/signin.css'/>" rel="stylesheet">
    <script src="<c:url value='/myjs/myjs1.js'/>" type="text/javascript"></script>
  </head>
	
  <body>
	<%-- header start --%>
    <jsp:include page="/Template/Top.jsp">
       	<jsp:param value="1" name="activeJoin"/>
    </jsp:include>
	<%-- header end --%>
    <div class="container">
   	 <div class="row">
      <form class="form-signin" onsubmit="return isValidate(this)"
      	action="<c:url value='/Insert.do'/>" method="post">
      	<input type="hidden" name="mode" value="createAccount"/>
        <h2 class="form-signin-heading">Please fill the text-box</h2>
        <c:if test="${not empty mem_suc_fail }">
        	<script>
        		alert('${mem_suc_fail}');
        	</script>
       		<c:set var="id" value="${param.id }"/>
       		<c:set var="email" value="${param.email }"/>
       		<c:set var="name" value="${param.name }"/>
        </c:if>
        <c:if test="${not empty MSG }"><script>alert('${MSG}')</script></c:if>
        <div class="row">
	        <label for="inputId" class="sr-only">ID</label>
	        <input type="text" class="form-control" name="id" value=<c:if test="${empty id }" var="result">"ID"</c:if><c:if test="${not result }">${id }</c:if> onfocus="fnUserMy(1,this)" onblur="fnUserMy(2,this)">
        </div>
        <div class="row">
	        <label for="inputPassword" class="sr-only">PW</label>
	        <input type="text" class="form-control" name="pw" value="Password" onfocus="fnPassMy(1,this)" onblur="fnPassMy(2,this)">
		</div>
		<div class="row">
	        <label for="inputPassword" class="sr-only">PW Check</label>
	        <input type="text" class="form-control" name="pwcheck" value="Password Check" onfocus="fnPassCk(1,this)" onblur="fnPassCk(2,this)">
        </div>
        <div class="row">
	        <label for="inputEmail" class="sr-only">E-Mail</label>
	        <input type="email" class="form-control" name="email" value=<c:if test="${empty email }" var="result">"E-Mail"</c:if><c:if test="${not result }">${email }</c:if> onfocus="fnMail(1, this)" onblur="fnMail(2, this)">
		</div>
        <div class="row">
	        <label for="inputName" class="sr-only">Name</label>
	        <input type="text" class="form-control" name="name" value=<c:if test="${empty name }" var="result">"Name"</c:if><c:if test="${not result }">${name }</c:if> onfocus="fnName(1, this)" onblur="fnName(2, this)">
		</div>
        <div class="row">
      		<span style="color:red;" id="validate"></span>
      	</div>
		<div class="row">
        	<button class="btn btn-lg btn-primary btn-block" type="submit">Create account</button>
       	</div>
      </form>
     </div>
    </div> <!-- /container -->
  </body>
</html>
