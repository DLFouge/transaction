package action.userInfo;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import service.UserInfoService;
import entity.User;
import entity.UserInfo;

public class SelectUserInfo {
	
	private UserInfo userInfo;

	@Autowired
	private UserInfoService userInfoService;
	
	//查看用户个人信息
	public String selectUserInfo()
	{
		String userId = ((User)ServletActionContext.getRequest().getSession().getAttribute("user")).getUid();
		userInfo = userInfoService.selectUserInfo(userId);
		return "success";
	}
	
	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}
	public UserInfoService getUserInfoService() {
		return userInfoService;
	}

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}
}
