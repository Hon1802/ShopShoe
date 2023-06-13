package com.ShoeShopProject.dao.impl;

import java.util.List;

import com.ShoeShopProject.dao.iUserDAO;
import com.ShoeShopProject.mapper.UserMapper;
import com.ShoeShopProject.model.UserModel;

public class UserDAO extends AbstractDAO<UserModel> implements iUserDAO {

	@Override
	public UserModel findUserByPass(String user, String pass) {
		String sql="Select * from users where (email=? and password=?) or (phone=? and password=?)";
		List<UserModel> list= query(sql, new UserMapper(), user, pass, user, pass);
		return list.isEmpty()? null : list.get(0);
	}

	@Override
	public Integer insertUser(UserModel user) {
		String sql="Insert into Users(phone, Full_name, email, password, address, created, role) values(?, ?, ?, ?, ?,?,?)";
		return insert(sql,user.getPhone(),  user.getFullName(),  user.getEmail(),  user.getPassword(), 
			user.getAddress(), user.getCreated(),  user.getRole());
	}

}
