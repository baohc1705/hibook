package com.baohc.app.dao.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.baohc.app.model.BookDTO;
import com.baohc.app.service.author.AuthorService;
import com.baohc.app.service.author.AuthorServiceImpl;
import com.baohc.app.service.book.CateBookService;
import com.baohc.app.service.book.CateBookServiceImpl;
import com.baohc.app.service.promotion.PromotionService;
import com.baohc.app.service.promotion.PromotionServiceImpl;
import com.baohc.core.utils.ConnectionKit;
import com.baohc.core.utils.FilterCriteria;

public class BookDAOImpl implements BookDAO {

	private static BookDAOImpl instance = null;

	private BookDAOImpl() {
	}

	public static synchronized BookDAOImpl getInstance() {
		if (instance == null)
			instance = new BookDAOImpl();
		return instance;
	}

	@Override
	public List<BookDTO> getAllBook() {
		List<BookDTO> list = new ArrayList<>();
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null)
				return list;

			String query = "SELECT * FROM book";
			PreparedStatement pmt = con.prepareStatement(query);
			ResultSet rs = pmt.executeQuery();

			while (rs.next()) {
				BookDTO book = mapResultSetToBook(rs);
				list.add(book);
			}

			if (rs != null)
				rs.close();
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(con);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public BookDTO findById(String id) {
		BookDTO res = null;
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null)
				return res;

			String query = "SELECT * FROM book WHERE id=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, id);
			ResultSet rs = pmt.executeQuery();

			if (rs.next()) {
				res = mapResultSetToBook(rs);
			}

			if (rs != null)
				rs.close();
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(con);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int insert(BookDTO book) {
		int res = 0;
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null)
				return res;

			String query = "INSERT INTO book (id, cateBook_id, author_id, promotion_id, name, price, amount, description) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, book.getId());
			pmt.setInt(2, book.getCateBook().getId());
			pmt.setString(3, book.getAuthor().getId());
			pmt.setInt(4, book.getPromotion().getId());
			pmt.setString(5, book.getName());
			pmt.setDouble(6, book.getPrice());
			pmt.setInt(7, book.getAmount());
			pmt.setString(8, book.getDescription());

			int row = pmt.executeUpdate();
			res = row > 0 ? 1 : 0;

			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(con);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int insertAll(List<BookDTO> arr) {
		int dem = 0;
		for (BookDTO item : arr) {
			dem += insert(item);
		}
		return dem;
	}

	@Override
	public int delete(BookDTO book) {
		int res = 0;
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null)
				return res;

			String query = "DELETE FROM book WHERE id=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, book.getId());

			int row = pmt.executeUpdate();
			res = row > 0 ? 1 : 0;

			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(con);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int deleteAll(List<BookDTO> arr) {
		int dem = 0;
		for (BookDTO item : arr) {
			dem += delete(item);
		}
		return dem;
	}

	@Override
	public int update(BookDTO book) {
		int res = 0;
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null)
				return res;

			String query = "UPDATE book SET cateBook_id=?, author_id=?, promotion_id=?, name=?, price=?, amount=?, description=? "
					+ "WHERE id=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setInt(1, book.getCateBook().getId());
			pmt.setString(2, book.getAuthor().getId());
			if (book.getPromotion() != null) {
				pmt.setInt(3, book.getPromotion().getId());
			}
			pmt.setString(4, book.getName());
			pmt.setDouble(5, book.getPrice());
			pmt.setInt(6, book.getAmount());
			pmt.setString(7, book.getDescription());

			pmt.setString(8, book.getId());

			int row = pmt.executeUpdate();
			res = row > 0 ? 1 : 0;

			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(con);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<BookDTO> getAllBookByPage(int page, int pageSize) {
		List<BookDTO> list = new ArrayList<BookDTO>();
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null)
				return list;
			String query = "SELECT * FROM book LIMIT ? OFFSET ?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setInt(1, pageSize);
			pmt.setInt(2, (page - 1) * pageSize);
			ResultSet rs = pmt.executeQuery();
			while (rs.next()) {
				BookDTO b = mapResultSetToBook(rs);
				list.add(b);
			}
			if (rs != null)
				rs.close();
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int getTotalRecord() {
		int res = 0;
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null)
				return res;
			String query = "SELECT COUNT(*) FROM book";
			PreparedStatement pmt = con.prepareStatement(query);
			ResultSet rs = pmt.executeQuery();
			if (rs.next())
				res = rs.getInt(1);

