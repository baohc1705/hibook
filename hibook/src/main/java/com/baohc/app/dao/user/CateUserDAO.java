package com.baohc.app.dao.user;

import java.util.List;

import com.baohc.app.model.CateUserDTO;

public interface CateUserDAO {

	public List<CateUserDTO> getData();
	
	public CateUserDTO find(CateUserDTO cate);
	
	public int insert(CateUserDTO cate);
	
	public int insertAll(List<CateUserDTO> arr);
	
	public int delete(CateUserDTO cate);
	
	public int deleteAll(List<CateUserDTO> arr);
	
	public int update(CateUserDTO cate);
}
