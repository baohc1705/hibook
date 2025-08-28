package com.baohc.app.dao.book;

import java.util.List;
import com.baohc.app.model.BookDTO;

public interface BookDAO {
	public List<BookDTO> getAllBook();

	public BookDTO findById(String id);

	public int insert(BookDTO book);

	public int insertAll(List<BookDTO> arr);

	public int delete(BookDTO book);

	public int deleteAll(List<BookDTO> arr);

	public int update(BookDTO book);
	
	public List<BookDTO> getAllBookByPage(int page, int pageSize);
	
	public int getTotalRecord();
	
	public List<BookDTO> getSortPagination(int page, int pageSize, String field, String sort);
	
	public List<BookDTO> sort(String field, String sort);
}
