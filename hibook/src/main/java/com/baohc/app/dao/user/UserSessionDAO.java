package com.baohc.app.dao.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.baohc.app.config.SecurityConfig;
import com.baohc.app.model.PermissionDTO;
import com.baohc.app.model.RoleDTO;
import com.baohc.app.model.UserDTO;
import com.baohc.app.model.UserSessionDTO;
import com.baohc.core.utils.ConnectionKit;

public class UserSessionDAO {
	private static final Logger LOGGER = LoggerFactory.getLogger(UserSessionDAO.class);
	private static UserSessionDAO instance = null;
	
	private UserSessionDAO() {}
	
	public static synchronized UserSessionDAO getIntance() {
		if (instance == null) instance = new UserSessionDAO();
		return instance;
	}
	
	public UserSessionDTO getUserSessionById(String dbSessionId) {
		UserSessionDTO userSession = null;
		String sql = "SELECT * "
				+ "FROM user_sessions "
				+ "WHERE id=? ";
		Connection conn = null;
		PreparedStatement pmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionKit.getConnection();
			pmt = conn.prepareStatement(sql);
			pmt.setString(1, dbSessionId);
			rs = pmt.executeQuery();
			
			if (rs.next()) {
				userSession = mapResultSetToUserSession(rs);
			}
			//ConnectionKit.commit(conn);
			return userSession;
			
		} catch (Exception e) {
			LOGGER.error("Error getting user session \n" + e.getMessage());
			//ConnectionKit.rollback(conn);
			return userSession;
		} finally {
			ConnectionKit.closeResources(conn, pmt, rs);
		}
	}
	
	public void invalidateSession(String id) {
		if (id == null) return;
		
		String sql = "UPDATE user_sessions "
				+ "SET is_active=FALSE "
				+ "WHERE id=?";
		
		Connection conn = null;
		PreparedStatement pmt = null;
		
		try {
			conn = ConnectionKit.getConnection();
			pmt = conn.prepareStatement(sql);
			pmt.setString(1, id);
			
			pmt.executeUpdate();
			
			//ConnectionKit.commit(conn);
			
		} catch (Exception e) {
			LOGGER.error("Error invalidating session in database! \n" + e.getMessage());
			//ConnectionKit.rollback(conn);
		} finally {
			ConnectionKit.closeResources(conn, pmt, null);
		}
		
	}
	
	private UserSessionDTO mapResultSetToUserSession(ResultSet rs) throws SQLException {
		
		UserSessionDTO userSession = new UserSessionDTO();
		userSession.setId(rs.getString("id"));
		userSession.setUserId(rs.getString("user_id"));
		userSession.setIpAddress(rs.getString("ip_address"));
		userSession.setUserAgent(rs.getString("user_agent"));
		userSession.setLastActivity(rs.getTimestamp("last_activity"));
		userSession.setCreatedAt(rs.getTimestamp("created_at"));
		userSession.setExpiresAt(rs.getTimestamp("expires_at"));
		userSession.setActive(rs.getBoolean("is_active"));
		
		return userSession;
	}

	public void updateSessionActivity(String id) {
		if (id == null) return;
		
		String sql = "UPDATE user_sessions "
				+ "SET last_activity = CURRENT_TIMESTAMP, "
				+ "expires_at = DATE_ADD(NOW(), INTERVAL ? MINUTE) "
				+ "WHERE id=?";
		Connection conn = null;
		PreparedStatement pmt = null;
		try {
			conn = ConnectionKit.getConnection();
			pmt = conn.prepareStatement(sql);
			pmt.setInt(1, SecurityConfig.SESSION_TIMEOUT_MINUTES);
			pmt.setString(2, id);
			
			pmt.executeUpdate();
			
			//ConnectionKit.commit(conn);
		} catch (Exception e) {
			LOGGER.error("Error updating session activity\n"+e.getMessage());
			//ConnectionKit.rollback(conn);
		} finally {
			ConnectionKit.closeResources(conn, pmt, null);
		}
		
		
	}

	public int insert(String dbSessionId, String user_id, String ipAddress, String userAgent) {
		int res = 0;
		
		String sql = "INSERT INTO user_sessions (id, user_id, ip_address, user_agent, expires_at, is_active) "
				+ "VALUES(?,?,?,?,DATE_ADD(NOW(), INTERVAL ? MINUTE),TRUE) ";
		Connection conn = null;
		PreparedStatement pmt = null;
		try {
			conn = ConnectionKit.getConnection();
			// Deactive các session cũ trước đó 
			invalidateUserSession(conn, user_id);
			
			pmt = conn.prepareStatement(sql);
			pmt.setString(1, dbSessionId);
			pmt.setString(2, user_id);
			pmt.setString(3, ipAddress);
			pmt.setString(4, userAgent);
			pmt.setInt(5, SecurityConfig.SESSION_TIMEOUT_MINUTES);
			
			int row = pmt.executeUpdate();
			res = row > 0 ? 1 : 0;
			//ConnectionKit.commit(conn);
			return res;
		} catch (Exception e) {
			LOGGER.error("Error inserting session \n"+e.getMessage());
			//ConnectionKit.rollback(conn);
			return 0;
		} finally {
			ConnectionKit.closeResources(conn, pmt, null);
		}
	}

	private static void invalidateUserSession(Connection conn, String id) throws SQLException {
		String sql = "UPDATE user_sessions "
				+ "SET is_active=FALSE "
				+ "WHERE user_id=? AND is_active=TRUE ";
		try (PreparedStatement pmt = conn.prepareStatement(sql)) {
			pmt.setString(1, id);
			int updated = pmt.executeUpdate();
			if (updated > 0) {
				System.out.println("Invalidated " + updated + " existing sessions for user ID: " + id);
			}
		}

	}

	public UserDTO getUserFromSession(String dbSessionId) {
		String sql = "SELECT u.* "
				+ "FROM user_sessions s "
				+ "JOIN user u ON s.user_id = u.id "
				+ "WHERE s.id = ? AND s.is_active = TRUE AND s.expires_at > NOW() ";
		Connection conn = null;
		PreparedStatement pmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionKit.getConnection();
			pmt = conn.prepareStatement(sql);
			pmt.setString(1, dbSessionId);
			rs = pmt.executeQuery();
			UserDTO user = new UserDTO();
			if (rs.next()) {
				user.setId(rs.getString("id"));
				user.setUsername(rs.getString("username"));
				user.setEmail(rs.getString("email"));
				user.setFullname(rs.getString("fullname"));
				user.setBirthDate(rs.getDate("birthDate"));
				user.setAvatar(rs.getString("avatar"));
				user.setAccount_locked(rs.getBoolean("account_locked"));
				user.setPassword_change_required(rs.getBoolean("password_change_required"));
				user.setLast_login(rs.getTimestamp("last_login"));
				user.setRoles(getRoleByUserId(rs.getString("id")));
			}
			//ConnectionKit.commit(conn);
			return user;
		} catch (SQLException e) {
			e.printStackTrace();
			//ConnectionKit.rollback(conn);
			return null;
		} finally {
			ConnectionKit.closeResources(conn, pmt, rs);
		}
	}
	
	private Set<RoleDTO> getRoleByUserId(String userId) {
		Set<RoleDTO> roles = new HashSet<RoleDTO>();
		String sql = "SELECT r.id, r.name ,r.description "
				+ "FROM roles r "
				+ "JOIN user_roles ur ON ur.role_id = r.id "
				+ "WHERE ur.user_id = ? ";
		Connection conn = null;
		PreparedStatement pmt = null;
		ResultSet rs = null;
		
		try {
			conn = ConnectionKit.getConnection();
			pmt = conn.prepareStatement(sql);
			pmt.setString(1, userId); 
			rs = pmt.executeQuery();
			while (rs.next()) {
				RoleDTO role = new RoleDTO();
				role.setId(rs.getInt("id"));
				role.setName(rs.getString("name"));
				role.setDescription(rs.getString("description"));
				role.setPermissions(getPermissionsByRole(conn, rs.getInt("id")));
				
				roles.add(role);
			}
			return roles;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
	}

	private Set<PermissionDTO> getPermissionsByRole(Connection conn, int id) throws SQLException {
		Set<PermissionDTO> permissions = new HashSet<PermissionDTO>(); 
		String sql = "SELECT p.id, p.`name`, p.`resource`, p.`action`, p.`description` AS perm_desc "
				+ "FROM permissions p "
				+ "JOIN role_permissions rl ON p.id = rl.permission_id "
				+ "WHERE rl.role_id = ? ";
		try (PreparedStatement pmt = conn.prepareStatement(sql)) {
			pmt.setInt(1, id);
			ResultSet rs = pmt.executeQuery();
			while (rs.next()) {
				PermissionDTO permission = new PermissionDTO();
				permission.setId(rs.getInt("id"));
				permission.setName(rs.getString("name"));
				permission.setResource(rs.getString("resource"));
				permission.setAction(rs.getString("action"));
				permission.setDescription(rs.getString("perm_desc"));
				
				permissions.add(permission);
			}
		}
		
		return permissions;
	}
}
