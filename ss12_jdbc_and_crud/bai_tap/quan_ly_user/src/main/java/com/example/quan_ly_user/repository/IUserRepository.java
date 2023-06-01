package com.example.quan_ly_user.repository;

import com.example.quan_ly_user.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    List<User> showList();
    void addNewUser(User user);
    void editUser(User user);
    void deleteUser(int id);
    List<User> findByName(String country);
}
