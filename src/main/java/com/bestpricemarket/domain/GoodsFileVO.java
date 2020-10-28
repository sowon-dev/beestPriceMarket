package com.bestpricemarket.domain;

public class GoodsFileVO {
	
	private int fno;
	private int f_g_gno;
	private String f_oname;
	private String f_name;
	private long f_size;
	
	
	
	
	
	public GoodsFileVO() {}
	public GoodsFileVO(int fno, int f_g_gno, String f_oname, String f_name, long f_size) {
		super();
		this.fno = fno;
		this.f_g_gno = f_g_gno;
		this.f_oname = f_oname;
		this.f_name = f_name;
		this.f_size = f_size;
	}





	public int getFno() {
		return fno;
	}





	public void setFno(int fno) {
		this.fno = fno;
	}





	public int getF_g_gno() {
		return f_g_gno;
	}





	public void setF_g_gno(int f_g_gno) {
		this.f_g_gno = f_g_gno;
	}





	public String getF_oname() {
		return f_oname;
	}





	public void setF_oname(String f_oname) {
		this.f_oname = f_oname;
	}





	public String getF_name() {
		return f_name;
	}





	public void setF_name(String f_name) {
		this.f_name = f_name;
	}





	public long getF_size() {
		return f_size;
	}





	public void setF_size(long f_size) {
		this.f_size = f_size;
	}





	@Override
	public String toString() {
		return "GoodsFileVO [fno=" + fno + ", f_g_gno=" + f_g_gno + ", f_oname=" + f_oname + ", f_name=" + f_name
				+ ", f_size=" + f_size + "]";
	}
	
	
	
	

}
