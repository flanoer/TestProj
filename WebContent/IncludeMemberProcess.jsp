<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.BBSDAO"%>
<%
	//포스트 방식에서 한글깨지지 않게!
	request.setCharacterEncoding("UTF-8");

	//사용자 입력값 받기
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	
	BBSDAO dao = new BBSDAO(application);
	boolean flag = dao.insertMember(id, pwd, name);
	dao.close();
	if(flag){	
		//1.로그인 처리 - 세션 영역에 속성(식별자 - 주로 아이디) 저장
		session.setAttribute("USER_ID", id);
		session.setAttribute("USER_PW", pwd);
		
		//나머지 입력값 전달하기 위해 속성값으로..?!
		request.setAttribute("name", request.getParameter("name"));		
		request.setAttribute("gender", request.getParameter("gender"));
		request.setAttribute("grade", request.getParameter("grade"));
		request.setAttribute("file", request.getParameter("file"));
		request.setAttribute("self", request.getParameter("self"));
		request.setAttribute("inter", request.getParameterValues("inter"));
		
		//2.로그인 처리 후 MemberComplete 페이지로 포워드
		request.getRequestDispatcher("IncludeMemberComplete.jsp").forward(request, response);
	}
	else{
		//회원가입 페이지로 재요청
		response.sendRedirect("IncludeMember.jsp");
	}
	
%>