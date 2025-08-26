package com.baohc.app.model;

import java.util.ArrayList;
import java.util.List;

public class PhotoDTO {

	private int id;
	private BookDTO book;
	private String pathname;
	private boolean isCover;

	public PhotoDTO() {
		super();
		
	}

	public PhotoDTO(int id, BookDTO book, String pathname, boolean isCover) {
		super();
		this.id = id;
		this.book = book;
		this.pathname = pathname;
		this.isCover = isCover;
	}

	public PhotoDTO(int id, BookDTO book, String pathname) {
		super();
		this.id = id;
		this.book = book;
		this.pathname = pathname;
	}

	public PhotoDTO(BookDTO book, String pathname) {
		super();
		this.book = book;
		this.pathname = pathname;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public BookDTO getBook() {
		return book;
	}

	public void setBook(BookDTO book) {
		this.book = book;
	}

	public String getPathname() {
		return pathname;
	}

	public void setPathname(String pathname) {
		this.pathname = pathname;
	}

	public boolean isCover() {
		return isCover;
	}

	public void setCover(boolean isCover) {
		this.isCover = isCover;
	}

	@Override
	public String toString() {
		return "PhotoDTO [id=" + id + ", book=" + book.getId() + ", pathname=" + pathname + ", isCover=" + isCover + "]";
	}
	
}
