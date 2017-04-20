package action.good;

import org.springframework.beans.factory.annotation.Autowired;

import service.GoodsService;
import service.UserInfoService;
import entity.Goods;
import entity.UserInfo;

public class SelectGoodDetail {
	private String goodsId; //商品id
	private String goodsName; //商品名称
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private UserInfoService userInfoService;
	
	private Goods goods; 
	
	private UserInfo userInfo;
	
	
	//根据商品id查询
	public String selectById(){
		goods = goodsService.selectById(goodsId);
		//获取卖家用户信息
		userInfo = userInfoService.selectUserInfo(goods.getUserId());
		if(goods!=null){
			return "success";
		}else{
			return "fail";
		}
	}
	
	//根据商品名字查询
	public String selectByName(){
		goods = goodsService.selectByName(goodsName);
		//获取卖家用户信息
		userInfo = userInfoService.selectUserInfo(goods.getUserId());
		if(goods!=null){
			return "success";
		}else{
			return "fail";
		}
	}
	
	
	public UserInfoService getUserInfoService() {
		return userInfoService;
	}

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public GoodsService getGoodsService() {
		return goodsService;
	}

	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public String getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	
}
