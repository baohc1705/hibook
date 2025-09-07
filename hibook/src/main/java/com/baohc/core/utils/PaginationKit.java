package com.baohc.core.utils;

import java.util.ArrayList;
import java.util.List;

public class PaginationKit {
	private int currentPage;
	private int totalPages;
	private int pageSize;
	private int totalRecords;
	private int startRecord;
	private int endRecord;

	public PaginationKit(int currentPage, int totalPages, int pageSize, int totalRecords) {
		super();
		this.currentPage = currentPage;
		this.totalPages = totalPages;
		this.pageSize = pageSize;
		this.totalRecords = totalRecords;
		this.startRecord = (currentPage - 1) * pageSize + 1;
		this.endRecord = Math.min(currentPage * pageSize, totalRecords);
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public int getPageSize() {
		return pageSize;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public int getStartRecord() {
		return startRecord;
	}

	public int getEndRecord() {
		return endRecord;
	}
	
	public boolean ishasPrevious() {
		return currentPage > 1;
	}
	
	public boolean ishasNext() {
		return currentPage < totalPages;
	}
	
	public int getPreviousPage() {
		return currentPage - 1;
	}
	
	public int getNextPage() {
		return currentPage + 1;
	}
	
	public boolean isFirstPage() {
		return currentPage == 1;
	}
	
	public boolean isLastPage() {
		return currentPage == totalPages;
	}
	
	public List<Object> getPagination() {
		int delta = 1; // nút xung quanh
		int left = currentPage - delta;
		int right = currentPage + delta;
		List<Integer> range = new ArrayList<Integer>();
		List<Object> rangeWithDots = new ArrayList<Object>();
		Integer l = null;

		for (int i = 1; i <= totalPages; i++) {
			if (i == 1 || i == totalPages || (i >= left && i <= right)) {
				range.add(i);
			}
		}

		for (int i : range) {
			if (l != null) {
				if (i - l == 2) {
					rangeWithDots.add(l + 1);
				} else if (i - l != 1) {
					rangeWithDots.add("...");
				}
			}
			rangeWithDots.add(i);
			l = i;
		}

		return rangeWithDots;
	}

	public static void main(String[] args) {
		
		for (int i = 1; i <= 10; i++) {
			PaginationKit rangeWithDot = new PaginationKit(i, 10, 5, 50);
			System.out.print("Trang " + i + " : ");
			System.out.println(rangeWithDot.getPagination());
		}
		
		
	}
}
