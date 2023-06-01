package com.example.quan_ly_user.service;

import com.example.quan_ly_user.model.User;

import java.util.List;

public interface IUserService {
    List<User> getList();
    void addNewUser(User user);
    void editUser(User user);
    User findById(int id);
    void deleteUser(int id);
    List<User> findByName(String country);
}
