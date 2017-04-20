package action.good;

import org.springframework.beans.factory.annotation.Autowired;

import service.GoodService;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class EditGoods extends ActionSupport
{
	private String goodsId; // 商品id
	private String goodsName; // 商品名称
	private double goodsPrice; // 商品价格
	private String goodsDescribe;// 商品描述
	private String onSaleTime;// 商品上架时间
	private String degree;// 商品新旧程度
	private String msg;//更改提示
	private String code;//页面显示信息

	@Autowired
	private GoodService goodService;

	public String updateGoodsInform() throws Exception
	{
		goodService.updateGoodsInform(goodsId, goodsName, goodsPrice,
				goodsDescribe, onSaleTime, degree);
		this.setMsg("恭喜，修改成功！");
		this.setCode("success");
		
		return Action.SUCCESS;
	}

	// setter and getter 方法
	
	public String getGoodsId()
	{
		return goodsId;
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

}
