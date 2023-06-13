package com.ShoeShopProject.dao;

import java.sql.Timestamp;
import java.util.List;

import com.ShoeShopProject.model.UserModel;

public interface iUserDAO extends GenericDAO<UserModel>{
	UserModel findUserByPass(String user, String pass);
	Integer insertUser(UserModel user);
}
