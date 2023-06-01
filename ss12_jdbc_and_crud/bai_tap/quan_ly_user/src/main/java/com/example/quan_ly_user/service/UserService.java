package com.example.quan_ly_user.service;

import com.example.quan_ly_user.model.User;
import com.example.quan_ly_user.repository.UserRepository;

import java.util.List;

public class UserService implements IUserService {
    UserRepository userRepository = new UserRepository();

    @Override
    public List<User> getList() {
        return userRepository.showList();
    }

    @Override
    public void addNewUser(User user) {
        userRepository.addNewUser(user);
    }

    @Override
    public void editUser(User user) {
        userRepository.editUser(user);
    }

    @Override
    public User findById(int id) {
        for (int i = 0; i < userRepository.showList().size(); i++) {
            if (id == userRepository.showList().get(i).getId()) {
                return userRepository.showList().get(i);
            }
        }
        return null;
    }

    @Override
    public void deleteUser(int id) {
        userRepository.deleteUser(id);
    }

    @Override
    public List<User> findByName(String country) {
        return userRepository.findByName(country);
    }
}
