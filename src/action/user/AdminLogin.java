package action.user;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import service.AdminService;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import entity.Admin;

public class AdminLogin extends ActionSupport
{
	private String loginname;//用户登录名
	private String password;//用户登录密码
	private String errorMsg;//保存错误信息
	
	@Autowired
	private AdminService adminService; //管理员服务
	
	//管理员登陆
	public String login() throws Exception
	{
		/*
		 * 1、管理用户不存在
		 */
		Admin admin = adminService.login(this.loginname, this.password);
		if(admin == null)
		{
			this.setErrorMsg("用户名或密码错误！");
			return Action.ERROR;
		}
		/*
		 * 2、管理员用户存在
		 */
		else 
		{
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.setAttribute("admin", admin);
			return Action.SUCCESS;
		}
	}
	
	//管理员注销账户
	public String exit() throws Exception
	{
		//使session无效
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.invalidate();
		return Action.SUCCESS;
	}
	//setter and getter 
	
	public String getLoginname()
	{
		return loginname;
	}
	public String getErrorMsg()
	{
		return errorMsg;
	}

	public AdminService getAdminService()
	{
		return adminService;
	}

	public void setErrorMsg(String errorMsg)
	{
		this.errorMsg = errorMsg;
	}

	public void setAdminService(AdminService adminService)
	{
		this.adminService = adminService;
	}

	public String getPassword()
	{
		return password;
	}
	public void setLoginname(String loginname)
	{
		this.loginname = loginname;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}


}
