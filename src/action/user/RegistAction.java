package action.user;

import java.io.ByteArrayInputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import service.UserInfoService;
import service.UserService;
import util.RandomNumUtil;
import util.UuidUtil;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import entity.User;
import exception.MyException;

public class RegistAction extends ActionSupport
{
	private String username; // 用户名
	private String password; // 密码
	private String repeatpassword; // 确认密码
	private String email; // 邮箱地址
	private String verifyCode; // 验证码
	private String activationCode; // 激活码

	private String msg; // 页面显示信息
	private String code; //页面提示对错

	// 这个是用来输出给action中的stream的
	private ByteArrayInputStream inputStream;

	@Autowired
	private UserService userService;
	@Autowired
	private UserInfoService userInfoService;

	// 用户注册
	public String regist() throws Exception
	{
		// 分装用户信息
		User user = new User();
		
		//设置userInfoId
		String userInfoId = UuidUtil.uuid();
		
		// 生成用户id
		user.setUid(UuidUtil.uuid());
		// 设置用户名
		user.setUserName(username);
		// 设置密码
		user.setPassword(password);
		// 设置邮箱
		user.setEmail(email);
		// 设置用户状态
		user.setStatus(0);
		// 设置权限
		user.setAuthority(0);
		// 设置激活码
		user.setActivationCode(UuidUtil.uuid() + UuidUtil.uuid());
		
		//设置申请状态  初始值未申请
		user.setApplyStatus(0);

		// 注册功能实现
		userService.regist(user);
		
		//插入用户信息
		userInfoService.addUserInfo(userInfoId, user.getUid());

		this.setMsg("您已注册成功，请到邮箱激活！");
		this.setCode("success");
		return Action.SUCCESS;
	}

	// 邮箱认证
	public String emailVerify() throws Exception
	{
		try
		{
			userService.emailVerify(activationCode);
			this.setCode("success");
			this.setMsg("恭喜邮箱认证成功！");
		} catch (MyException e)
		{
			this.setMsg(e.getMessage());
			this.setCode("error");
		}

		return Action.SUCCESS;
	}

	// 后台验证
	public void validateRegist()
	{
		/*
		 * 1.用户名的验证
		 */
		// 用户名为空验证
		if (null == username || "".equals(username.trim()))
		{
			this.addFieldError("username", "用户名不能为空");
		}
		// 长度验证
		else if (username.length() < 3 || username.length() > 10)
		{
			this.addFieldError("username", "用户名长度应该介于3到10之间！");
		}
		// 用户名是否注册验证

		/*
		 * 2.密码验证
		 */
		// 非空验证
		if (null == password || "".equals(password.trim()))
		{
			this.addFieldError("password", "密码不能为空！");

		}
		// 长度验证
		else if (password.length() < 8 || password.length() > 20)
		{
			this.addFieldError("password", "密码长度应该介于8到20位之间");
		}
		/*
		 * 3.确认密码验证
		 */
		if (repeatpassword == null || "".equals(repeatpassword.trim()))
		{
			this.addFieldError("repeatpassword", "确认密码不能为空！");
		} else if (!repeatpassword.equals(password))
		{
			this.addFieldError("repeatpassword", "两次密码不一致！");
		}
		/*
		 * 4.邮箱认证
		 */
		if (null == email || "".equals(email.trim()))
		{
			this.addFieldError("email", "邮箱地址不能为空！");
		} else if (!email
				.matches("^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$"))
		{ // 邮箱格式验证
			this.addFieldError("email", "邮箱格式错误！");
		}
		// 邮箱是否已注册验证

		/*
		 * 6.验证码认证
		 */
		if (null == verifyCode || "".equals(verifyCode.trim()))
		{
			this.addFieldError("verifyCode", "验证码不能为空！");
		} else if (!verifyCode.equalsIgnoreCase((String) ServletActionContext
				.getRequest().getSession().getAttribute("verifyCode")))
		{
			this.addFieldError("verifyCode", "验证码输入错误！");
		}
	}

	// 产生验证码，并将验证码存入session当中
	public String verifyString() throws Exception
	{ // 生成验证码
		RandomNumUtil rdnu = RandomNumUtil.Instance();
		this.setInputStream(rdnu.getImage()); // 取得带有随机字符串的图片
		String name = rdnu.getString();
		ActionContext.getContext().getSession().put("verifyCode", name); // 取得随机字符串放入Session中
		return SUCCESS;
	}
	
	//ajax异步验证用户名是否注册
	public String ajaxUsername() throws Exception
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter out = response.getWriter();
		//存在该用户名
		if(userService.usernameIsExist(username))
		{
			out.print(false);
		}
		//不存在该用户名
		else
		{
			out.print(true);
		}
		return null;
		
	}
	
	//ajax异步验证用户名是否注册
	public String ajaxEmail() throws Exception
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter out = response.getWriter();
		//存在该用户名
		if(userService.emailIsExist(email))
		{
			out.print(false);
		}
		//不存在该用户名
		else
		{
			out.print(true);
		}
		return null;
			
	}

	
	public String getCode()
	{
		return code;
	}

	public void setCode(String code)
	{
		this.code = code;
	}

	public String getRepeatpassword()
	{
		return repeatpassword;
	}

	public void setRepeatpassword(String repeatpassword)
	{
		this.repeatpassword = repeatpassword;
	}

	public String getMsg()
	{
		return msg;
	}

	public void setMsg(String msg)
	{
		this.msg = msg;
	}

	public String getUsername()
	{
		return username;
	}

	public String getPassword()
	{
		return password;
	}

	public String getRepassword()
	{
		return repeatpassword;
	}

	public String getEmail()
	{
		return email;
	}


	public void setUsername(String username)
	{
		this.username = username;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public void setRepassword(String repassword)
	{
		this.repeatpassword = repassword;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	
	public String getVerifyCode()
	{
		return verifyCode;
	}

	public ByteArrayInputStream getInputStream()
	{
		return inputStream;
	}

	public void setVerifyCode(String verifyCode)
	{
		this.verifyCode = verifyCode;
	}

	public void setInputStream(ByteArrayInputStream inputStream)
	{
		this.inputStream = inputStream;
	}

	public String getActivationCode()
	{
		return activationCode;
	}

	public void setActivationCode(String activationCode)
	{
		this.activationCode = activationCode;
	}

}
