package vn.Quan.service;

import java.util.List;

import vn.Quan.entity.UserEntity;

public interface IUserService {

    UserEntity login(String username, String password);

    void create(UserEntity user) throws Exception;

    void update(UserEntity user) throws Exception;

    void delete(String username) throws Exception;

    UserEntity findById(String username);

    List<UserEntity> findAll();

    boolean checkExistUsername(String username);

    boolean checkExistEmail(String email);

    boolean checkExistPhone(String phone);

    UserEntity findByEmail(String email);
}
