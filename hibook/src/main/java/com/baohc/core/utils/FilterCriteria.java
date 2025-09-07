package com.baohc.core.utils;

public class FilterCriteria {
	private String keyword;
	private Integer cateBookId;
	private double minPrice;
	private double maxPrice;
	private int page = 1;
	private int pageSize = 5;
	private String sortBy = "id";
	private String sortOrder = "ASC";
	private Integer promotionId;
	private String authorId;
	public FilterCriteria() {
		super();
	}
	public FilterCriteria(String keyword, Integer cateBookId, double minPrice, double maxPrice, int page, int pageSize,
			String sortBy, String sortOrder) {
		super();
		this.keyword = keyword;
		this.cateBookId = cateBookId;
		this.minPrice = minPrice;
		this.maxPrice = maxPrice;
		this.page = page;
		this.pageSize = pageSize;
		this.sortBy = sortBy;
		this.sortOrder = sortOrder;
	}
	
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Integer getCateBookId() {
		return cateBookId;
	}
	public void setCateBookId(Integer cateBookId) {
		this.cateBookId = cateBookId;
	}
	public double getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(double minPrice) {
		this.minPrice = minPrice;
	}
	public double getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(double maxPrice) {
		this.maxPrice = maxPrice;
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
	
	public Integer getPromotionId() {
		return promotionId;
	}
	public void setPromotionId(Integer promotionId) {
		this.promotionId = promotionId;
	}
	public String getAuthorId() {
		return authorId;
	}
	public void setAuthorId(String authorId) {
		this.authorId = authorId;
	}
	public int getOffset() {
		return (page - 1) * pageSize;
	}
	
	public boolean hasKeyword() {
		return keyword != null && !keyword.isEmpty();
	}
	
	public boolean hasCategoryFilter() {
		return cateBookId != null && cateBookId > 0;
	}
	
	public boolean hasPriceFilter() {
		return (minPrice > 0 || maxPrice > 0);
	}
	
	public boolean hasPromotionFilter() {
		return promotionId != null && promotionId > 0;
	}
	
	public boolean hasAuthorFilter() {
		return authorId != null && !authorId.isEmpty();
	}
}
