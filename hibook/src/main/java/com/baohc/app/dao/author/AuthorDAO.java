package com.baohc.app.dao.author;

import java.util.List;
import com.baohc.app.model.AuthorDTO;

public interface AuthorDAO {
    public List<AuthorDTO> getAllAuthors();
    public AuthorDTO findById(String id);
    public int insert(AuthorDTO author);
    public int insertAll(List<AuthorDTO> arr);
    public int delete(AuthorDTO author);
    public int deleteAll(List<AuthorDTO> arr);
    public int update(AuthorDTO author);
}
