package com.baohc.app.service.user;

import java.util.List;

import com.baohc.app.dao.user.CateUserDAO;
import com.baohc.app.dao.user.CateUserDAOImpl;
import com.baohc.app.model.CateUserDTO;

public class CateUserServiceImpl implements CateUserService{
	
	private static CateUserServiceImpl instance = null;
	private CateUserDAO cateUserDAO;
	
	private CateUserServiceImpl() {
		this.cateUserDAO = CateUserDAOImpl.getInstance();
	}
	
	public static synchronized CateUserServiceImpl getInstance() {
		if (instance == null) instance =  new CateUserServiceImpl();
		return instance;	
	}
	
	@Override
	public List<CateUserDTO> getData() {
		// TODO Auto-generated method stub
		return this.cateUserDAO.getData();
	}

	@Override
	public CateUserDTO find(CateUserDTO cate) {
		// TODO Auto-generated method stub
		return this.cateUserDAO.find(cate);
	}

	@Override
	public int insert(CateUserDTO cate) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertAll(List<CateUserDTO> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(CateUserDTO cate) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll(List<CateUserDTO> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(CateUserDTO cate) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
