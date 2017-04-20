package action.user;

import org.springframework.beans.factory.annotation.Autowired;

import service.UserService;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class FindPassword extends ActionSupport
{
	private String email;  //邮箱地址
	private String uid;	   //用户id
	private String newPassword; //用户新密码
	private String repeatNewPassword; //重复新密码
	
	private String msg;    //页面显示信息
	private String code;   //页面提示对错
	
	
	@Autowired
	private UserService userService;
	//通过发送邮件找回密码
	public String sendEmail() throws Exception
	{
		boolean flag = userService.sendEmail(email);
		if(!flag)
		{
			this.setCode("error");
			this.setMsg("该用户不存在，请确认邮箱地址是否正确！");
		}
		else
		{
			this.setCode("success");
			this.setMsg("恭喜，邮件已发送到您的邮箱，请登录邮箱进行修改密码！");
		}
		return Action.SUCCESS;
	}

	public String findPassword() throws Exception
	{
		userService.updatePassword(uid, newPassword);
		this.setCode("success");
		this.setMsg("恭喜，密码更改成功,请登录！");
		return Action.SUCCESS;
	}
	
	//验证新密码的正确性
	public void validateFindPassword()
	{
		/*
		 * 1.新密码验证
		 */
		// 非空验证
		if (null == newPassword || "".equals(newPassword.trim()))
		{
			this.addFieldError("newPassword", "新密码不能为空！");

		}
		// 长度验证
		else if (newPassword.length() < 8 || newPassword.length() > 20)
		{
			this.addFieldError("newPassword", "新密码长度应该介于8到20位之间");
		}
		/*
		 * 2.确认密码验证
		 */
		if (repeatNewPassword == null || "".equals(repeatNewPassword.trim()))
		{
			this.addFieldError("repeatNewPassword", "确认密码不能为空！");
		} else if (!repeatNewPassword.equals(newPassword))
		{
			this.addFieldError("repeatNewPassword", "两次密码不一致！");
		}
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

	public String getUid()
	{
		return uid;
	}
	public void setUid(String uid)
	{
		this.uid = uid;
	}
	public String getEmail()
	{
		return email;
	}
	public String getMsg()
	{
		return msg;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	public void setMsg(String msg)
	{
		this.msg = msg;
	}

}
