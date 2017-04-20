package entity;

public class UserInfo {
	private String userInfoId;//用户信息id
	private String userId;//用户id
	private String nickName;//昵称
	private String realName;//真实姓名
	private String gender;//性别
	private String birthday;//生日
	private String address;//住址
	private String photoAddress;//图片地址
	private String idetityCart; // 身份证号
	private String studentCart; //学号
	private String applyStatus;//申请状态
	private String checkStatus;//审核状态
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserInfoId() {
		return userInfoId;
	}
	public void setUserInfoId(String userInfoId) {
		this.userInfoId = userInfoId;
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
	public String getApplyStatus() {
		return applyStatus;
	}
	public void setApplyStatus(String applyStatus) {
		this.applyStatus = applyStatus;
	}
	public String getCheckStatus() {
		return checkStatus;
	}
	public void setCheckStatus(String checkStatus) {
		this.checkStatus = checkStatus;
	}
	public String getIdetityCart() {
		return idetityCart;
	}
	public void setIdetityCart(String idetityCart) {
		this.idetityCart = idetityCart;
	}
	public String getStudentCart() {
		return studentCart;
	}
	public void setStudentCart(String studentCart) {
		this.studentCart = studentCart;
	}
	
	

}
