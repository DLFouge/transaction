package dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Admin;
import entity.User;
import entity.UserInfo;
import exception.MyException;

public interface UserMapper
{
	/*
	 * 添加用户 param : 用户信息
	 */
	public void addUser(User user);

	/*
	 * 根据激活查询出用户
	 * 		param : 
	 *       	activationCode: 激活码
	 *      return : 持有该激活码的用户
	 */
	public User selectUserByActivationCode(
			@Param("activationCode") String activationCode);

	/*
	 * 根据用户id激活用户 
	 * 		param : 
	 * 			 uid :用户id
	 */
	public void activateUserStatus(@Param("uid") String uid);

	/*
	 * 根据用户名和密码查询用户
	 * 		param :
	 * 			username : 用户名
	 * 			password : 用户密码
	 * 		return :
	 * 			如果存在改用则返回该用户
	 * 			不存在则返回null 
	 */
	public User selectUserByUnAndPwd(@Param("username") String username,
			@Param("password") String password);
	
	/*
	 * 根据用户id更改用户密码
	 * param :
	 *     	 uid : 用户id
	 *     	 newPassword : 用户新密码
	 */
	public void updatePassword(@Param("uid")String uid,@Param("newPassword")String newPassword);

	/*
	 * 判断用户邮箱是否存在
	 * param :
	 * 		 email : 用户邮箱
	 * return : 
	 * 		  返回该邮箱的用户id
	 */
	public String emailIsExist(@Param("email") String email);
	
	/*
	 * 判断用户名是否存在
	 * param : 
	 * 		username : 用户名
	 * return :
	 * 		用户名存在则返回1，不存在则存在0;
	 */
	public int usernameIsExist(@Param("username")String username);
	
	/*
	 *  管理员登陆
	 *  param ： 
	 *   loginname: 登录名
	 *   password : 登录密码
	 */
	public Admin login(@Param("loginname") String loginname,
				@Param("password") String password);
	
	/*
	 * 根据用户id查询用户信息
	 * param : 
	 *    uid :用户id
	 * return :
	 *   	用户信息类
	 */
	public UserInfo selectUserInfo(@Param("uid") String uid);
	
	/*
	 * 根据用户id更改用户权限
	 * param : 
	 *    uid　：　用户id
	 */
	public void updateUserRight(@Param("uid")String uid);
	
	/*
	 * 查询所有申请开店用户
	 */
	public int allApplyUser(@Param("status")int status);
	
	/*
	 * 根据范围查询已申请用户
	 * param :
	 * 		currentPage : 起始地方
	 * 		constancePage : 查询条数
	 */
	public List<User> selectAllApplyUser(@Param("status") int status,@Param("currentPage")int currentPage,
			@Param("constancePage")int constancePage);
	
	/*
	 * 根据用户id更改用户状态
	 * param : 
	 * 	 uid  : 用户id
	 *   status : 更改的用户状态
	 */
	public void updateUserStatus(@Param("uid")String uid,@Param("status")int status);
	
}
