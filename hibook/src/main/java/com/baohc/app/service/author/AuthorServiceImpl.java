package com.baohc.app.service.author;

import java.util.List;

import com.baohc.app.dao.author.AuthorDAO;
import com.baohc.app.dao.author.AuthorDAOImpl;
import com.baohc.app.model.AuthorDTO;

public class AuthorServiceImpl implements AuthorService {
    private AuthorDAO authorDAO;
    private static AuthorServiceImpl instance = null;

    private AuthorServiceImpl() {
        authorDAO = AuthorDAOImpl.getInstance();
    }

    public static synchronized AuthorServiceImpl getInstance() {
        if (instance == null) instance = new AuthorServiceImpl();
        return instance;
    }

    @Override
    public List<AuthorDTO> getAllAuthors() {
        return authorDAO.getAllAuthors();
    }

    @Override
    public AuthorDTO findById(String id) {
        return authorDAO.findById(id);
    }

    @Override
    public int insert(AuthorDTO author) {
        return authorDAO.insert(author);
    }

    @Override
    public int insertAll(List<AuthorDTO> arr) {
        return authorDAO.insertAll(arr);
    }

    @Override
    public int delete(AuthorDTO author) {
        return authorDAO.delete(author);
    }

    @Override
    public int deleteAll(List<AuthorDTO> arr) {
        return authorDAO.deleteAll(arr);
    }

    @Override
    public int update(AuthorDTO author) {
        return authorDAO.update(author);
    }
}
