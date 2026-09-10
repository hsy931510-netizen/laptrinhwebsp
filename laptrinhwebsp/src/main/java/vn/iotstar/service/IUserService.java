package vn.iotstar.service;

import java.util.List;

import vn.iotstar.entity.User;

public interface IUserService {

    List<User> findAll();

    User findById(Long id);

    User save(User user);

    void deleteById(Long id);

    List<User> search(String keyword);
}
