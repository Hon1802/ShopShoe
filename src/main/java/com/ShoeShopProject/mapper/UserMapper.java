package com.ShoeShopProject.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.ShoeShopProject.model.UserModel;

public class UserMapper implements RowMapper<UserModel> {

	@Override
	public UserModel mapRow(ResultSet rs) {
		try {
		    UserModel user = new UserModel();
			user.setUserId(rs.getInt("id"));
			user.setRole(rs.getInt("role"));
			user.setEmail(rs.getString("email"));
			user.setPhone(rs.getString("phone"));
			user.setAddress(rs.getString("address"));
			user.setFullName(rs.getString("Full_name"));
			return user;
			}
			catch (SQLException e)
			{
				return null;
			}
	}
	
}
