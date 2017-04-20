package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import service.AdminService;
import dao.mapper.UserMapper;
import entity.Admin;
import entity.User;

public class AdminServiceImpl implements AdminService
{
	@Autowired
	private UserMapper userMapper;

	@Override
	public Admin login(String loginname, String password)
	{
		//用户登录
		Admin admin = userMapper.login(loginname, password);
		return admin;
	}
	@Override
	public int allApplyUser(int status)
	{
		// TODO Auto-generated method stub
		return userMapper.allApplyUser(status);
	}
	
	@Override
	public List<User> selectAllApplyUser(int status,int currentPage, int constancePage)
	{
		List<User> list = userMapper.selectAllApplyUser(status,currentPage, constancePage);
		return list;
	}
	
	@Override
	public void updateUserStatus(String uid, int status)
	{
		userMapper.updateUserStatus(uid, status);
		
	}

}
