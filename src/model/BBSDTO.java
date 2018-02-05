package model;

import java.sql.Date;

/*
 * DTO(DATA TRANSFER OBJECT) : 데이터를 전송하는 객체로
 * 							    
 */
public class BBSDTO {
	
//	[attribute or member var]
	private String no;
	private String id;
	private String email;
	private String pw;
	private String title;
	private String content;
	private String visitCount;
	private Date postDate;
	private Date regiDate;
	
//	for programming efficiency add attribute
	private String name;
	
	
//	default constructor
	public BBSDTO() {}


//	using constructor
	public BBSDTO(String no, String id, String title, String content, String email, String visitCount, Date postDate) {
		super();
		this.no = no;
		this.id = id;
		this.email = email;
		this.title = title;
		this.content = content;
		this.visitCount = visitCount;
		this.postDate = postDate;
	}
	
//	[getter & setter]
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getVisitCount() {
		return visitCount;
	}

	public void setVisitCount(String visitCount) {
		this.visitCount = visitCount;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public Date getRegiDate() {
		return regiDate;
	}

	public void setRegiDate(Date regiDate) {
		this.regiDate = regiDate;
	}

	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}
