package dao.mapper;

import org.apache.ibatis.annotations.Param;

import entity.UserInfo;

public interface UserInfoMapper {
	/**
	 * 根据id查询个人信息
	 * @param userId：用户Id
	 * @return
	 */
	public UserInfo selectUserInfo(@Param("userId") String userId);
	/**
	 * 修改跟人信息
	 * @param userInfo
	 * @return
	 */
	public int updateUserInfo(UserInfo userInfo);
	/**
	 * 注册成功初始化用户几本信息
	 * @param userInfo
	 * @return
	 */
	public int addUserInfo(@Param("userInfoId") String userInfoId,@Param("userId") String userId);
}
