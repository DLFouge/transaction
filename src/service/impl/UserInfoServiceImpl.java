package service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import service.UserInfoService;
import dao.mapper.UserInfoMapper;
import entity.UserInfo;

public class UserInfoServiceImpl implements UserInfoService {
	@Autowired
	private UserInfoMapper userInfoMapper;
	@Override
	public UserInfo selectUserInfo(String userId) {
		UserInfo userInfo = userInfoMapper.selectUserInfo(userId);
		return userInfo;
	}

	@Override
	public boolean updataUserInfo(UserInfo userInfo) {
		int row = userInfoMapper.updateUserInfo(userInfo);
		return row==1;
	}

	@Override
	public boolean addUserInfo(String userInfoId, String userId) {
		int row = userInfoMapper.addUserInfo(userInfoId, userId);
		return row==1;
	}
}
