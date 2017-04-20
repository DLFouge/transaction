package service;

import java.util.List;

import entity.Admin;
import entity.User;

public interface AdminService
{
	//管理员登录
	public Admin login(String loginname,String password);
	
	/*
	 * 查询所有申请开店用户
	 * param : 
	 * 		status : 查询的用户状态
	 */
	public int allApplyUser(int status);
	
	/*
	 * 根据范围查询已申请用户
	 * param :
	 * 		currentPage : 起始地方
	 * 		constancePage : 查询条数
	 */
	public List<User> selectAllApplyUser(int status,int currentPage,
			int constancePage);
	/*
	 * 根据用户id更改用户状态
	 * param : 
	 * 	 uid  : 用户id
	 *   status : 更改的用户状态
	 */
	public void updateUserStatus(String uid,int status);

}
