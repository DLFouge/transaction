package service;

import entity.UserInfo;
public interface UserInfoService {
	/**
	 * 根据用户id查询出用户的个人信息
	 * @param userId：用户id
	 * @return
	 */
	public UserInfo selectUserInfo(String userId);
	/**
	 * 修改用户信息
	 * @param userInfo：用户信息对象
	 * @return
	 */
	public boolean updataUserInfo(UserInfo userInfo);	
	/**
	 * 初始化用户信息
	 * @param userInfoId：用户信息主键
	 * @param userId：外键。。。账户表主键
	 * @return
	 */
	public boolean addUserInfo(String userInfoId,String userId);
}
