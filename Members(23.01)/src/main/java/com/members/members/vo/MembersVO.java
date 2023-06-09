package com.members.members.vo;

public class MembersVO {
	
	//field(9)
		private int num;
		private String id;
		private String pw ;
		private String name;
		private String phone;
		private String email;
		private String address;
		private String regdate;
		private int status;
	
	//constructor
		public MembersVO() {}

		public MembersVO(int num, String id, String pw, String name, String phone, String email, String address,
				String regdate, int status) {
			super();
			this.num = num;
			this.id = id;
			this.pw = pw;
			this.name = name;
			this.phone = phone;
			this.email = email;
			this.address = address;
			this.regdate = regdate;
			this.status = status;
		}
		
	//getter,setter
		public int getNum() {
			return num;
		}

		public void setNum(int num) {
			this.num = num;
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

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getPhone() {
			return phone;
		}

		public void setPhone(String phone) {
			this.phone = phone;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getRegdate() {
			return regdate.substring(0,10);
		}

		public void setRegdate(String regdate) {
			this.regdate = regdate;
		}

		public int getStatus() {
			return status;
		}

		public void setStatus(int status) {
			this.status = status;
		}
	
	//toString
		@Override
		public String toString() {
			return "MembersVO [num=" + num + ", id=" + id + ", pw=" + pw + ", name=" + name + ", phone=" + phone
					+ ", email=" + email + ", address=" + address + ", regdate=" + regdate + ", status=" + status + "]";
		}
		
		
	
		
	
}