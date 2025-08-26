package com.baohc.app.dao.book;

import java.util.List;

import com.baohc.app.model.BookDTO;
import com.baohc.app.model.PhotoDTO;

public interface PhotoDAO {
	public List<PhotoDTO> getListPhotoByBookId(BookDTO book);

	public int insert(PhotoDTO p);
	
	public PhotoDTO getCoverPhoto(BookDTO book);
	
	public int delete(PhotoDTO p);
	
	public int update(PhotoDTO p);
	
	public int deletebyBookID(String book_id);
	
	public int deleteByPathname(String pathname);
	
	public int deleteAll(List<PhotoDTO> arr);
	
	public int updateByBookID(String book_id, PhotoDTO photo);
	
	public int findByPathName(String pathname);
	
}
