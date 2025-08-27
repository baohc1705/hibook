package com.baohc.core.utils;

import java.util.ArrayList;
import java.util.List;

public class PaginationKit {
	public static List<Object> getPagination(int current, int last) {
		int delta = 1; // nút xung quanh
		int left = current - delta;
		int right = current + delta;
		List<Integer> range = new ArrayList<Integer>();
		List<Object> rangeWithDots = new ArrayList<Object>();
		Integer l = null;
		
		for (int i = 1; i <= last; i++) {
			if (i == 1 || i == last || (i >= left && i <= right)) {
				range.add(i);
			}
		}
		
		for (int i : range) {
			if (l != null) {
				if (i - l == 2) {
					rangeWithDots.add(l + 1);
				}
				else if (i - l != 1) {
					rangeWithDots.add("...");
				}
			}
			rangeWithDots.add(i);
			l = i;
		}
		
		return rangeWithDots;	
	}
	
	public static void main(String[] args) {
		for (int i = 1; i <= 20; i++) {
			System.out.print("Trang " + i + " : ");
			System.out.println(getPagination(i, 20));
		}
	}
}
