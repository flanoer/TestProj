<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>MyPage.jsp</title>
	<meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/Styles/divLayout.css"/>
</head>
<body>
    <div class="allWrap">
        <div class="partWrap">
            <!-- 탑메뉴 및 로고 감싸는 div 시작-->
            <!-- 
            	이 페이지로는 include 해서 페이지를 모듈화해서 사용하지를 하지 않는다.
            	나중에 배울 Include Action Tag 로 한다.
             -->
            <div class="header">
                <div class="logo">
                    <img src="<%= request.getContextPath() %>/Images/logo.png" alt="로고 이미지" />
                </div>
                <jsp:include page="/Template/Top.jsp"/>
            </div>
            <!-- 탑메뉴 및 로고 감싸는 div 끝 -->
            <!-- 카테고리(레프트메뉴) 및 바디(실제내용) 감싸는 div 시작 -->
            <div class="body">
                <jsp:include page="/Template/Left.jsp"/>
                <div class="bodyPart">
                    <div class="bodyContent">
						<fieldset style="padding:20px 0 50px 20px">
                       		 <legend>로그인 페이지</legend>
                				 <table style="width:300px;border-spacing:1px;background-color:green">
              						<tr style="background-color:white">
               							<td style="width:25%">아이디</td>
               							<td><%= session.getAttribute("USER_ID") %></td>
              						</tr>
              						<tr style="background-color:white">
               							<td>비밀번호</td>
               							<td><%= session.getAttribute("USER_PW") %></td>
              						</tr>
              						<tr style="background-color:white;text-align:center">     
               							<td colspan="2"><a href="Logout.jsp">로그아웃</a></td>
             				 		</tr>
                 				</table>  
                    	</fieldset>   
                    </div>
                </div>
            </div>
            <!-- 카테고리(레프트메뉴) 및 바디(실제내용) 감싸는 div 끝 -->
            <!-- footer를 감싸는 div 시작 -->
            <jsp:include page="/Template/Footer.jsp"/>
            <!-- footer를 감싸는 div 끝 -->
        </div>
    </div>
</body>
</html>