			if (rs != null)
				rs.close();
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<BookDTO> getSortPagination(int page, int pageSize, String field, String sort) {
		List<BookDTO> list = new ArrayList<BookDTO>();
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null)
				return list;
			String query = "";
			if ("".equals(field) && "".equals(sort))
				query = "SELECT * FROM book LIMIT ? OFFSET ?";
			else {
				String sortField;
				switch (field) {
				case "price": {
					sortField = "price";
					break;
				}
				case "amount": {
					sortField = "amount";
					break;
				}
				case "name": {
					sortField = "name";
					break;
				}
				default:
					throw new IllegalArgumentException("Unexpected value: " + field);
				}
				String sortOrder = "ASC".equalsIgnoreCase(sort) ? "ASC" : "DESC";
				query = "SELECT * FROM book ORDER BY " + sortField + " " + sortOrder + " LIMIT ? OFFSET ?";
			}

			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setInt(1, pageSize);
			pmt.setInt(2, (page - 1) * pageSize);
			ResultSet rs = pmt.executeQuery();
			while (rs.next()) {
				BookDTO bookDTO = mapResultSetToBook(rs);
				list.add(bookDTO);
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
	public List<BookDTO> sort(String field, String sort) {
		List<BookDTO> list = new ArrayList<BookDTO>();
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null)
				return list;
			String query = "";

			String sortField;
			switch (field) {
			case "price": {
				sortField = "price";
				break;
			}
			case "amount": {
				sortField = "amount";
				break;
			}
			case "name": {
				sortField = "name";
				break;
			}
			default:
				throw new IllegalArgumentException("Unexpected value: " + field);
			}
			String sortOrder = "ASC".equalsIgnoreCase(sort) ? "ASC" : "DESC";
			query = "SELECT * FROM book ORDER BY " + sortField + " " + sortOrder;

			PreparedStatement pmt = con.prepareStatement(query);

			ResultSet rs = pmt.executeQuery();
			while (rs.next()) {
				BookDTO bookDTO = mapResultSetToBook(rs);
				list.add(bookDTO);
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
	public List<BookDTO> getBooksWithFilter(FilterCriteria criteria) {
		List<BookDTO> books = new ArrayList<BookDTO>();

		// Init query builder
		QueryBuilder queryBuilder = new QueryBuilder();
		queryBuilder.buildBookQuery(criteria);

		String sql = queryBuilder.getSelectQuery();
		// Get all parameters (conditions, sorting, pagination)
		List<Object> parameters = queryBuilder.getParametersWithPagination(criteria);

		try {
			Connection con = ConnectionKit.getConnection();

			PreparedStatement pmt = con.prepareStatement(sql);

			// Add parameter for sql
			for (int i = 0; i < parameters.size(); i++) {

				pmt.setObject(i + 1, parameters.get(i));
			}

			ResultSet rs = pmt.executeQuery();
			while (rs.next()) {
				BookDTO b = mapResultSetToBook(rs);
				books.add(b);
			}

			if (rs != null)
				rs.close();
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(con);

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Error getting books with filter", e);
		}

		return books;
	}

	@Override
	public int countBooksWithFilter(FilterCriteria criteria) {
		int res = 0;
		QueryBuilder queryBuilder = new QueryBuilder();
		queryBuilder.buildBookQuery(criteria);

		String sql = queryBuilder.getCountQuery();

		// Get all parameters except pagination
		List<Object> parameters = queryBuilder.getParameters();

		try {
			Connection con = ConnectionKit.getConnection();

			PreparedStatement pmt = con.prepareStatement(sql);

			// Add parameter
			for (int i = 0; i < parameters.size(); i++) {
				pmt.setObject(i + 1, parameters.get(i));
			}

			ResultSet rs = pmt.executeQuery();
			if (rs.next())
				res = rs.getInt(1);

			if (rs != null)
				rs.close();
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(con);

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Error counting book with filter", e);
		}

		return res;
	}

	/**
	 * Helper function để map ResultSet -> BookDTO
	 */
	private BookDTO mapResultSetToBook(ResultSet rs) throws Exception {
		CateBookService cateBookService = CateBookServiceImpl.getInstance();
		AuthorService authorService = AuthorServiceImpl.getInstance();
		PromotionService promotionService = PromotionServiceImpl.getInstance();

		BookDTO book = new BookDTO();
		book.setId(rs.getString("id"));
		book.setCateBook(cateBookService.findById(rs.getInt("cateBook_id")));
		book.setAuthor(authorService.findById(rs.getString("author_id")));
		book.setPromotion(promotionService.findById(rs.getInt("promotion_id")));
		book.setName(rs.getString("name"));
		book.setPrice(rs.getDouble("price"));
		book.setAmount(rs.getInt("amount"));
		book.setDescription(rs.getString("description"));
		book.setCreateAt(rs.getDate("createDate"));

		return book;
	}
}
