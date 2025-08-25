package com.baohc.app.service.book;

import java.util.List;

import com.baohc.app.dao.book.CateBookDAO;
import com.baohc.app.dao.book.CateBookDAOImpl;
import com.baohc.app.model.CateBookDTO;

public class CateBookServiceImpl implements CateBookService {
	private CateBookDAO cateBookDAO;
	private static CateBookServiceImpl instance = null;
	
	private CateBookServiceImpl() {
		cateBookDAO = CateBookDAOImpl.getInstance();
	}
	public static synchronized CateBookServiceImpl getInstance() {
		if (instance == null) instance = new CateBookServiceImpl();
		return instance;
	}
	
	@Override
	public List<CateBookDTO> getAllCateBook() {
		
		return cateBookDAO.getAllCateBook();
	}

	@Override
	public CateBookDTO findById(int id) {
		// TODO Auto-generated method stub
		return cateBookDAO.findById(id);
	}

	@Override
	public int insert(CateBookDTO catebook) {
		// TODO Auto-generated method stub
		return cateBookDAO.insert(catebook);
	}

	@Override
	public int insertAll(List<CateBookDTO> arr) {
		// TODO Auto-generated method stub
		return cateBookDAO.insertAll(arr);
	}

	@Override
	public int delete(CateBookDTO catebook) {
		// TODO Auto-generated method stub
		return cateBookDAO.delete(catebook);
	}

	@Override
	public int deleteAll(List<CateBookDTO> arr) {
		// TODO Auto-generated method stub
		return cateBookDAO.deleteAll(arr);
	}

	@Override
	public int update(CateBookDTO catebook) {
		// TODO Auto-generated method stub
		return cateBookDAO.update(catebook);
	}

}
