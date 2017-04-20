package action.user;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import service.UserInfoService;
import service.UserService;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import entity.User;
import entity.UserInfo;

public class ApplyForShop extends ActionSupport{
	private String nickName;//昵称
	private String realName;//真实姓名
	private String idetityCart;//学号
	private String gender;//性别
	private String birthday;//生日
	private String address;//地址
	private String photoAddress;//图片地址
	private String year;  //年
	private String month; //月
	private String day;   //日
	
	private String studentCart;//学号
	
	private String msg; // 页面信息提示
	private String code;//页面对错信息提示
	
	private File avatar;//头像文件
	private String avatarFileName;//头像文件名
	
	private UserInfo userInfo;
	@Autowired
	private UserInfoService userInfoService;
	
	@Autowired
	private UserService userService;
	//修改个人信息
	public String updateUserInfo() throws Exception{
		userInfo = new UserInfo();
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User)session.getAttribute("user");
		
		String userId =user.getUid();
		//设置用户信息
		userInfo.setNickName(nickName);
		userInfo.setRealName(realName);
		userInfo.setGender(gender);
		this.setBirthday(this.year + "-"+ this.month +"-"+ this.day );
		userInfo.setBirthday(this.getBirthday());
		userInfo.setAddress(address);
		userInfo.setPhotoAddress(upload(userId));
		userInfo.setUserId(userId);
		userInfo.setIdetityCart(idetityCart);
		userInfo.setStudentCart(studentCart);
		userInfoService.updataUserInfo(userInfo);
		
		userService.updateUserRight(userId);
		//更改页面申请状态
		user.setApplyStatus(1);
		session.setAttribute("user", user);
		
		this.setMsg("恭喜，信息保存成功！");
		this.setCode("success");
		return Action.SUCCESS;
		
	}
	
	//验证
	public void validateUpdateUserInfo()
	{
		
	}
	//上传头像
	public String upload(String userId){
		String dir = ServletActionContext.getServletContext().getRealPath("/avatars");
		String name = "";
		if(avatar!=null){
			name = avatarFileName.substring(avatarFileName.indexOf("."));
			File saveFile = new File(new File(dir),userId+name);
			if(!saveFile.getParentFile().exists()){
				saveFile.getParentFile().mkdir();
			}
			try {
				String test = "C:/software/mydata/catt/transaction/WebContent/user_img";
				
				File testFile = new File(test, userId+name);
				
				FileUtils.copyFile(avatar, saveFile);
				FileUtils.copyFile(avatar, testFile);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return userId+name;
	} 
	
	public File getAvatar() {
		return avatar;
	}
	public void setAvatar(File avatar) {
		this.avatar = avatar;
	}
	public String getAvatarFileName() {
		return avatarFileName;
	}
	public void setAvatarFileName(String avatarFileName) {
		this.avatarFileName = avatarFileName;
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
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	
	public String getIdetityCart()
	{
		return idetityCart;
	}
	public String getStudentCart()
	{
		return studentCart;
	}
	public void setIdetityCart(String idetityCart)
	{
		this.idetityCart = idetityCart;
	}
	public void setStudentCart(String studentCart)
	{
		this.studentCart = studentCart;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhotoAddress() {
		return photoAddress;
	}
	public void setPhotoAddress(String photoAddress) {
		this.photoAddress = photoAddress;
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
	public String getYear()
	{
		return year;
	}
	public String getMonth()
	{
		return month;
	}
	public String getDay()
	{
		return day;
	}
	public void setYear(String year)
	{
		this.year = year;
	}
	public void setMonth(String month)
	{
		this.month = month;
	}
	public void setDay(String day)
	{
		this.day = day;
	}
	
}
