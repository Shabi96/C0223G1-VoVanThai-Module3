package com.example.quan_ly_user.repository;

import com.example.quan_ly_user.model.User;

import java.util.List;

public interface IUserRepository {
    List<User> showList();
    void addUserTransaction(User user);
    void editUser(User user);
    void deleteUser(int id);
    List<User> findByCountry(String country);
}
