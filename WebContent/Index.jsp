<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>BS Project : Nam Gi-ung</title>

<!-- Bootstrap core CSS -->
<link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="dashboard.css" rel="stylesheet">
<link href="offcanvas.css" rel="stylesheet">

</head>
<body>
	<%-- header start --%>
    <jsp:include page="/Template/Top.jsp">
    	<jsp:param value="1" name="active"/>
    </jsp:include>
	<%-- header end --%>
    <%-- main page start --%>
     <div class="container">
       <div class="row row-offcanvas row-offcanvas-left">
		   <%-- side-bar start --%>
	       <jsp:include page="/Template/Left.jsp"/>
   			<%-- side-bar end --%>
	        <div class="col-xs-12 col-sm-9">
	          	<div class="my-font">Main</div>
	          	<br/>첫 화면입니다~ 반가워요 &gt;_&lt;<br/>
	            <img src="images/blue-squarest.jpg" style="width:100%; height:70%"/>
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
