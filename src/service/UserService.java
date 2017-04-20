package service;

import entity.User;
import exception.MyException;

public interface UserService
{
	/*
	 * 用户注册
	 * param : 
	 * 		user : 用户信息
	 */
	public void regist(User user);
	
	/*
	 * 根据激活码验证用户邮箱
	 * param : 
	 * 		activationCode :	激活码
	 * exception : 
	 * 			1.如果不存在该激活码则抛出异常
	 * 			2.如果该激活码存在但改用户已激活，抛出异常 
	 */
	public void emailVerify(String activationCode)throws MyException;
	
	/*
	 * 判断用户是否存在
	 * param : 
	 *        username : 用户名
	 *        password : 密码
	 * return :
	 *        如果存在该用户则返回该用户
	 *        如果不存在则返回null
	 * 
	 */
	public User isUserExist(String username,String password);
	
	/*
	 * 根据用户id更改用户密码
	 * param :
	 *     	 uid : 用户id
	 *     	 newPassword : 用户新密码
	 */
	public void updatePassword(String uid,String newPassword);
	
	/*
	 * 查询该邮箱地址是否存在，如果存在则向该邮箱发送邮件
	 * param :
	 * 		email : 邮箱地址
	 * return :
	 * 		如果发送成功则返回true
	 * 		如果邮箱地址不存在则返回false
	 * 
	 */
	public boolean sendEmail(String email);
	
	/*
	 * 查询用户名是否存在
	 * param : 
	 * 		username : 用户名
	 * return : 
	 * 		true : 该用户名存在
	 * 		false : 该用户名不存在
	 */
	public boolean usernameIsExist(String username);
	
	/*
	 * 查询用户邮箱是否存在
	 * param :
	 * 		email : 用户邮箱地址
	 * return :
	 * 		true : 该邮箱地址已注册
	 * 		false : 该邮箱地址可以注册
	 */
	public boolean emailIsExist(String email);

	/*
	 * 更新用户状态
	 * param :
	 * 		uid ：用户id
	 * 
	 */
	public void updateUserRight(String uid);
	

}
