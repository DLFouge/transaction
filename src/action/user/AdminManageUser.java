package action.user;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import service.AdminService;
import service.UserInfoService;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import entity.ConstanceValue;
import entity.UserInfo;
import entity.UserPage;

public class AdminManageUser extends ActionSupport
{
	private int pageCode = 1;  //设置默认页码
	private UserPage userPage; //管理员查询页面分页数据
	private int status=1; //设置查询用户默认状态
	private String btn;  //页面显示操作提示
	private String userId; //用户id
	private UserInfo userInfo; //用户信息
	private String msg;//页面提示信息
	private String code; //操作提示信息
	
	
	@Autowired
	private AdminService adminService;
	 
	@Autowired
	private UserInfoService userInfoService;
	//根据状态查询用户
	public String selectAllUser() throws Exception
	{
		// 生成userPage对象
		userPage = new UserPage();

		/*
		 * 1.查询总订单数
		 */
		int allTotalNumber = adminService.allApplyUser(status);
		userPage.setTotalRecord(allTotalNumber);
		/*
		 * 3.设置总页码
		 */
		int allPageNumber = 0;// 总的页数
		int eachPageNumber = ConstanceValue.PAGE_USER_NUMBER; // 每一页的商品数
		if (allTotalNumber % eachPageNumber == 0)
		{
			allPageNumber = allTotalNumber / eachPageNumber;
		} else
		{
			allPageNumber = allTotalNumber / eachPageNumber + 1;
		}
		userPage.setTotalPage(allPageNumber);
		/*
		 * 4.设置当前页码
		 */
		userPage.setCurrentPage(this.pageCode);
		/*
		 * 5.设置订单内容
		 */
		userPage.setList(adminService.selectAllApplyUser(status,(pageCode - 1)
				* eachPageNumber, eachPageNumber));

		/*
		 * 6.设置url
		 */
		HttpServletRequest request = ServletActionContext.getRequest();
		StringBuffer url = request.getRequestURL();
		// 设置按一个查询方式进行查询
		url.append("?status=" + this.getStatus()+"&btn="+ this.getBtn());
		userPage.setUrl(url.toString());
		return Action.SUCCESS;
	}
	
	//查看用户详细信息
	public String userDetial() throws Exception
	{
		this.setUserInfo(userInfoService.selectUserInfo(userId));
		return Action.SUCCESS;
	}
	
	//更改用户状态
	public String updateUserStatus() throws Exception
	{
		adminService.updateUserStatus(userId, status);
		this.setMsg("恭喜，更改用户权限成功！");
		this.setCode("success");
		return Action.SUCCESS;
	}
	
	
	public String getMsg()
	{
		return msg;
	}

	public String getCode()
	{
		return code;
	}

	public void setMsg(String msg)
	{
		this.msg = msg;
	}

	public void setCode(String code)
	{
		this.code = code;
	}

	public String getBtn()
	{
		return btn;
	}



	public void setBtn(String btn)
	{
		this.btn = btn;
	}



	public int getStatus()
	{
		return status;
	}


	public void setStatus(int status)
	{
		this.status = status;
	}


	public int getPageCode()
	{
		return pageCode;
	}
	public UserPage getUserPage()
	{
		return userPage;
	}
	public void setPageCode(int pageCode)
	{
		this.pageCode = pageCode;
	}
	public void setUserPage(UserPage userPage)
	{
		this.userPage = userPage;
	}

	public String getUserId()
	{
		return userId;
	}

	public UserInfo getUserInfo()
	{
		return userInfo;
	}

	public void setUserId(String userId)
	{
		this.userId = userId;
	}

	public void setUserInfo(UserInfo userInfo)
	{
		this.userInfo = userInfo;
	}
	
	
	
}
