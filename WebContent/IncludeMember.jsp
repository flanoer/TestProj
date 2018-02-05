<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>IncludeMember.jsp</title>
	<meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="../Styles/divLayout.css"/>
  	<script>
		window.onload=function(){
			var form = document.forms[0];
			form.onsubmit=function(){
				if(form.id.value===""){
					alert('아이디를 입력하세요?');
					form.id.focus();
					return false;
				}
				else if(form.pwd.value===""){
					alert('비밀번호를 입력하세요?');
					form.pwd.focus();
					return false;
				}			
				else if(form.pwd2.value===""){
					alert('비밀번호 확인란을 입력하세요?');
					form.pwd2.focus();
					return false;
				}
				else if(form.pwd2.value != form.pwd.value){
					alert('비밀번호가 일치하지 않습니다.');
					form.pwd2.focus();
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
                <jsp:include page="/Template/Left.jsp"/>
                <div class="bodyPart">
                    <div class="bodyContent">
                        <h2>회원가입</h2>
					    <form method="post" name="frmObj" action="IncludeMemberProcess.jsp">
					
					        <table style="width:75%;border-spacing:1px;background-color:green">
					
					            <tr style="background-color:white">
					                <td>아이디</td>
					                <td><input type="text" name="id" size="20" /></td>
					            </tr>
					            <tr style="background-color:white">
					                <td>비밀번호</td>
					                <td><input type="password" name="pwd" size="20" /></td>
					            </tr>
					            <tr style="background-color:white">
					                <td>비밀번호확인</td>
					                <td><input type="password" name="pwd2" id="pwd2" size="20" /></td>
					            </tr>
  					            <tr style="background-color:white">
					                <td>이름</td>
					                <td><input type="text" name="name" size="20" /></td>
					            </tr>
					            <tr style="background-color:white">
					                <td>성별</td>
					                <td>
					                    <input type="radio" name="gender" value="man" />남
					                    <input type="radio" name="gender" value="woman" />녀
					                    <input type="radio" name="gender" value="etc" />기타
					                </td>
					            </tr>
					            <tr style="background-color:white">
					                <td>관심사항</td>
					                <td>
					                    <input type="checkbox" name="inter" value="pol" />정치
					                    <input type="checkbox" name="inter" value="eco" />경제
					                    <input type="checkbox" name="inter" value="spo" />스포츠
					                    <input type="checkbox" name="inter" value="ent" />연예
					
					                </td>
					            </tr>
					            <tr style="background-color:white">
					                <td>학력사항</td>
					                <td>
					                    <select name="grade">
					                        <option value="">==학력을 선택하세요==</option>
					                        <option value="ele">초등학교</option>
					                        <option value="mid">중학교</option>
					                        <option value="hig">고등학교</option>
					                        <option value="uni">대학교</option>
					                    </select>
					                </td>
					            </tr>
					            <tr style="background-color:white">
					                <td>첨부파일</td>
					                <td>
					                    <input type="file" name="file" size="40" />
					                </td>
					            </tr>
					            <tr style="background-color:white">
					                <td>자기소개</td>
					                <td>
					                    <textarea cols="60" rows="5" name="self"></textarea>
					                </td>
					            </tr>
					            <tr style="background-color:white">
					                <td colspan="2" align="center">
					                    <table>
					                        <!-- 방법1:submit기능이 있는 폼 하위태그-->
					                        <tr>
					                            <td>
					                                <input type="submit" value="회원가입" title="type=submit" />
					                            </td>
					                        </tr>
					                    </table>
					                </td>
					            </tr>
					        </table>
					    </form>
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
