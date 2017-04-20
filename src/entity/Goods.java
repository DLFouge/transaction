package entity;

public class Goods
{
	private String goodsId; //商品id
	private String goodsName; //商品名称
	private double goodsPrice; //商品价格
	private String goodsDescribe;//商品描述
	private String onSaleTime;//商品上架时间
	private String degree;//商品新旧程度
	private Category category;//商品所属分类
	
	//4张商品图片
	private String pictureTop;
	private String pictureLeft;
	private String pictureRight;
	private String pictureBottom;
	
	
	private String categoryId; //分类id
	private String userId;  //用户id
	
	//setter and getter 方法
	
	public String getGoodsId()
	{
		return goodsId;
	}
	public String getPictureTop() {
		return pictureTop;
	}
	public void setPictureTop(String pictureTop) {
		this.pictureTop = pictureTop;
	}
	public String getPictureLeft() {
		return pictureLeft;
	}
	public void setPictureLeft(String pictureLeft) {
		this.pictureLeft = pictureLeft;
	}
	public String getPictureRight() {
		return pictureRight;
	}
	public void setPictureRight(String pictureRight) {
		this.pictureRight = pictureRight;
	}
	public String getPictureBottom() {
		return pictureBottom;
	}
	public void setPictureBottom(String pictureBottom) {
		this.pictureBottom = pictureBottom;
	}
	public String getGoodsName()
	{
		return goodsName;
	}
	public double getGoodsPrice()
	{
		return goodsPrice;
	}
	public String getGoodsDescribe()
	{
		return goodsDescribe;
	}
	public String getOnSaleTime()
	{
		return onSaleTime;
	}
	public String getDegree()
	{
		return degree;
	}
	public Category getCategory()
	{
		return category;
	}
	public void setGoodsId(String goodsId)
	{
		this.goodsId = goodsId;
	}
	public void setGoodsName(String goodsName)
	{
		this.goodsName = goodsName;
	}
	public void setGoodsPrice(double goodsPrice)
	{
		this.goodsPrice = goodsPrice;
	}
	public void setGoodsDescribe(String goodsDescribe)
	{
		this.goodsDescribe = goodsDescribe;
	}
	public void setOnSaleTime(String onSaleTime)
	{
		this.onSaleTime = onSaleTime;
	}
	public void setDegree(String degree)
	{
		this.degree = degree;
	}
	public void setCategory(Category category)
	{
		this.category = category;
	}
	public String getCategoryId()
	{
		return categoryId;
	}
	public String getUserId()
	{
		return userId;
	}
	public void setCategoryId(String categoryId)
	{
		this.categoryId = categoryId;
	}
	public void setUserId(String userId)
	{
		this.userId = userId;
	}
	
	

}
