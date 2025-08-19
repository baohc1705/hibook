package com.baohc.model;

import java.util.List;

public interface DAOInterface <Obj>{
	public List<Obj> getData();
	
	public Obj find(Obj o);
	
	public int insert(Obj o);
	
	public int insertAll(List<Obj> arr);
	
	public int delete(Obj o);
	
	public int deleteAll(List<Obj> arr);
	
	public int update(Obj o);
	
}
