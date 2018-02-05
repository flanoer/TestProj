package controller.bbs;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BBSDAO;
import model.BBSDTO;

public class WriteController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getMethod().equalsIgnoreCase("POST")) {
			
			//한글 처리
			req.setCharacterEncoding("UTF-8");
			
			//파라미터를 받으면서 데이터를 전달할 DTO 객체 생성 및 데이터 설정
			BBSDTO dto = new BBSDTO();
			dto.setTitle(req.getParameter("title"));
			dto.setContent(req.getParameter("content"));
			BBSDTO forid = (BBSDTO) req.getSession().getAttribute("already");
			dto.setId(forid.getId());
			//CRUD작업용 DAO 객체 생성
			BBSDAO dao = new BBSDAO(req.getServletContext());
			int affected = dao.insert(dto);
			dao.close();
			if(affected == 1){
				req.getRequestDispatcher("/BBS/List.jsp").forward(req, resp);
			}
			else{
				PrintWriter out = resp.getWriter();
				out.println("<script>");
				out.println("	alert('입력에 실패했습니다.');");	
				out.println("	history.back();");
				out.println("</script>");
			}
		}
	}
}
