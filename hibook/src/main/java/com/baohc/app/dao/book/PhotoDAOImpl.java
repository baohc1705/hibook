package com.baohc.app.dao.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.baohc.app.model.BookDTO;
import com.baohc.app.model.PhotoDTO;
import com.baohc.app.service.book.BookService;
import com.baohc.app.service.book.BookServiceImpl;
import com.baohc.core.utils.ConnectionKit;

public class PhotoDAOImpl implements PhotoDAO {
	private static PhotoDAOImpl instance = null;

	private PhotoDAOImpl() {
	}

	public static synchronized PhotoDAOImpl getInstance() {
		if (instance == null)
			instance = new PhotoDAOImpl();
		return instance;
	}

	@Override
	public List<PhotoDTO> getListPhotoByBookId(BookDTO book) {
		List<PhotoDTO> list = new ArrayList<PhotoDTO>();
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null)
				return list;
			String query = "SELECT * FROM photo WHERE book_id=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, book.getId());
			ResultSet rs = pmt.executeQuery();
			while (rs.next()) {
				PhotoDTO p = mapResultSet(rs);
				list.add(p);
			}
			if (rs != null)
				rs.close();
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int insert(PhotoDTO p) {
		int res = 0;
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null)
				return res;
			String query = "INSERT INTO photo (book_id, pathname, isCover) VALUES (?,?,?)";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, p.getBook().getId());
			pmt.setString(2, p.getPathname());
			pmt.setInt(3, p.isCover() ? 1 : 0);
			int row = pmt.executeUpdate();
			if (row > 1) {
				res = 1;
				try (ResultSet rs = pmt.getGeneratedKeys()) {
					if (rs.next()) {
						int photoId = rs.getInt("id");
						p.setId(photoId);
					}
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public PhotoDTO getCoverPhoto(BookDTO book) {
		PhotoDTO res = null;
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null)
				return res;
			String query = "SELECT * FROM photo WHERE book_id=? AND isCover=1 LIMIT 1";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, book.getId());
			ResultSet rs = pmt.executeQuery();
			while (rs.next()) {
				PhotoDTO p = mapResultSet(rs);
				res = p;
			}
			if (rs != null)
				rs.close();
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int delete(PhotoDTO p) {
		int res = 0;
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null)
				return res;
			String query = "DELETE FROM photo WHERE id=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setInt(1, p.getId());
			int row = pmt.executeUpdate();
			row = res > 0 ? 1 : 0;
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;

	}

	@Override
	public int update(PhotoDTO p) {
		int res = 0;
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null)
				return res;
			String query = "UPDATE photo SET pathname=?, book_id=?, isCover=? WHERE id=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, p.getPathname());
			pmt.setString(2, p.getBook().getId());
			pmt.setInt(3, p.isCover() ? 1 : 0);
			pmt.setInt(4, p.getId());
			int row = pmt.executeUpdate();
			row = res > 0 ? 1 : 0;
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int deletebyBookID(String book_id) {
		int res = 0;

		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null)
				return res;
			String query = "DELETE FROM photo WHERE book_id=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, book_id);
			int row = pmt.executeUpdate();
			res = row > 0 ? 1 : 0;
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return res;
	}
	
	@Override
	public int deleteByPathname(String pathname) {
		int res = 0;

		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null)
				return res;
			String query = "DELETE FROM photo WHERE pathname=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, pathname);
			int row = pmt.executeUpdate();
			res = row > 0 ? 1 : 0;
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int deleteAll(List<PhotoDTO> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByBookID(String book_id, PhotoDTO photo) {
		int res = 0;

		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null)
				return res;
			String query = "UPDATE photo SET pathname=?, isCover=? WHERE book_id=? AND id=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, photo.getPathname());
			pmt.setInt(2, photo.isCover() ? 1 : 0);
			pmt.setString(3, book_id);
			pmt.setInt(4, photo.getId());
			int row = pmt.executeUpdate();
			res = row > 0 ? 1 : 0;
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int findByPathName(String pathname) {
		int res = -1;
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null)
				return res;
			String query = "SELECT id FROM photo WHERE pathname=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, pathname);
			ResultSet rs = pmt.executeQuery();
			if (rs.next()) 
				res = rs.getInt("id");
			
			if (rs != null)
				rs.close();
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

//	Helper map resultset 
	private PhotoDTO mapResultSet(ResultSet rs) throws SQLException {
		PhotoDTO photoDTO = new PhotoDTO();
		BookService bookService = BookServiceImpl.getInstance();
		try {
			photoDTO.setId(rs.getInt("id"));
			photoDTO.setBook(bookService.findById(rs.getString("book_id")));
			photoDTO.setPathname(rs.getString("pathname"));
			photoDTO.setCover(rs.getInt("isCover") == 1 ? true : false);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return photoDTO;
	}

}
