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

public class ModifyPassword extends ActionSupport
{
	private String oldPassword; // 用户旧密码
	private String newPassword; // 用户新密码
	private String repeatNewPassword; // 重复新密码

	private String msg; // 页面信息提示
	private String code;//页面对错信息提示
	
	@Autowired
	private UserService userService;

	// 更改用户密码
	public String modifyPassword() throws Exception
	{
		/*
		 * 修改用户密码 
		 * 1.从session中获取用户信息 
		 * 2.更改用户密码
		 */
		String uid = ((User)ServletActionContext.getRequest().getSession().getAttribute("user")).getUid();
		userService.updatePassword(uid, newPassword);
		this.setMsg("恭喜，密码修改成功！");
		this.setCode("success");
		
		return Action.SUCCESS;
	}

	// 验证密码信息
	public void validateModifyPassword()
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		String password = ((User) session.getAttribute("user")).getPassword();
		// 非空验证
		if (null == oldPassword || "".equals(oldPassword.trim()))
		{
			this.addFieldError("oldPassword", "旧密码不能为空！");

		}
		// 长度验证
		else if (oldPassword.length() < 8 || oldPassword.length() > 20)
		{
			this.addFieldError("oldPassword", "旧密码长度应该介于8到20位之间");
		}
		// 旧密码正确性认证
		else if (!password.equals(oldPassword))
		{
			this.addFieldError("oldPassword", "旧密码错误！");
		}

		// 新密码非空验证
		if (null == newPassword || "".equals(newPassword.trim()))
		{
			this.addFieldError("newPassword", "新密码不能为空！");

		}
		// 长度验证
		else if (newPassword.length() < 8 || newPassword.length() > 20)
		{
			this.addFieldError("newPassword", "新密码长度应该介于8到20位之间");
		}

		// 重复密码非空验证
		if (null == repeatNewPassword || "".equals(repeatNewPassword.trim()))
		{
			this.addFieldError("repeatNewPassword", "确认密码不能为空！");

		}
		// 重复密码是否与新密码一直验证
		else if (!repeatNewPassword.equals(newPassword))
		{
			this.addFieldError("repeatNewPassword", "两次密码输入不一致！");
		}
		

	}
	
	//ajax页面的旧密码验证
	public String ajaxOldPassword() throws Exception
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		String password = ((User) session.getAttribute("user")).getPassword();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter out = response.getWriter();
		
		if(password.equals(oldPassword))
		{
			out.print(false);
		}
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

	public String getNewPassword()
	{
		return newPassword;
	}

	public String getRepeatNewPassword()
	{
		return repeatNewPassword;
	}

	public void setNewPassword(String newPassword)
	{
		this.newPassword = newPassword;
	}

	public void setRepeatNewPassword(String repeatNewPassword)
	{
		this.repeatNewPassword = repeatNewPassword;
	}

	public String getOldPassword()
	{
		return oldPassword;
	}

	public void setOldPassword(String oldPassword)
	{
		this.oldPassword = oldPassword;
	}

	public String getMsg()
	{
		return msg;
	}

	public void setMsg(String msg)
	{
		this.msg = msg;
	}

}
