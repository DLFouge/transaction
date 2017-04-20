package action.good;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import service.GoodsService;
import util.UuidUtil;
import entity.Goods;
import entity.User;

public class AddGoods {
	private String goodsId; //商品id
	private String goodsName; //商品名称
	private double goodsPrice; //商品价格
	private String goodsDescribe;//商品描述
	private String onSaleTime;//商品上架时间
	private String degree;//商品新旧程度
	private String categoryId;//所属分类Id
	private String userId;//卖家用户id
	
	private List<File> goodsPicture;//商品图片文件
	private List<String> goodsPictureFileName;//文件名
	
	private String code;
	private String msg;
	
	@Autowired
	private GoodsService goodsService;
	
	
	public String addGoods(){
		String userId = ((User)ServletActionContext.getRequest().getSession().getAttribute("user")).getUid();
		Goods goods = new Goods();
		//设置商品id
		goods.setGoodsId(UuidUtil.uuid());
		goods.setGoodsName(goodsName);
		goods.setGoodsPrice(goodsPrice);
		goods.setGoodsDescribe(goodsDescribe);
		goods.setOnSaleTime(onSaleTime);
		goods.setDegree(degree);
		goods.setUserId(userId);
		
		
		goods.setCategoryId(categoryId);
		
		//图片存放地址
		goods.setPictureTop(upload(goodsPicture.get(0),goodsPictureFileName.get(0),goods.getGoodsId()+"_top"));
		goods.setPictureLeft(upload(goodsPicture.get(1),goodsPictureFileName.get(1),goods.getGoodsId()+"_left"));
		goods.setPictureRight(upload(goodsPicture.get(2),goodsPictureFileName.get(2),goods.getGoodsId()+"_right"));
		goods.setPictureBottom(upload(goodsPicture.get(3),goodsPictureFileName.get(3),goods.getGoodsId()+"_bottom"));

		boolean isAddGoods = goodsService.addGoods(goods);
		if(isAddGoods){
			this.setCode("success");
			this.setMsg("恭喜，上传商品成功！");
			return "success";
		}else{
			return "fail";
		}
	}
	//上传商品图片
	public String upload(File goods,String picture,String goodsId){
		String dir = ServletActionContext.getServletContext().getRealPath("/goods");
		String name = "";
		if(goods!=null){
			name = picture.substring(picture.indexOf("."));
			File saveFile = new File(new File(dir),goodsId+name);
			if(!saveFile.getParentFile().exists()){
				saveFile.getParentFile().mkdir();
			}
			try {

				String test = "C:/software/mydata/catt/transaction/WebContent/shopping_img";
				
				File testFile = new File(test, goodsId+name);
				
				FileUtils.copyFile(goods, saveFile);
				FileUtils.copyFile(goods, testFile);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return goodsId+name;
	}

	
	public List<File> getGoodsPicture() {
		return goodsPicture;
	}
	public void setGoodsPicture(List<File> goodsPicture) {
		this.goodsPicture = goodsPicture;
	}
	public List<String> getGoodsPictureFileName() {
		return goodsPictureFileName;
	}
	public void setGoodsPictureFileName(List<String> goodsPictureFileName) {
		this.goodsPictureFileName = goodsPictureFileName;
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


	public double getGoodsPrice() {
		return goodsPrice;
	}


	public void setGoodsPrice(double goodsPrice) {
		this.goodsPrice = goodsPrice;
	}


	public String getGoodsDescribe() {
		return goodsDescribe;
	}


	public void setGoodsDescribe(String goodsDescribe) {
		this.goodsDescribe = goodsDescribe;
	}


	public String getOnSaleTime() {
		return onSaleTime;
	}


	public void setOnSaleTime(String onSaleTime) {
		this.onSaleTime = onSaleTime;
	}


	public String getDegree() {
		return degree;
	}


	public void setDegree(String degree) {
		this.degree = degree;
	}


	public String getCategoryId() {
		return categoryId;
	}


	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public GoodsService getGoodsService() {
		return goodsService;
	}


	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}
	public String getCode()
	{
		return code;
	}
	public String getMsg()
	{
		return msg;
	}
	public void setCode(String code)
	{
		this.code = code;
	}
	public void setMsg(String msg)
	{
		this.msg = msg;
	}
	
	
}
