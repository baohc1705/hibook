package com.baohc.app.dao.book;

import java.util.List;
import com.baohc.app.model.BookDTO;
import com.baohc.app.model.CateBookDTO;
import com.baohc.core.utils.FilterCriteria;

public interface BookDAO {
	public List<BookDTO> getAllBook();

	public BookDTO findById(String id);

	public int insert(BookDTO book);

	public int insertAll(List<BookDTO> arr);

	public int delete(BookDTO book);

	public int deleteAll(List<BookDTO> arr);

	public int update(BookDTO book);
	
	public List<BookDTO> getBooksLimitOffset(int page, int pageSize);
	
	public int countBook();
	
	public List<BookDTO> getBooksWithFilter(FilterCriteria criteria);
	
	public int countBooksWithFilter(FilterCriteria criteria);
	
	public List<BookDTO> getBooksCategory(CateBookDTO cateBookDTO);
	
}
