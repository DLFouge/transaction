package entity;

public class User
{
	private String uid;                  //用户id
	private String userName;             //用户名
	private String password;            //用户密码
	private String email;              //用户邮箱
	private int status;                //用户状态
	private int authority;            //用户权限
	private String activationCode;    //激活码
	private String newPassword;       //新密码
    private String confirmPassword;   //确认密码
    private int applyStatus;          //申请状态 0 未申请，1 申请中 ，2 申请成功，3，申请拒绝
    private UserInfo userInfo;         //用户信息
	public String getUid()
	{
		return uid;
	}
	public String getUserName()
	{
		return userName;
	}
	public String getPassword()
	{
		return password;
	}
	public String getEmail()
	{
		return email;
	}
	public int getStatus()
	{
		return status;
	}
	public int getAuthority()
	{
		return authority;
	}
	public String getActivationCode()
	{
		return activationCode;
	}
	public String getNewPassword()
	{
		return newPassword;
	}
	public String getConfirmPassword()
	{
		return confirmPassword;
	}
	public void setUid(String uid)
	{
		this.uid = uid;
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	public void setStatus(int status)
	{
		this.status = status;
	}
	public void setAuthority(int authority)
	{
		this.authority = authority;
	}
	public void setActivationCode(String activationCode)
	{
		this.activationCode = activationCode;
	}
	public void setNewPassword(String newPassword)
	{
		this.newPassword = newPassword;
	}
	public void setConfirmPassword(String confirmPassword)
	{
		this.confirmPassword = confirmPassword;
	}
	public int getApplyStatus()
	{
		return applyStatus;
	}
	public void setApplyStatus(int applyStatus)
	{
		this.applyStatus = applyStatus;
	}
	public UserInfo getUserInfo()
	{
		return userInfo;
	}
	public void setUserInfo(UserInfo userInfo)
	{
		this.userInfo = userInfo;
	}
	
	
	

}
