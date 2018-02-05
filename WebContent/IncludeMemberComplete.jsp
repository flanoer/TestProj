<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	String getValue(String value){
		switch(value){
			case "eco" : return "경제";
			case "pol" : return "정치";
			case "spo" : return "스포츠";
			default : return "연예";
		}
	};
%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("USER_ID");
	String pwd = (String)session.getAttribute("USER_PW");
	String name = request.getParameter("name");
	String gen = request.getParameter("gender");
	String grade = request.getParameter("grade");
	String file = request.getParameter("file");
	String self = request.getParameter("self");
	
	String value = "";
	String [] inters = request.getParameterValues("inter");
	for(String inter : inters){
		value += getValue(inter)+" ";
	}
%>
<!DOCTYPE html>
<html>
<head>
    <title>IncludeMemberComplete.jsp</title>
	<meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="../Styles/divLayout.css"/>
</head>
<body>
    <div class="allWrap">
        <div class="partWrap">
            <!-- 탑메뉴 및 로고 감싸는 div 시작-->
            <!-- 
            	이 페이지로는 모듈화를 하지 않는다.
            	나중에 배울 Include Action Tag 로 한다.
             -->
            <div class="header">
                <div class="logo">
                    <img src="../Images/logo.png" alt="로고 이미지" />
                </div>
                <jsp:include page="/Template/Top.jsp" />
            </div>
            <!-- 탑메뉴 및 로고 감싸는 div 끝 -->
            <!-- 카테고리(레프트메뉴) 및 바디(실제내용) 감싸는 div 시작 -->
            <div class="body">
                <%--  <%@ include file="/Template/Left.jsp" %> --%>
                <jsp:include page="/Template/Left.jsp"/>
                <div class="bodyPart">
                    <div class="bodyContent">
                        <h2>회원 가입 완료</h2>
                        <h3>회원가입을 축하합니다.</h3>
                        <h2>목록형태로 표시하기</h2>
                        <ul style="list-style-type: decimal;">
                        	<li>아이디    : <%= id %></li>
                        	<li>비밀번호 : <%=pwd %></li>
                        	<li>성      별 : <%=gen %></li>
                        	<li>관심사항 : <%=value %></li>
                        	<li>학력사항 : <%=grade %></li>
                        	<li>첨부파일 : <%=file %></li>
                        	<li>자기소개<br/><%= self.replace("\r\n", "<br/>") %></li>
                        </ul>
                        <h2>표형태로 표시하기</h2>
                        <table style="width:75%;border-spacing:1px;background-color:green">
					
					            <tr style="background-color:white">
					                <td>아이디</td>
					                <td><input type="text" name="id" size="20" value="<%= id %>"/></td>
					            </tr>
					            <tr style="background-color:white">
					                <td>비밀번호</td>
					                <td><input type="password" name="pwd" size="20" value="<%= pwd %>"/></td>
					            </tr>
					            <tr style="background-color:white">
					                <td>성별</td>
					                <td>
					                	<input type="radio" name="gender" value="man" <%=gen.indexOf("man") != -1 ? "checked" : "" %>/>남
					                    <input type="radio" name="gender" value="woman" <%=gen.indexOf("woman") != -1 ? "checked" : "" %>/>녀
					                    <input type="radio" name="gender" value="etc" <%=gen.indexOf("etc") != -1 ? "checked" : "" %>/>기타
					                </td>
					            </tr>
					            <tr style="background-color:white">
					                <td>관심사항</td>
					                <td>
					                    <input type="checkbox" name="inter" value="pol" <%if(value.contains("정치")){ %>checked<%} %>/>정치
					                    <input type="checkbox" name="inter" value="eco" <%if(value.contains("경제")){ %>checked<%} %>/>경제
					                    <input type="checkbox" name="inter" value="spo" <%if(value.contains("스포츠")){ %>checked<%} %>/>스포츠
					                    <input type="checkbox" name="inter" value="ent" <%if(value.contains("연예")){ %>checked<%} %>/>연예
					
					                </td>
					            </tr>
					            <tr style="background-color:white">
					                <td>학력사항</td>
					                <td>
					                    <select name="grade">
					                        <option value="ele" <%if(grade.equals("ele")){%>selected<%} %>>초등학교</option>
					                        <option value="mid" <%if(grade.equals("mid")){%>selected<%} %>>중학교</option>
					                        <option value="hig" <%if(grade.equals("hig")){%>selected<%} %>>고등학교</option>
					                        <option value="uni" <%if(grade.equals("uni")){%>selected<%} %>>대학교</option>
					                    </select>
					                </td>
					            </tr>
					            <tr style="background-color:white">
					                <td>첨부파일</td>
					                <td>
					                    <input type="file" name="file" size="40" /><%=file %>
					                </td>
					            </tr>
					            <tr style="background-color:white">
					                <td>자기소개</td>
					                <td>
					                    <textarea cols="60" rows="5" name="self"><%=self %></textarea>
					                </td>
					            </tr>
					            
					        </table>
                    </div>
                </div>
            </div>
            <!-- 카테고리(레프트메뉴) 및 바디(실제내용) 감싸는 div 끝 -->
            <!-- footer를 감싸는 div 시작 -->
            <jsp:include page="/Template/Footer.jsp" />
            <!-- footer를 감싸는 div 끝 -->
        </div>
    </div>
</body>
</html>
