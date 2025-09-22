package com.baohc.core.utils;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.baohc.app.config.DatabaseConfig;

public class ConnectionKit {

	static {
		try {
			Class.forName(DatabaseConfig.DB_DRIVER);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() {
		try {
			Connection conn = DriverManager.getConnection(DatabaseConfig.DB_URL, DatabaseConfig.DB_USERNAME,
					DatabaseConfig.DB_PASSWORD);
			//conn.setAutoCommit(false);
			return conn;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

	}

	public static void closeConnection(Connection con) {
		try {
			if (con != null)
				con.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public static void closeResources(Connection conn, PreparedStatement pmt, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				throw new RuntimeException("Error closing ResultSet: " + e.getMessage());
			}
		}

		if (pmt != null) {
			try {
				pmt.close();
			} catch (SQLException e) {
				throw new RuntimeException("Error closing PreparedStatement: " + e.getMessage());
			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				throw new RuntimeException("Error closing Connection: " + e.getMessage());
			}
		}
	}

	public static void rollback(Connection conn) {
		if (conn != null) {
			try {
				conn.rollback();
			} catch (SQLException e) {
				throw new RuntimeException("Error handing roll back transaction: " + e.getMessage());
			}
		}
	}

	public static void commit(Connection conn) {
		if (conn != null) {
			try {
				conn.commit();
			} catch (SQLException e) {
				throw new RuntimeException("Error handing commit transaction: " + e.getMessage());
			}
		}
	}

	public static void printInfo(Connection con) {
		try {
			if (con != null) {
				DatabaseMetaData data = con.getMetaData();
				System.out.println(data.getDatabaseProductName());
				System.out.println(data.getDatabaseProductVersion());
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
