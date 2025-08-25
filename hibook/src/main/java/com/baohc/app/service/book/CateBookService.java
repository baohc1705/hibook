package com.baohc.app.service.book;

import java.util.List;

import com.baohc.app.model.CateBookDTO;

public interface CateBookService {
	public List<CateBookDTO> getAllCateBook();
	public CateBookDTO findById(int id);
	public int insert(CateBookDTO catebook);
	public int insertAll(List<CateBookDTO> arr);
	public int delete(CateBookDTO catebook);
	public int deleteAll(List<CateBookDTO> arr);
	public int update(CateBookDTO catebook);
}
