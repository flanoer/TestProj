<%@ page import="model.PagingUtil"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page import="model.BBSDTO"%>
<%@ page import="model.BBSDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/WEB-INF/tlds/mytaglib.tld" %>

<!DOCTYPE html>
<html>
<head>
    <title>List.jsp</title>
	<meta charset="utf-8" />
    <!-- Bootstrap core CSS -->
	<link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
	
	<!-- Custom styles for this template -->
	<link href="dashboard.css" rel="stylesheet">
	<link href="offcanvas.css" rel="stylesheet">
    <style>
	    body {
		  min-height: 2000px;
		  padding-top: 70px;
		}
		table, table th{
			text-align: center;
		}
		.pagination {
			display:block;
			text-align: center;
		}
		
		.pagination > li > a{
			float:none;
			margin-right: -5px;
		}
    </style>
    <script>
    //클릭 할때마다 다운로드수 증가시키기
    var updateDownCount = function(key){
    	var span = document.getElementById("download"+key);
    	span.innerHTML = parseInt(span.innerHTML)+1;
    }
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
        	FreeBoard(Now : ${nowPage} / Total : ${empty totalPage ? 0 : totalPage})
					<div class="row">
						<form action="Write.jsp">
							<button class="btn btn-primary" type="submit">글작성</button>
						</form>
					</div>
					<br/>
					<table class="table table-hover">
						<tr bgcolor="white" align="center">
							<th width="10%">번호</th>
							<th width="45%">제목</th>
							<th width="15%">작성자</th>
							<th width="20%">작성일</th>
							<th>조회수</th>
						</tr>
						<c:if test="${empty list }" var="flag">
							<tr>
								<td colspan="6">등록된 글이 없어요.</td>
							</tr>
						</c:if>
						<c:if test="${not flag }">
							<c:forEach items="${list }" var="item" varStatus="loop">
								<tr>
									<td>${totalRecordCount - (((nowPage - 1) * pageSize) + loop.index) }</td>
									<td><a href="<c:url value='/BBS/View.do?key=${item.no }'/>">${item.title }</a></td>
									<td>${item.id }</td>
									<td>${item.postDate }</td>
									<td>${item.visitCount }</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				<!-- 검색UI -->
				<form method="get">
					<table width="100%">
						<tr align="center">
							<td>
								<select name="searchColumn">
									<option value="title">제목</option>
									<option value="name">작성자</option>
									<option value="content">내용</option>
								</select>
								<input type="text" name="searchWord"/>
								<input type="submit" value="검색"/>
							</td>
						</tr>
					</table>
				</form>
	        </div>
        <%-- main page end --%>
      </div>
      <div class="row">
      	${pagingStr }
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
