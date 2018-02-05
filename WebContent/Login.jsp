<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
	String logval;
	String vali;
%>
<%
	if(logval != null){
		logval = request.getParameter("logval");
		vali = "";
		if(logval.equals("pwerror")){
			vali = (String)request.getAttribute("PW_ERROR");
		}
		else{
			vali = (String)request.getAttribute("NO_MEMBER");
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
    <title>Login.jsp</title>
	<meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/Styles/divLayout.css"/>
   	<script>
		window.onload=function(){
			var form = document.forms[0];
			form.onsubmit=function(){
				if(form.user.value===""){
					alert('아이디를 입력하세요?');
					form.user.focus();
					return false;
				}
				else if(form.pass.value===""){
					alert('비밀번호를 입력하세요?');
					form.pass.focus();
					return false;
				}			
			};
		};
	</script>
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
                      		 <span style="color:red;font-weight:bold"><%= vali == null ? "" : vali %></span>
                			 <form method="post" action="LoginProcess.jsp" >
                			 	 <input type="hidden" name='logval' value=''/>
                 				 <table style="width:300px;border-spacing:1px;background-color:green">
                   						<tr style="background-color:white">
                    						<td style="width:25%">아이디</td>
                    						<td><input type="text" name="user" value="<%=request.getParameter("user")==null?"":request.getParameter("user")  %>"/></td>
                   						</tr>
                   						<tr style="background-color:white">
                    						<td>비밀번호</td>
                    						<td><input type="password" name="pass" value="<%= request.getParameter("pass") == null ? "" : request.getParameter("pass") %>"></td>
                   						</tr>
                   						<tr style="background-color:white;text-align:center">     
                    						<td colspan="2"><input type="submit" value="로그인"/></td>
                  				 		</tr>
                  				</table>  
                 			</form> 
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
