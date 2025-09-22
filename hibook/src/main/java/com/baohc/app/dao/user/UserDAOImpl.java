package com.baohc.app.dao.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.baohc.app.config.SecurityConfig;
import com.baohc.app.model.PermissionDTO;
import com.baohc.app.model.RoleDTO;
import com.baohc.app.model.UserDTO;
import com.baohc.core.utils.ConnectionKit;
import com.baohc.core.utils.PasswordUtil;

public class UserDAOImpl implements UserDAO {
	private final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);

	private static UserDAOImpl instance = null;

	private UserDAOImpl() {
	}

	public static synchronized UserDAOImpl getInstance() {
		if (instance == null)
			instance = new UserDAOImpl();
		return instance;
	}

	@Override
	public List<UserDTO> getData() {
		List<UserDTO> list = new ArrayList<UserDTO>();

		try {
			Connection con = ConnectionKit.getConnection();

			if (con == null)
				return list;

			String query = "SELECT * FROM user";

			PreparedStatement pmt = con.prepareStatement(query);
			ResultSet rs = pmt.executeQuery();

			while (rs.next()) {
				UserDTO user = new UserDTO();
				user.setId(rs.getString("id"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setFullname(rs.getString("fullname"));
				user.setBirthDate(rs.getDate("birthDate"));
				user.setAvatar(rs.getString("avatar"));
				list.add(user);
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
	public UserDTO find(UserDTO user) {
		UserDTO res = null;
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null)
				return res;

			String query = "SELECT * FROM user WHERE id=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, user.getId());
			ResultSet rs = pmt.executeQuery();

			while (rs.next()) {
				UserDTO userTmp = new UserDTO();
				userTmp.setId(rs.getString("id"));
				userTmp.setEmail(rs.getString("email"));
				userTmp.setPassword(rs.getString("password"));
				userTmp.setFullname(rs.getString("fullname"));
				userTmp.setBirthDate(rs.getDate("birthDate"));
				userTmp.setAvatar(rs.getString("avatar"));
				res = userTmp;
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
	public int insert(UserDTO user) {
		int res = 0;

		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null)
				return res;

			String query = "INSERT INTO user(id, cateUser_id, email, password, fullname, birthDate) VALUES(?,?,?,?,?)";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, user.getId());

			pmt.setString(2, user.getEmail());
			pmt.setString(3, user.getPassword());
			pmt.setString(4, user.getFullname());
			pmt.setDate(5, user.getBirthDate());

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
	public int insertAll(List<UserDTO> arr) {
		int dem = 0;
		for (UserDTO item : arr) {
			dem += this.insert(item);
		}
		return dem;
	}

	@Override
	public int delete(UserDTO user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll(List<UserDTO> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(UserDTO user) {
		int res = 0;

		try {
			Connection con = ConnectionKit.getConnection();

			if (con == null)
				return res;
			String query = "UPDATE user SET email=?, fullname=?, birthDate=?, avatar=? WHERE id=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, user.getEmail());
			pmt.setString(2, user.getFullname());
			pmt.setDate(3, user.getBirthDate());
			pmt.setString(4, user.getAvatar());
			pmt.setString(5, user.getId());

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
	public UserDTO login(UserDTO user) {
		UserDTO res = null;
		try {
			Connection con = ConnectionKit.getConnection();
			if (con == null)
				return res;

			String query = "SELECT * FROM user WHERE email=? and password=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, user.getEmail());
			pmt.setString(2, user.getPassword());
			ResultSet rs = pmt.executeQuery();

			while (rs.next()) {
				UserDTO userTmp = new UserDTO();
				userTmp.setId(rs.getString("id"));
				//CateUserDTO tmp = cateUserService.find(new CateUserDTO(rs.getInt("cateUser_id"), ""));

				userTmp.setEmail(rs.getString("email"));
				userTmp.setPassword(rs.getString("password"));
				userTmp.setFullname(rs.getString("fullname"));
				userTmp.setBirthDate(rs.getDate("birthDate"));
				userTmp.setAvatar(rs.getString("avatar"));
				res = userTmp;
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
	public int updateAvatar(UserDTO user) {
		int res = 0;

		try {
			Connection con = ConnectionKit.getConnection();

			if (con == null)
				return res;

			String query = "UPDATE user SET avatar=? WHERE id=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, user.getAvatar());
			pmt.setString(2, user.getId());

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
	public int updatePassword(String user_id, String newPassword) {
		int res = 0;
		try {
			Connection con = ConnectionKit.getConnection();
			String query = "UPDATE user SET password=? WHERE id=?";
			PreparedStatement pmt = con.prepareStatement(query);
			pmt.setString(1, newPassword);
			pmt.setString(2, user_id);
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
	public UserDTO findByUsername(String username) {
		String sql = "SELECT u.*, r.id as role_id,  r.`name` AS role_name, r.`description` AS role_desc, "
				+ "p.id as perm_id, p.`name` AS perm_name, p.`resource`, p.`action`, p.`description` AS perm_desc "
				+ "FROM user u " + "LEFT JOIN user_roles ur ON u.id = ur.user_id "
				+ "LEFT JOIN roles r ON ur.role_id = r.id " + "LEFT JOIN role_permissions rp ON r.id = rp.role_id "
				+ "LEFT JOIN permissions p ON rp.permission_id = p.id " + "WHERE u.username = ? ";
		Connection conn = null;
		PreparedStatement pmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionKit.getConnection();
			pmt = conn.prepareStatement(sql);
			pmt.setString(1, username);
			rs = pmt.executeQuery();

			UserDTO user = null;

			Set<String> processedRoles = new HashSet<String>();

			while (rs.next()) {
				// Chỉ tạo 1 lần user
				if (user == null) {
					user = mapResultSetToUser(rs);
				}

				// Map role và permission
				String roleName = rs.getString("role_name");
				if (roleName != null && !processedRoles.contains(roleName)) {
					RoleDTO role = new RoleDTO();
					role.setId(rs.getInt("role_id"));
					role.setName(roleName);
					role.setDescription(rs.getString("role_desc"));

					user.addRole(role);

					// Thêm vào processedRole để kiểm tra đợi sau tránh trùng
					processedRoles.add(roleName);
				}

				// Map permission
				String permissionName = rs.getString("perm_name");
				if (permissionName != null && user.getRoles() != null) {
					for (RoleDTO role : user.getRoles()) {
						if (roleName.equals(role.getName())) {
							PermissionDTO permission = new PermissionDTO();
							permission.setId(rs.getInt("perm_id"));
							permission.setName(permissionName);
							permission.setResource(rs.getString("resource"));
							permission.setAction(rs.getString("action"));
							permission.setDescription(rs.getString("perm_desc"));

							role.addPermission(permission);
							break;
						}
					}
				}

			}
			//ConnectionKit.commit(conn);
			return user;
		} catch (Exception e) {
			//ConnectionKit.rollback(conn);
			e.printStackTrace();
			return null;
		} finally {
			ConnectionKit.closeResources(conn, pmt, rs);
		}

	}

	@Override
	public UserDTO findByEmail(String email) {
		UserDTO user = null;
		String sql = "SELECT * FROM user WHERE email=?";
		Connection conn = null;
		PreparedStatement pmt = null;
		ResultSet rs = null;
		
		try {
			conn = ConnectionKit.getConnection();
			pmt = conn.prepareStatement(sql);
			pmt.setString(1, email);
			rs = pmt.executeQuery();
			if (rs.next()) {
				 user = mapResultSetToUser(rs);
				if (user == null) 
					return null;
			}
			
			//ConnectionKit.commit(conn);
			return user;
		} catch (Exception e) {
			//ConnectionKit.rollback(conn);
			logger.error("Lỗi SQL tìm user bằng email", e.getMessage());
			return null;
		} finally {
			ConnectionKit.closeResources(conn, pmt, rs);
		}
	}
	
	/**
	 * Thêm tài khoản mới
	 * Lưu mật khẩu hash vào db
	 */
	@Override
	public int insertAccount(UserDTO user, String password) {
		if (!isValidUser(user) || !password.matches(SecurityConfig.STRONG_PASSWORD_PATTERN)) {
			return 0;
		}
		int res = 0;
		String sql = "INSERT INTO user (id, username, email, password, fullname, birthDate) "
				+ "VALUES (?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pmt = null;
		try {
			String hashPassword = PasswordUtil.hashPasswordArgon(password);
			
			conn = ConnectionKit.getConnection();
			pmt = conn.prepareStatement(sql);
			pmt.setString(1, user.getId());
			pmt.setString(2, user.getUsername());
			pmt.setString(3, user.getEmail());
			pmt.setString(4, hashPassword);
			pmt.setString(5, user.getFullname());
			pmt.setDate(6, user.getBirthDate());
			
			int row = pmt.executeUpdate();
			if (row > 0) {
				// Gắn role USER mặc định
				assignDefaultRole(conn, user.getId());
				res = 1;
				//ConnectionKit.commit(conn);
			}
			return res;
		} catch (Exception e) {
			logger.error("Error creating account for user: " + user.getId());
			//ConnectionKit.rollback(conn);
			return res;
		} finally {
			ConnectionKit.closeResources(conn, pmt, null);
		}

	}
	private boolean isValidUser(UserDTO user) {
		return user != null 
			&& user.getUsername() != null && user.getUsername().matches(SecurityConfig.USERNAME_PATTERN)
			&& user.getEmail() != null && user.getEmail().matches(SecurityConfig.EMAIL_PATTERN)
			&& user.getFullname() != null
			&& user.getBirthDate() != null;
	}

	/**
	 * Đăng ký tài khoản với role user 
	 * @param conn
	 * @param id
	 * @throws SQLException
	 */
	private void assignDefaultRole(Connection conn, String id) throws SQLException {
		String sql = "INSERT INTO user_roles (user_id, role_id) "
				+ "SELECT ?, r.id "
				+ "FROM roles r "
				+ "WHERE r.name = 'USER' ";
		try(PreparedStatement pmt = conn.prepareStatement(sql)) {
			pmt.setString(1, id);
			pmt.executeUpdate();
		}
		
	}
	
	/**
	 * Cập nhật đăng nhập sai quá lần quy đinh
	 */
	@Override
	public int updateFailedLoginAttempt(String username) {
		int res = 0;
		String sql = "UPDATE user SET failed_login_attemps = failed_login_attemps + 1, "
				+ "last_failed_login = CURRENT_TIMESTAMP, "
				+ "account_locked = CASE WHEN failed_login_attemps + 1 >= ? THEN TRUE ELSE FALSE END "
				+ "WHERE username=? ";
		
		Connection conn= null;
		PreparedStatement pmt = null;
		try {
			conn = ConnectionKit.getConnection();
			pmt = conn.prepareStatement(sql);
			pmt.setInt(1, SecurityConfig.MAX_LOGIN_ATTEMPTS);
			pmt.setString(2, username);
			
			int row = pmt.executeUpdate();
			//ConnectionKit.commit(conn);
			return res = row > 0 ? 1 : 0;
		} catch (Exception e) {
			//ConnectionKit.rollback(conn);
			logger.error("Error updating failed login attempts ", e.getMessage());
			return res;
		} finally {
			ConnectionKit.closeResources(conn, pmt, null);
		}

	}

	/**
	 * Reset lại khi đăng nhập đúng
	 */
	@Override
	public void resetFailedLoginAttempt(String username) {
		String sql = "UPDATE user SET failed_login_attemps = 0, "
				+ "last_failed_login = NULL, "
				+ "account_locked = FALSE, "
				+ "last_login = CURRENT_TIMESTAMP "
				+ "WHERE username = ?";
		Connection conn = null;
		PreparedStatement pmt = null;
		
		try {
			conn = ConnectionKit.getConnection();
			pmt = conn.prepareStatement(sql);
			pmt.setString(1, username);
			
			pmt.executeUpdate();
			//ConnectionKit.commit(conn);
			
		} catch (Exception e) {
			logger.error("Error reseting failed login attempt for user " + username + "\n" + e.getMessage());
			//ConnectionKit.rollback(conn);
		} finally {
			ConnectionKit.closeResources(conn, pmt, null);
		}

	}

	/**
	 * Kiểm tra tài khoản có bị khóa không
	 */
	@Override
	public boolean isAccountLocked(String username) {
		String sql = "SELECT account_locked, last_failed_login "
				+ "FROM user "
				+ "WHERE username=?";
		Connection conn = null;
		PreparedStatement pmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionKit.getConnection();
			pmt = conn.prepareStatement(sql);
			pmt.setString(1, username);
			
			rs = pmt.executeQuery();
			
			if (rs.next()) {
				boolean locked = rs.getBoolean("account_locked");
				if (locked) {
					Timestamp lastFailed = rs.getTimestamp("last_failed_login");
					if (lastFailed != null) {
						long lockoutTime = SecurityConfig.ACCOUNT_LOCKED_DURATION_MINUTES * 60 * 1000; // millis
						long timeSinceLock = System.currentTimeMillis() - lastFailed.getTime();
						logger.debug("LOCKED TIME: " + lockoutTime + " " + timeSinceLock);
						// Tự độn mở khóa nếu hết thời gian
						if (timeSinceLock > lockoutTime) {
							unlockAccount(username);
							return false;
						}
					}
					return true;
				}
			}
			//ConnectionKit.commit(conn);
			return false;
		} catch (Exception e) {
			logger.error("Error checking locked account for user: " + username, e.getMessage());
			//ConnectionKit.rollback(conn);
			return false;
		} finally {
			ConnectionKit.closeResources(conn, pmt, rs);
		}
		
	}
	
	@Override
	public void unlockAccount(String username) {
		String sql = "UPDATE user SET account_locked = FALSE, "
				+ "failed_login_attemps = 0, "
				+ "last_failed_login = NULL "
				+ "WHERE username = ? ";
		Connection conn = null;
		PreparedStatement pmt = null;
		try {
			conn = ConnectionKit.getConnection();
			pmt = conn.prepareStatement(sql);
			pmt.setString(1, username);
			
			pmt.executeUpdate();
			
			//ConnectionKit.commit(conn);
			logger.info("UNLOCKED account user " + username);
		} catch (Exception e) {
			logger.error("Error unlocking account for user: " + username, e.getMessage());
			//ConnectionKit.rollback(conn);
		} finally {
			ConnectionKit.closeResources(conn, pmt, null);
		}
		
	}

	@Override
	public void updateLastLogin(String id) {
		String sql = "UPDATE users SET last_login = CURRENT_TIMESTAMP "
				+ "WHERE id = ? ";

		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			conn = ConnectionKit.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);

			stmt.executeUpdate();
			//ConnectionKit.commit(conn);

		} catch (SQLException e) {
			//ConnectionKit.rollback(conn);
			throw new RuntimeException("Error upated last login account", e);
		} finally {
			ConnectionKit.closeResources(conn, stmt, null);
		}

	}
	@Override
	public int createAccount(UserDTO newUser, String password) {
		// TODO Auto-generated method stub
		return 0;
	}
	private UserDTO mapResultSetToUser(ResultSet rs) throws SQLException {
		UserDTO user = new UserDTO();
		user.setId(rs.getString("id"));
		user.setUsername(rs.getString("username"));
		user.setEmail(rs.getString("email"));
		user.setPassword(rs.getString("password"));
		user.setFullname(rs.getString("fullname"));
		user.setBirthDate(rs.getDate("birthDate"));
		user.setAvatar(rs.getString("avatar"));
		user.setAccount_locked(rs.getBoolean("account_locked"));
		user.setFailed_login_attemps(rs.getInt("failed_login_attemps"));
		user.setLast_failed_login(rs.getTimestamp("last_failed_login"));
		user.setPassword_change_required(rs.getBoolean("password_change_required"));
		user.setCreated_at(rs.getTimestamp("created_at"));
		user.setUpdated_at(rs.getTimestamp("updated_at"));
		user.setLast_login(rs.getTimestamp("last_login"));
		return user;
	}

}
