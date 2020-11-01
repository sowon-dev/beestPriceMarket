package com.bestpricemarket.domain;

public class ParamVO {
	private String username;
	private String id;
	private String phone;
	private String addr1;
	private String addr2;
	private String gname;
	private int gno;
	private int lowestprice;
	
	public ParamVO() {}

	public ParamVO(String username, String id, String phone, String addr1, String addr2, String gname, int gno,
			int lowestprice) {
		super();
		this.username = username;
		this.id = id;
		this.phone = phone;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.gname = gname;
		this.gno = gno;
		this.lowestprice = lowestprice;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	public int getLowestprice() {
		return lowestprice;
	}

	public void setLowestprice(int lowestprice) {
		this.lowestprice = lowestprice;
	}

	@Override
	public String toString() {
		return "ParamVO [username=" + username + ", id=" + id + ", phone=" + phone + ", addr1=" + addr1 + ", addr2="
				+ addr2 + ", gname=" + gname + ", gno=" + gno + ", lowestrprice=" + lowestprice + "]";
	}
	
	
}
