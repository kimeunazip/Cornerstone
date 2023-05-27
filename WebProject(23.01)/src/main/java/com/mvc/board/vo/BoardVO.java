package com.mvc.board.vo;

public class BoardVO {
	
	//field
	private int num;
	private String author;
	private String title;
	private String content;
	private String writeday;
	private int readcnt;
	private String passwd;
	
	private int repRoot;
	private int repStep;
	private int repIndent;
	private int rCount;
	
	private String search = "";
	private String keyword= "";
	//기본값이 null이 아니라 ""로 빈문자를 제어하고자하는 의미
	
	
	//constructor
		public BoardVO() {
		}
	public BoardVO(int num, String author, String title, String content, String writeday, int readcnt, String passwd,
			int repRoot, int repStep, int repIndent, int rCount, String search, String keyword) {
		super();
		this.num = num;
		this.author = author;
		this.title = title;
		this.content = content;
		this.writeday = writeday;
		this.readcnt = readcnt;
		this.passwd = passwd;
		this.repRoot = repRoot;
		this.repStep = repStep;
		this.repIndent = repIndent;
		this.rCount = rCount;
		this.search = search;
		this.keyword = keyword;
	}
	
	//getter,setter
	
	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
	}


	public String getAuthor() {
		return author;
	}


	public void setAuthor(String author) {
		this.author = author;
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


	public String getWriteday() {
		return writeday;
	}


	public void setWriteday(String string) {
		this.writeday = string;
	}


	public int getReadcnt() {
		return readcnt;
	}


	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}


	public String getPasswd() {
		return passwd;
	}


	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public int getRepRoot() {
		return repRoot;
	}
	public void setRepRoot(int repRoot) {
		this.repRoot = repRoot;
	}

	public int getRepStep() {
		return repStep;
	}

	public void setRepStep(int repStep) {
		this.repStep = repStep;
	}


	public int getRepIndent() {
		return repIndent;
	}


	public void setRepIndent(int repIndent) {
		this.repIndent = repIndent;
	}


	public int getrCount() {
		return rCount;
	}


	public void setrCount(int rCount) {
		this.rCount = rCount;
	}


	public String getSearch() {
		return search;
	}


	public void setSearch(String search) {
		this.search = search;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	//toString
	@Override
	public String toString() {
		return "BoardVO [num=" + num + ", author=" + author + ", title=" + title + ", content=" + content
				+ ", writeday=" + writeday + ", readcnt=" + readcnt + ", passwd=" + passwd + "]";
	}
}
