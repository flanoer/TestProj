<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	function fnSrch(flag, obj) {
	    if (flag === 1 && obj.value === "Search By Title") {
	        obj.value = "";
	        obj.style.color = "black";
	    }
	    else {
	        if (obj.value === '') {
	            obj.value = 'Search By Title';
	            obj.style.color = "darkgray";
	        }
	    }
	};
</script>
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">BS Project : Nam Gi-ung</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li <c:if test="${not empty param.active }">class="active"</c:if>><a href="<c:url value='/Index.jsp'/>">Home</a></li>
				<li <c:if test="${not empty param.activeJoin }">class="active"</c:if>><a href="<c:url value='/FilltheMemberForm.jsp'/>">Join us</a></li>
				<li <c:if test="${not empty param.activeSign }">class="active"</c:if>><c:if test="${out != 1 }" var="result"><a href="<c:url value='/Signin.jsp'/>">Sign in</a></c:if><c:if test="${not result }"><a href="<c:url value='/Signout.jsp'/>">Sign out</a></c:if></li>
				<li <c:if test="${not empty param.activeBoard }">class="active"</c:if>><a href="<c:url value='/BBS/List.do'/>">Board</a></li>
			</ul>
		  <%-- search --%>
			<form class="navbar-form navbar-right">
				<input type="text" class="form-control" value="Search By Title" onfocus="fnSrch(1,this)" onblur="fnSrch(2,this)">
			</form>
		</div>
	</div>
</nav>