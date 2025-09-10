package com.baohc.app.dao.bill;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.baohc.app.model.BillDTO;
import com.baohc.app.model.BillDetailDTO;
import com.baohc.app.model.BookDTO;
import com.baohc.app.service.bill.BillService;
import com.baohc.app.service.bill.BillServiceImpl;
import com.baohc.app.service.book.BookService;
import com.baohc.app.service.book.BookServiceImpl;
import com.baohc.core.utils.ConnectionKit;

public class BillDetailDAOImpl implements BillDetailDAO {

	private static BillDetailDAOImpl instance = null;

	private BillDetailDAOImpl() {
	}

	public static synchronized BillDetailDAOImpl getInstance() {
		if (instance == null)
			instance = new BillDetailDAOImpl();
		return instance;
	}

	@Override
	public List<BillDetailDTO> getAll() {
		List<BillDetailDTO> details = new ArrayList<>();
		try {
			Connection conn = ConnectionKit.getConnection();
			String sql = "SELECT * FROM bill_detail";
			PreparedStatement pmt = conn.prepareStatement(sql);
			ResultSet rs = pmt.executeQuery();
			while (rs.next()) {
				BillDetailDTO detail = mapToResultSet(rs);
				if (detail != null)
					details.add(detail);
			}
			if (rs != null)
				rs.close();
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return details;
	}
	
	@Override
	public List<BillDetailDTO> getAllbyBill(String billId) {
		List<BillDetailDTO> details = new ArrayList<>();
		try {
			Connection conn = ConnectionKit.getConnection();
			String sql = "SELECT * FROM bill_detail WHERE bill_id=? ";
			PreparedStatement pmt = conn.prepareStatement(sql);
			pmt.setString(1, billId);
			ResultSet rs = pmt.executeQuery();
			while (rs.next()) {
				BillDetailDTO detail = mapToResultSet(rs);
				if (detail != null)
					details.add(detail);
			}
			if (rs != null)
				rs.close();
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return details;
	}

	@Override
	public BillDetailDTO find(String billId, String bookId) {
		BillDetailDTO res = null;
		try {
			Connection conn = ConnectionKit.getConnection();
			String sql = "SELECT * FROM bill_detail WHERE bill_id=? AND book_id=?";
			PreparedStatement pmt = conn.prepareStatement(sql);
			pmt.setString(1, billId);
			pmt.setString(2, bookId);
			ResultSet rs = pmt.executeQuery();
			if (rs.next()) {
				res = mapToResultSet(rs);
			}
			if (rs != null)
				rs.close();
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public BillDetailDTO findByBill(BillDTO bill) {
		BillDetailDTO res = null;
		try {
			Connection conn = ConnectionKit.getConnection();
			String sql = "SELECT * FROM bill_detail WHERE bill_id=?";
			PreparedStatement pmt = conn.prepareStatement(sql);
			pmt.setString(1, bill.getId());
			ResultSet rs = pmt.executeQuery();
			if (rs.next()) {
				res = mapToResultSet(rs);
			}
			if (rs != null)
				rs.close();
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public BillDetailDTO findByBook(BookDTO book) {
		BillDetailDTO res = null;
		try {
			Connection conn = ConnectionKit.getConnection();
			String sql = "SELECT * FROM bill_detail WHERE book_id=?";
			PreparedStatement pmt = conn.prepareStatement(sql);
			pmt.setString(1, book.getId());
			ResultSet rs = pmt.executeQuery();
			if (rs.next()) {
				res = mapToResultSet(rs);
			}
			if (rs != null)
				rs.close();
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int insert(BillDetailDTO billDetail) {
		int res = 0;
		try {
			Connection conn = ConnectionKit.getConnection();
			String sql = "INSERT INTO bill_detail (bill_id, book_id, quantity, price) VALUES (?, ?, ?, ?)";
			PreparedStatement pmt = conn.prepareStatement(sql);
			pmt.setString(1, billDetail.getBill().getId());
			pmt.setString(2, billDetail.getBook().getId());
			pmt.setInt(3, billDetail.getQuantity());
			pmt.setDouble(4, billDetail.getPrice());
			int row = pmt.executeUpdate();
			res = row > 0 ? 1 : 0;
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(BillDetailDTO billDetail) {
		int res = 0;
		try {
			Connection conn = ConnectionKit.getConnection();
			String sql = "DELETE FROM bill_detail WHERE bill_id=? AND book_id=?";
			PreparedStatement pmt = conn.prepareStatement(sql);
			pmt.setString(1, billDetail.getBill().getId());
			pmt.setString(2, billDetail.getBook().getId());
			int row = pmt.executeUpdate();
			res = row > 0 ? 1 : 0;
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int update(BillDetailDTO billDetail) {
		int res = 0;
		try {
			Connection conn = ConnectionKit.getConnection();
			String sql = "UPDATE bill_detail SET quantity=?, price=? WHERE bill_id=? AND book_id=?";
			PreparedStatement pmt = conn.prepareStatement(sql);
			pmt.setInt(1, billDetail.getQuantity());
			pmt.setDouble(2, billDetail.getPrice());
			pmt.setString(3, billDetail.getBill().getId());
			pmt.setString(4, billDetail.getBook().getId());
			int row = pmt.executeUpdate();
			res = row > 0 ? 1 : 0;
			if (pmt != null)
				pmt.close();
			ConnectionKit.closeConnection(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	private BillDetailDTO mapToResultSet(ResultSet rs) throws SQLException {
		BillDetailDTO detail = new BillDetailDTO();
		BillService billService = BillServiceImpl.getInstance();
		BookService bookService = BookServiceImpl.getInstance();

		try {
			
			String bill_id = rs.getString("bill_id");
			if (bill_id != null && !bill_id.isEmpty())
				detail.setBill(billService.findById(bill_id));
			else
				detail.setBill(null);
			
			String book_id = rs.getString("book_id");
			if (book_id != null && !book_id.isEmpty())
				detail.setBook(bookService.findById(book_id));
			else
				detail.setBook(null);
	
			detail.setQuantity(rs.getInt("quantity"));
			detail.setPrice(rs.getDouble("price"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return detail;
	}
}
