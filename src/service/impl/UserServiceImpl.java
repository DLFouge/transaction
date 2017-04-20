package service.impl;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;

import service.UserService;
import util.EmailUtil;
import dao.mapper.UserMapper;
import entity.User;
import entity.UserInfo;
import exception.MyException;

public class UserServiceImpl implements UserService
{
	@Autowired
	private UserMapper userMapper;
	//用户注册
	@Override
	public void regist(User user)
	{
		/*
		 * 1.保存用户信息
		 */
		userMapper.addUser(user);
		/*
		 * 2.给用户发送邮件
		 */
		Properties pro = new Properties();
		try
		{
			pro.load(this.getClass().getClassLoader().getResourceAsStream("MailMessage.properties"));
			String from = pro.getProperty("from");
			//给用户发邮件
			String to = user.getEmail();
			String subject = pro.getProperty("subject");
			String pass = pro.getProperty("password");
			//将user中的激活赋值给占位符
			//MessageFormat.format("你好{0}，你{1}！","张三","去死吧")，最后输出为"你好张三，你去死吧"
			String message = MessageFormat.format(pro.getProperty("message"), user.getActivationCode());
			EmailUtil sendEmail = new EmailUtil();
			sendEmail.sendEmail(from,pass, to,subject,message);
		} catch (IOException e)
		{
			e.printStackTrace();
		}

	}

	//邮箱认证
	public void emailVerify(String activationCode)throws MyException
	{
		User user = userMapper.selectUserByActivationCode(activationCode);
		if(null == user)
		{
			throw new MyException("该用户不存在，请注册！");
		}
		else if(user.getStatus()== 1)
		{
			throw new MyException("您已激活，请直接登陆！");
		}
		else
		{
			userMapper.activateUserStatus(user.getUid());
		}
		
	}
	
	//判断用户是否存在
	@Override
	public User isUserExist(String username, String password)
	{
		User user = userMapper.selectUserByUnAndPwd(username, password);
		
		return user;
	}
	
	//修改用户密码
	@Override
	public void updatePassword(String uid, String newPassword)
	{
		userMapper.updatePassword(uid, newPassword);
	}
	
	@Override
	public boolean sendEmail(String email)
	{
		String uid = userMapper.emailIsExist(email);
		//如果用户存在
		if(null != uid)
		{
			//存在则向用户邮箱发送邮件
			Properties pro = new Properties();
			try
			{
				pro.load(this.getClass().getClassLoader().getResourceAsStream("FindPasswordMail.properties"));
				String from = pro.getProperty("from");
				//给用户发邮件
				String to = email;
				String subject = pro.getProperty("subject");
				String pass = pro.getProperty("password");
				//将user中的激活赋值给占位符
				//MessageFormat.format("你好{0}，你{1}！","张三","去死吧")，最后输出为"你好张三，你去死吧"
				String message = MessageFormat.format(pro.getProperty("message"), uid);
				EmailUtil sendEmail = new EmailUtil();
				sendEmail.sendEmail(from,pass, to,subject,message);
			} catch (IOException e)
			{
				e.printStackTrace();
			}
			return true;
		}
		//如果用户不存在
		else
		{
			return false;
		}
		
	}
	
	@Override
	public boolean usernameIsExist(String username)
	{
		int flag = userMapper.usernameIsExist(username);
		if(flag == 1)
		{
			return true;
		}
		else
		{
			return false;
		}
		
	}
	
	@Override
	public boolean emailIsExist(String email)
	{
		String flag = userMapper.emailIsExist(email);
		if(flag != null)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	//更新用户状态
	@Override
	public void updateUserRight(String uid)
	{
		userMapper.updateUserRight(uid);		
	}
}
