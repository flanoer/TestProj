package controller.mem;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BBSDAO;
import model.BBSDTO;
import model.PBKDF2;

public class memberController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String id = null, pw = null, email = null, name = null;
		id = req.getParameter("id");
		pw = req.getParameter("pw");
		BBSDAO dao = new BBSDAO(req.getServletContext());
		BBSDTO dto = null;
		
		if(req.getMethod().equalsIgnoreCase("post")) {
			if(req.getParameter("mode").equalsIgnoreCase("createAccount")) {//hidden param == createAccount
				email = req.getParameter("email");
				name = req.getParameter("name");
				dto = new BBSDTO();
				boolean flag = false;
				try {
					flag = dao.insertMember(id, PBKDF2.createHash(pw), email, name);
					dto = dao.memInfo(id);
				} catch (Exception e) {e.printStackTrace();}
				dao.close();
				if(flag) {
					req.setAttribute("mem", dto);
					req.setAttribute("mem_suc_fail", null);
					req.getRequestDispatcher("celebrate.jsp").forward(req, resp);
				}
				else {//id가 중복일 때?
					req.setAttribute("mem_suc_fail", "중복되는 ID가 있어요!");
					req.getRequestDispatcher("FilltheMemberForm.jsp").forward(req, resp);
				}
			}
			else {//hidden param == signIn
				dto = new BBSDTO();
				int intflag = dao.isMember(id, pw);
				switch(intflag) {
					case 0: {//is not member
						req.setAttribute("MSG", "회원정보가 존재하지 않습니다. 가입을 원하시면 아래의 빈칸들을 채워주세요.");
						req.getRequestDispatcher("FilltheMemberForm.jsp").forward(req,resp);
					}
						break;
					case 1: {//is member but pw incorrect
						req.setAttribute("pw_incorrect", "비밀번호가 틀렸습니다. 다시 입력해주세요.");
						req.getRequestDispatcher("Signin.jsp").forward(req,resp);
					}
						break;
					default:{//is member and pw correct
						dto = dao.memInfo(id);
						System.out.println(dto.getId()+dto.getEmail()+dto.getRegiDate());
						req.getSession().setAttribute("already", dto);
						req.getSession().setAttribute("out", 1);
						req.getRequestDispatcher("celebrate.jsp").forward(req, resp);
					}
				}
				dao.close();
			}
		}
	}

	
	
}
