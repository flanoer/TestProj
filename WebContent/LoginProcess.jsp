<%@ page import="model.BBSDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- LoginProcess.jsp -->
<%
	//사용자 입력값 받기
	String user = request.getParameter("user");
	String pass = request.getParameter("pass");
	
	//아이디 : KIM 이고 비밀번호 : 1234 면 회원이라고 가정
	//if("KIM".equals(user) && "1234".equals(pass)){//회원
	BBSDAO dao = new BBSDAO(application);
	int flag = dao.isMember(user, pass);
	dao.close();
	if(flag <= 2){	
		//1.로그인 처리 - 세션 영역에 속성(식별자 - 주로 아이디) 저장
		session.setAttribute("USER_ID", user);
		System.out.println("1");
	}
	if(flag == -1){
		request.setAttribute("PW_ERROR", "비밀번호가 틀립니다.");
		out.println("<input type='hidden' name='logval' value='pwerror'/>");
		request.getRequestDispatcher("Login.jsp").forward(request, response);
		System.out.println("2");
	}
	if(flag == 2){
		session.setAttribute("USER_PW", pass);
		
		//2.로그인 처리 후 마이페이지로 이동
		response.sendRedirect("MyPage.jsp");
		System.out.println("3");
	}
	else{//비회원 - 다시 로그인 페이지로 포워드
		//out.println("<script>");
		//out.println("	alert('회원 정보가 없습니다.');");
		//out.println("	history.back();");
		//out.println("</script>");
		
		//에러메시지 저장
		request.setAttribute("NO_MEMBER", "회원 정보가 존재하지 않습니다.");
		out.println("<input type='hidden' name='logval' value='nomember'/>");
		//로그인 페이지로 포워드
		System.out.println("4");
		request.getRequestDispatcher("Login.jsp").forward(request, response);
		System.out.println("5");
	}
	
%>