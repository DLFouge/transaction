package action.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import service.UserService;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import entity.User;

public class LoginAction extends ActionSupport
{	
	private String username; //用户名
	private String password; //登录密码
	private String verifyCode; //验证码
	
	private String msg; //页面提示信息
	private String code; //页面显示判断
	
	@Autowired
	private UserService userService;
	
	/*
	 * 完成用户登录功能
	 */
	public String login() throws Exception
	{
		/*
		 * 用户登录流程：
		 *  1.验证用户所填信息
		 *  2.如果信息所填无误，则将用户名和用户密码访问数据库，保存用户数据到session中并返回主页
		 *  3.如果用户名和密码不存在，则提示用户名和密码错误
		 */
		User user = userService.isUserExist(username, password);
		if(null == user)
		{
			this.setMsg("用户名或密码错误！");
			return Action.ERROR;
		}
		else
		{
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.setAttribute("user", user);
			this.setCode("success");
			return Action.SUCCESS;
		}
	}
	
	/*
	 * 对用户所输入的信息验证
	 */
	public void validateLogin()
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
		 * 3.验证码认证
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
	
	/*
	 * 验证码的异步验证
	 */
	public String ajaxVerifyCode() throws Exception
	{
		//1.从session中拿出验证码
		HttpSession session = ServletActionContext.getRequest().getSession();
		String code = (String)session.getAttribute("verifyCode");
		//2.获取httpResponse对象
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter out = response.getWriter();
		//判断用户输入的验证码和生成的验证码是否一致
		if(verifyCode.equalsIgnoreCase(code))
		{
			out.print(true);
		}
		else
		{
			out.print(false);
		}
		
		return null;
	} 
	public String getUsername()
	{
		return username;
	}

	public String getPassword()
	{
		return password;
	}

	public void setUsername(String username)
	{
		this.username = username;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public String getVerifyCode()
	{
		return verifyCode;
	}

	public String getMsg()
	{
		return msg;
	}

	public void setVerifyCode(String verifyCode)
	{
		this.verifyCode = verifyCode;
	}

	public void setMsg(String msg)
	{
		this.msg = msg;
	}

	public String getCode()
	{
		return code;
	}

	public void setCode(String code)
	{
		this.code = code;
	}
	
	
	
	
	

}
