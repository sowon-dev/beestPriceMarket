package com.bestpricemarket.domain;

public class Criteria {
	// 페이지 정보, 페이지 크기 정보를 저장하는 객체 
	
	private int page;
	private int pageSize;
	
	
	public Criteria() {
		this.page = 1;
		this.pageSize = 9;
	}
	
	
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public void setPageSize(int pageSize) {
		
		if(pageSize <=0 || pageSize >= 100) {
			this.pageSize = 9;
			return;
		}
		
		this.pageSize = pageSize;
	}
	
	
	public int getPage() {
		return page;
	}
	
	public int getPageSize() {
		return pageSize;
	}


	// 페이징 처리 시작하는 값
	// page = (page -1) * 10;
	public int getPageStart() {
		
		return (this.page -1) * this.pageSize;
	}


	@Override
	public String toString() {
		return "Criteria [page=" + page + ", pageSize=" + pageSize + "]";
	}
	
	
	
	

}
