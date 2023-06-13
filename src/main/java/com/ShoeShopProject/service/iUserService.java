package com.ShoeShopProject.service;

import com.ShoeShopProject.model.UserModel;

public interface iUserService {
	UserModel findUserByPass(String user, String pass);
	void insertUser(UserModel user);
}
