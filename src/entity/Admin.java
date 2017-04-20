package entity;

public class Admin
{
	private String adminId; //主键
	private String adminName; //管理员名
	private String password;   //密码
	
	//setter and getter 方法
	public String getAdminId()
	{
		return adminId;
	}
	public String getAdminName()
	{
		return adminName;
	}
	public String getPassword()
	{
		return password;
	}
	public void setAdminId(String adminId)
	{
		this.adminId = adminId;
	}
	public void setAdminName(String adminName)
	{
		this.adminName = adminName;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	
	

}
