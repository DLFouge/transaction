package service;

import entity.Goods;
import entity.GoodsPage;
import entity.OrderItem;

public interface GoodService
{
	/*
	 * 根据分类查询商品 param : cid : 分类id pageCode : 当前页 limitNumber : 页面商品数 return :
	 * 返回查询到的商品列表
	 */
	public GoodsPage<Goods> selectByCid(String cid, int pageCode,
			int limitNumber);

	/*
	 * 根据分类查询出所有商品 param : cid : 分类id return : 返回该分类下的所有商品数
	 */
	public int selectBycid(String cid);

	/*
	 * 根据新旧程度查询商品 param : degree : 分类id pageCode : 当前页 limitNumber : 页面商品数
	 * return : 返回查询到的商品列表
	 */
	public GoodsPage<Goods> selectByDegree(String degree, int pageCode,
			int limitNumber);

	/*
	 * 根据分类查询出所有商品 param : degreen : 商品新旧程度 return : 返回该分类下的所有商品数
	 */
	public int selectByDegree(String degree);

	/*
	 * 根据商品价格查询 param : price1 : 价格低价 price2 : 价格上价 pageCode : 当前页 limitNumber :
	 * 页面商品数 return : 返回查询到的商品列表
	 */
	public GoodsPage<Goods> selectByPrice(int price1, int price2, int pageCode,
			int limitNumber);

	/*
	 * 根据价格区间查询出所有商品 param : price1 : 价格低价 price2 : 价格上价 return : 返回查询到的所有商品数
	 */
	public int selectAllByPrice(int price1, int price2);

	/*
	 * 根据用户id查询商品 param : uid : 用户id pageCode : 当前页 limitNumber : 页面商品数 return :
	 * 当前用户商品列表
	 */
	public GoodsPage<Goods> selectByUid(String uid, int pageCode,
			int limitNumber);

	/*
	 * 根据用户id查询商品总数 param : uid : 用户id return : 用户商品总数
	 */
	public int countByUid(String uid);

	/*
	 * 根据商品id更改商品信息 param : goodsId: 商品id goodsName: 商品名称 goodsPrice: 商品价格
	 * goodsDescribe: 商品描述 onSaleTime: 商品上架时间 degree: 商品新旧程度
	 */
	public void updateGoodsInform(String goodsId, String goodsName,
			double goodsPrice, String goodsDescribe, String onSaleTime,
			String degree);

	/*
	 * 根据订单状态查询已买商品 param :uid : 用户id status : 订单状态 send : 发货状态 pageCode : 当前页
	 * limitNumber : 页面商品数 return : 当前用户商品列表
	 */
	public GoodsPage<OrderItem> selectByStatus(String uid, int status, int send,
			int pageCode, int limitNumber);
	
	/*
	 * 根据订单状态查询已买商品 param :uid : 用户id status : 订单状态 send
	 */
	public int countByStatus(String uid, int status, int send);
	
	/*
	 * 
	 * 更改发货状态
	 */
	public void updateStatus(String OrderItemId);
	
	/*
	 * 根据分类查询商品 param : name : 商品名  pageCode : 当前页 limitNumber : 页面商品数 return :
	 * 返回查询到的商品列表
	 */
	public GoodsPage<Goods> selectByLike(String name, int pageCode,
			int limitNumber);

	/*
	 * 根据价格区间查询出所有商品 param : name : 商品模糊名  return : 返回查询到的所有商品数
	 */
	public int selectAllByLike(String name);
}
