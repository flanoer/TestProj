package controller.bbs;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BBSDAO;
import model.BBSDTO;
import model.PagingUtil;

public class ListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getMethod().equalsIgnoreCase("get")){
//			회원일 경우 게시글 목록을 뿌려준다.
			if(request.getSession().getAttribute("already") != null){
				
				//한글 처리
				request.setCharacterEncoding("UTF-8");
	
				//get parameter relative with search
				String searchColumn = request.getParameter("searchColumn");
				String searchWord = request.getParameter("searchWord");
				
				//검색 후 페이징과 관련된 파라미터를 전달할 값을 저장할 변수
				String addQuery = "";
				
				ServletContext context = request.getServletContext();
				
				//list get
				BBSDAO dao = new BBSDAO(context);
						
				Map<String,Object> map = new HashMap<String,Object>();
				
				if(searchColumn != null){
					addQuery += "searchColumn="+searchColumn+"&searchWord="+searchWord+"&";
					map.put("searchColumn", searchColumn);
					map.put("searchWord", searchWord);
				}
				
				//logic start for paging
				//take total records count
				int totalRecordCount = dao.getTotalRecordCount(map);//지금은 하는 일이 없으므로 null 넘겨줘도 된다.[검색 관련 메소드 추가 전]
						
				//pageSize
				int pageSize = Integer.valueOf(context.getInitParameter("PAGESIZE"));
						
				//blockPage
				int blockPage = Integer.valueOf(context.getInitParameter("BLOCKPAGE"));;
				
				//totalPage count
				int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
				
				//get Parameter nowPage
				int nowPage = request.getParameter("nowPage") == null ? 1 : Integer.parseInt(request.getParameter("nowPage")); 
				//처음 리스트jsp로 갈때는 파라미터가 없이 넘어오게 되므로 1을 반환 아닐때는          위 코딩을 반환
				
				//take start and end rownum
				int start = (nowPage-1) * pageSize + 1;
				int end = nowPage*pageSize;
				map.put("START", start);
				map.put("END", end);
				
				//logic end for paging
				List<BBSDTO> list = dao.selectList(map);	
				
				//resource return
				dao.close();
				
	//			4]결과값이 있으면 리퀘스트 영역에 저장
				request.setAttribute("list", list);//글 목록들
	//			- 페이징용 문자열 생성
				String pagingStr = 
						PagingUtil.pagingBootStrapStyle
						(totalRecordCount, pageSize, blockPage, nowPage, request.getContextPath()+"/BBS/List.do?");
	//			- 페이징 문자열을 request영역에 저장
				request.setAttribute("pagingStr", pagingStr);
	//			아래는 글번호 순서용
				request.setAttribute("totalRecordCount", totalRecordCount);
				request.setAttribute("nowPage", nowPage);
				request.setAttribute("pageSize", pageSize);
				
//				리퀘스트 영역에 접속 정보 저장
				request.setAttribute("already", request.getSession().getAttribute("already"));
				
	//			5]결과값을 뿌려주거나 이동할 뷰 선택 후 포워딩
	//			  - 뷰 선택
				RequestDispatcher dispatcher = request.getRequestDispatcher("/BBS/List.jsp");
				
	//			  - 포워딩
				dispatcher.forward(request, response);
			}
			else {
				request.setAttribute("SigninPlease", "접속 후 이용하세요");
				request.getRequestDispatcher("/Signin.jsp").forward(request, response);
			}
		}
	}
}
