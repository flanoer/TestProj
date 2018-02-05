package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

/*
 * DAO(DATA ACCESS OBJECT) : 데이터에 접근해서 CRUD 작업을 수행하는
 * 							  업무처리 로직
 * 							 CRUD(CREATE READ UPDATE DELETE) 
 */
public class BBSDAO {
	
//	[member var]
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;

//	[constructor]
	public BBSDAO(ServletContext context){
		try {
			Context ctx = new InitialContext();
			DataSource source = (DataSource)ctx.lookup(context.getInitParameter("TOMCAT_JNDI_ROOT")+"/jdbc/jsp");
			conn = source.getConnection();
		}
		catch (NamingException e) {e.printStackTrace();}
		catch (SQLException e) {e.printStackTrace();}
		
	}
	
//	resource return
	public void close() {
		try {
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(conn != null) conn. close();
		} catch(Exception e) {}
	}
	
//	is Member?
//	isn't member = 0;
//	is member but pw incorrect = 1;
//	is member pw correct = 2;
	public int isMember(String id, String pw) {
		int flag = 0;
		try {
			String sql = "SELECT pw FROM projMem WHERE id=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
//			is member and password verification
			if(rs.next()) {
				flag += 1;
				System.out.println("DAO : "+flag);
//				is member
				String hashedPw = rs.getString(1);
				System.out.println(hashedPw);
				if(PBKDF2.validatePassword(pw, hashedPw)) {
//					and pw correct
					flag += 1;
					System.out.println("DAO : "+flag);
					return flag;
				}
				else return flag;
			}
		} catch(Exception e) {
			e.printStackTrace();
			return flag;
		}
		return flag;
	}
	
//	list get
	/*
	 * 페이징 로직 추가하기
	 * [DAO 에서 할 일]
	 * 1. 전체  목록 쿼리를 구간 쿼리로 변경
	 * 2. 총 레코드 수 구하는 메소드 추가
	 */
	public List<BBSDTO> selectList(Map<String,Object> map){
		
		List<BBSDTO> list = new Vector<BBSDTO>();
//		페이징 미 적용
//		String sql = "SELECT B.*, name FROM projbbs B JOIN MEMBER M ON B.ID = M.ID ";//name 칼럼이 마지막
//		sql += "ORDER BY postdate DESC";
		
//		페이징 적용(구간 쿼리로 변경)
//		String sql = "SELECT * FROM (SELECT T.*, ROWNUM R FROM (SELECT B.*, name FROM projbbs B JOIN MEMBER M ON B.ID = M.ID";//name 칼럼이 마지막
//		sql += "ORDER BY postdate DESC) T) WHERE R BETWEEN ? AND ?";
		String sql="SELECT * FROM (SELECT T.*,ROWNUM R FROM (SELECT b.*,name FROM projbbs b JOIN projMem m ON b.id=m.id ";
//		검색용 쿼리 추가
		if(map.get("searchColumn") != null) {
			sql += "WHERE "+map.get("searchColumn")+" LIKE '%"+map.get("searchWord")+"%'";
		}
		sql+=" ORDER BY postdate DESC) T) WHERE R BETWEEN ? AND ?";
		
		try {
			psmt = conn.prepareStatement(sql);
//			페이징을 위한 시작 및 종료 rownum 설정
			psmt.setString(1, map.get("START").toString());
			psmt.setString(2, map.get("END").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BBSDTO dto = new BBSDTO();
				dto.setNo(rs.getString(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setVisitCount(rs.getString(5));
				dto.setPostDate(rs.getDate(6));
				dto.setName(rs.getString(7));
				list.add(dto);
			}
		} catch(Exception e) {e.printStackTrace();}
		
		return list;
	}
	
	// take all records count
	public int getTotalRecordCount(Map<String, Object> map) {
		int totalCount = 0;
		try {
			String sql = "SELECT COUNT(*) FROM projbbs B JOIN MEMBER M ON B.ID = M.ID ";
			if(map.get("searchColumn") != null) {
				sql += "WHERE "+map.get("searchColumn")+" LIKE '%"+map.get("searchWord")+"%'";
			}
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();//칼럼헤더 행에서 데이터가 있는 다음 행으로..
			totalCount = rs.getInt(1);

		} catch(Exception e) {e.printStackTrace();}
		
		return totalCount;
	}
	
	//for input
	public int insert(BBSDTO dto) {
		int affected = 0;
		String sql = "INSERT INTO projbbs(no, id, title, content) VALUES(SEQ_projbbs.NEXTVAL, ?, ?, ?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			
			affected = psmt.executeUpdate();
		} catch(Exception e) {e.printStackTrace();}
		
		return affected;
	}
	
	public void updateVisitCount(String key) {
		String sql = "UPDATE projbbs SET visitcount = visitcount+1 WHERE no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, key);
			psmt.executeUpdate();
		} catch(Exception e) {e.printStackTrace();}
	}
	
