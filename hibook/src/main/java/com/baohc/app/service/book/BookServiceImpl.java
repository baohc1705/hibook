package com.baohc.app.service.book;

import java.util.List;

import com.baohc.app.dao.book.BookDAO;
import com.baohc.app.dao.book.BookDAOImpl;
import com.baohc.app.model.BookDTO;
import com.baohc.app.model.CateBookDTO;
import com.baohc.core.utils.FilterCriteria;

public class BookServiceImpl implements BookService {
	private BookDAO bookDAO;

	private static BookServiceImpl instance = null;

	private BookServiceImpl() {
		bookDAO = BookDAOImpl.getInstance();
	}

	public static synchronized BookServiceImpl getInstance() {
		if (instance == null)
			instance = new BookServiceImpl();
		return instance;
	}

	@Override
	public List<BookDTO> getAllBook() {

		return bookDAO.getAllBook();
	}

	@Override
	public BookDTO findById(String id) {
		// TODO Auto-generated method stub
		return bookDAO.findById(id);
	}

	@Override
	public int insert(BookDTO book) {
		// TODO Auto-generated method stub
		return bookDAO.insert(book);
	}

	@Override
	public int insertAll(List<BookDTO> arr) {
		// TODO Auto-generated method stub
		return bookDAO.insertAll(arr);
	}

	@Override
	public int delete(BookDTO book) {
		// TODO Auto-generated method stub
		return bookDAO.delete(book);
	}

	@Override
	public int deleteAll(List<BookDTO> arr) {
		// TODO Auto-generated method stub
		return bookDAO.deleteAll(arr);
	}

	@Override
	public int update(BookDTO book) {
		// TODO Auto-generated method stub
		return bookDAO.update(book);
	}

	@Override
	public List<BookDTO> getBooksLimitOffset(int limit, int offset) {
		// TODO Auto-generated method stub
		return bookDAO.getBooksLimitOffset(limit, offset);
	}

	@Override
	public int countBook() {
		// TODO Auto-generated method stub
		return bookDAO.countBook();
	}

	@Override
	public List<BookDTO> getBooksWithFilter(FilterCriteria criteria) {
		// TODO Auto-generated method stub
		return bookDAO.getBooksWithFilter(criteria);
	}
	
	@Override
	public int countBooksWithFilter(FilterCriteria criteria) {
		// TODO Auto-generated method stub
		return bookDAO.countBooksWithFilter(criteria);
	}
	
	@Override
	public List<BookDTO> getBooksCategory(CateBookDTO cateBookDTO) {
		// TODO Auto-generated method stub
		return bookDAO.getBooksCategory(cateBookDTO);
	}
}
