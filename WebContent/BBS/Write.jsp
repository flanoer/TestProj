<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/WEB-INF/tlds/mytaglib.tld" %>
<!DOCTYPE html>
<html>
<head>
    <title>Write.jsp</title>
	<meta charset="utf-8" />
    <!-- Bootstrap core CSS -->
	<link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
	
	<!-- Custom styles for this template -->
	<link href="<c:url value='/dashboard.css'/>" rel="stylesheet">
	<link href="<c:url value='/offcanvas.css'/>" rel="stylesheet">
	<script>
		window.onload=function(){
			var form = document.forms[0];
			form.onsubmit=function(){
				if(form.title.value===""){
					alert('제목을 입력하세요?');
					form.title.focus();
					return false;
				}
				else if(form.content.value===""){
					alert('내용을 입력하세요?');
					form.content.focus();
					return false;
				}			
			};
		};
	</script>
</head>
<body>
	<%-- header start --%>
    <jsp:include page="/Template/Top.jsp"/>
	<%-- header end --%>
	<%-- main page start --%>
     <div class="container">
       <div class="row row-offcanvas row-offcanvas-left">
		   <%-- side-bar start --%>
	       <jsp:include page="/Template/Left.jsp"/>
   			<%-- side-bar end --%>
	        <div class="col-xs-12 col-sm-9">
	        	<div class="row">
					<form action="<c:url value='/BBS/Write.do'/>" method="post">
						<table class="table">                   
							<tr>
								<td width="15%" align="center">제목</td>
								<td>
									<input type="text" class="form-control" name="title"/>
								</td>
							</tr>
							<tr>
								<td width="15%" align="center">내용</td>
								<td>
									<textarea class="form-control" rows="10" name="content"></textarea>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="text-center">
									<button class="btn btn-success" type="submit">등록</button>
								</td>
							</tr>                   
						</table> 
					</form>
				</div>
	        </div>
        <%-- main page end --%>
      	</div>
  		<hr/>
		<jsp:include page="/Template/Footer.jsp"/>
    </div>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
</body>
</html>