package com.baohc.app.dao.author;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.baohc.app.model.AuthorDTO;
import com.baohc.core.utils.ConnectionKit;

public class AuthorDAOImpl implements AuthorDAO {
    
    private static AuthorDAOImpl instance = null;
    
    private AuthorDAOImpl() {}
    
    public static synchronized AuthorDAOImpl getInstance() {
        if (instance == null) instance = new AuthorDAOImpl();
        return instance;
    }

    @Override
    public List<AuthorDTO> getAllAuthors() {
        List<AuthorDTO> list = new ArrayList<>();
        try {
            Connection con = ConnectionKit.getConnection();
            if (con == null) return list;

            String query = "SELECT * FROM author";
            PreparedStatement pmt = con.prepareStatement(query);
            ResultSet rs = pmt.executeQuery();

            while (rs.next()) {
                AuthorDTO author = new AuthorDTO();
                author.setId(rs.getString("id"));
                author.setFullname(rs.getString("fullname"));
                author.setEmail(rs.getString("email"));
                author.setDob(rs.getDate("birthDate"));
                author.setBiography(rs.getString("biography"));
                list.add(author);
            }

            if (rs != null) rs.close();
            if (pmt != null) pmt.close();
            ConnectionKit.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public AuthorDTO findById(String id) {
        AuthorDTO res = null;
        try {
            Connection con = ConnectionKit.getConnection();
            if (con == null) return res;

            String query = "SELECT * FROM author WHERE id=?";
            PreparedStatement pmt = con.prepareStatement(query);
            pmt.setString(1, id);
            ResultSet rs = pmt.executeQuery();

            while (rs.next()) {
                AuthorDTO author = new AuthorDTO();
                author.setId(rs.getString("id"));
                author.setFullname(rs.getString("fullname"));
                author.setEmail(rs.getString("email"));
                author.setDob(rs.getDate("birthDate"));
                author.setBiography(rs.getString("biography"));
                res = author;
            }

            if (rs != null) rs.close();
            if (pmt != null) pmt.close();
            ConnectionKit.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    @Override
    public int insert(AuthorDTO author) {
        int res = 0;
        try {
            Connection con = ConnectionKit.getConnection();
            if (con == null) return res;

            String query = "INSERT INTO author (id, fullname, email, birthDate, biography) VALUES (?,?,?,?,?)";
            PreparedStatement pmt = con.prepareStatement(query);
            pmt.setString(1, author.getId());
            pmt.setString(2, author.getFullname());
            pmt.setString(3, author.getEmail());
            pmt.setDate(4, author.getDob());
            pmt.setString(5, author.getBiography());

            int row = pmt.executeUpdate();
            res = row > 0 ? 1 : 0;

            if (pmt != null) pmt.close();
            ConnectionKit.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    @Override
    public int insertAll(List<AuthorDTO> arr) {
        int count = 0;
        for (AuthorDTO a : arr) {
            count += insert(a);
        }
        return count;
    }

    @Override
    public int delete(AuthorDTO author) {
        int res = 0;
        try {
            Connection con = ConnectionKit.getConnection();
            if (con == null) return res;

            String query = "DELETE FROM author WHERE id=?";
            PreparedStatement pmt = con.prepareStatement(query);
            pmt.setString(1, author.getId());

            int row = pmt.executeUpdate();
            res = row > 0 ? 1 : 0;

            if (pmt != null) pmt.close();
            ConnectionKit.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    @Override
    public int deleteAll(List<AuthorDTO> arr) {
        int count = 0;
        for (AuthorDTO a : arr) {
            count += delete(a);
        }
        return count;
    }

    @Override
    public int update(AuthorDTO author) {
        int res = 0;
        try {
            Connection con = ConnectionKit.getConnection();
            if (con == null) return res;

            String query = "UPDATE author SET fullname=?, email=?, birthDate=?, biography=? WHERE id=?";
            PreparedStatement pmt = con.prepareStatement(query);
            pmt.setString(1, author.getFullname());
            pmt.setString(2, author.getEmail());
            pmt.setDate(3, author.getDob());
            pmt.setString(4, author.getBiography());
            pmt.setString(5, author.getId());

            int row = pmt.executeUpdate();
            res = row > 0 ? 1 : 0;

            if (pmt != null) pmt.close();
            ConnectionKit.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
}