	public BBSDTO selectOne(String key) {
		BBSDTO dto = null;
		String sql = "SELECT B.*, name FROM projbbs B JOIN projMem M ON B.ID = M.ID ";//name 칼럼이 마지막
		sql += "WHERE no = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, key);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto = new BBSDTO();
				dto.setNo(rs.getString(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setVisitCount(rs.getString(5));
				dto.setPostDate(rs.getDate(6));
				dto.setName(rs.getString(7));
			}
		} catch(Exception e) {e.printStackTrace();}
		
		return dto;
	}
	
	public BBSDTO memInfo(String id) {
		BBSDTO dto = null;
		String sql = "SELECT * FROM projMem WHERE id = ?";//name 칼럼이 마지막
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto = new BBSDTO();
				dto.setId(rs.getString(1));
				dto.setEmail(rs.getString(3));
				dto.setRegiDate(rs.getDate(4));
				dto.setName(rs.getString(5));
			}
		} catch(Exception e) {e.printStackTrace();}
		
		return dto;
	}
	
	public Map<String, BBSDTO> prevAndnext(String key){
		Map<String, BBSDTO> map = new HashMap<String, BBSDTO>();
		try {
			//이전글 얻기
			String sql = "SELECT no, title FROM projbbs WHERE no=(SELECT MIN(no) FROM projbbs WHERE no > ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, key);
			rs = psmt.executeQuery();
			if(rs.next()) { //이전 글이 있는 경우
				BBSDTO dto = new BBSDTO();
				dto.setNo(rs.getString(1));
				dto.setTitle(rs.getString(2));
				map.put("PREV", dto);
			}
			//다음글 얻기
			sql = "SELECT no, title FROM projbbs WHERE no=(SELECT MAX(no) FROM projbbs WHERE no < ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, key);
			rs = psmt.executeQuery();
			if(rs.next()) { //다음 글이 있는 경우
				BBSDTO dto = new BBSDTO();
				dto.setNo(rs.getString(1));
				dto.setTitle(rs.getString(2));
				map.put("NEXT", dto);
			}
		} catch(Exception e) {e.printStackTrace();}
		
		return map;
	}
	
	public int update(BBSDTO dto) {
		/*
		 * UPDATE 기존테이블명
		 * SET 컬럼명 = 새로운값, 컬럼명2 = 새로운값2
		 * [WHERE 업데이트 조건]
		 */
		int affected = 0;
		String sql = "UPDATE bbs SET title=?, content=? WHERE no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNo());
			
			affected = psmt.executeUpdate();
			
		} catch(Exception e) {e.printStackTrace();}
		
		return affected;
	}
	
	public boolean insertMember(String id, String pw, String email, String name) {
		String sql = "INSERT INTO projMem(id, pw, email, name) VALUES(?, ?, ?, ?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,id.trim());
			psmt.setString(2,pw.trim());
			psmt.setString(3,email.trim());
			psmt.setString(4,name.trim());
			psmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean delete(BBSDTO dto) {
		String sql = "DELETE projbbs WHERE no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,dto.getNo());
			psmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
