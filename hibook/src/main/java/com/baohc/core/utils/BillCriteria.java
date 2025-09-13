package com.baohc.core.utils;

public class BillCriteria {
	private String keyword;
	private String userId;
	private String status;
	
	private String sortBy = "createAt";
	private String sortOrder ="DESC";
	
	private int page = 1;
	private int pageSize = 5;
	
	public BillCriteria() {
		
	}

	public BillCriteria(String keyword, String userId, int page, int pageSize) {
		super();
		this.keyword = keyword;
		this.userId = userId;
		this.page = page;
		this.pageSize = pageSize;
	}
	
	

	public BillCriteria(String keyword, String userId, String sortBy, String sortOrder, int page, int pageSize) {
		super();
		this.keyword = keyword;
		this.userId = userId;
		this.sortBy = sortBy;
		this.sortOrder = sortOrder;
		this.page = page;
		this.pageSize = pageSize;
	}
	
	public BillCriteria(String keyword, String userId, String status, String sortBy, String sortOrder, int page,
			int pageSize) {
		super();
		this.keyword = keyword;
		this.userId = userId;
		this.status = status;
		this.sortBy = sortBy;
		this.sortOrder = sortOrder;
		this.page = page;
		this.pageSize = pageSize;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getSortBy() {
		return sortBy;
	}

	public void setSortBy(String sortBy) {
		this.sortBy = sortBy;
	}

	public String getSortOrder() {
		return sortOrder;
	}

	public void setSortOrder(String sortOrder) {
		this.sortOrder = sortOrder;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getOffset() {
		return (page - 1) * pageSize;
	}
	
	public boolean hasKeyword() {
		return keyword != null && !keyword.isEmpty();
	}
	
	public boolean hasUserId() {
		return userId != null && !userId.isEmpty();
	}
	public boolean hasStatus() {
		return status != null && !status.trim().isEmpty();
	}
	@Override
	public String toString() {
		return "BillCriteria [keyword=" + keyword + ", userId=" + userId + ", sortBy=" + sortBy + ", sortOrder="
				+ sortOrder + ", page=" + page + ", pageSize=" + pageSize + "]";
	}
	
	
	
}
