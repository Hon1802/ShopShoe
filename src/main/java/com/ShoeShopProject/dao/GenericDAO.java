package com.ShoeShopProject.dao;

import java.util.List;

import com.ShoeShopProject.mapper.RowMapper;

public interface GenericDAO<T> {
	<T>List<T> query(String sql, RowMapper<T> rowMapper, Object... parameters);
	void update (String sql, Object...parameters);
	Integer insert (String sql, Object...parameters);
	Integer count(String sql, Object... parameters);
	<T> List<T> callFunction(String sql, RowMapper<T> rowMapper, Object...parameters);
}
