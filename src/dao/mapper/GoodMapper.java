package dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Goods;
import entity.GoodsPage;
import entity.OrderItem;

public interface GoodMapper
{
	/*
	 * 根据分类查询商品 param : cid : 商品分类id pageCode : 当前页码 limitNumber : 页面所需查找数
	 */
	public List<Goods> selectByCid(@Param("cid") String cid,
			@Param("pageCode") int pageCode,
			@Param("limitNumber") int limitNumber);

	/*
	 * 按商品分类（cid）查询出这类所有商品 param : cid : 商品分类 return : 该类商品总数目
	 */
	public int selectAllByCid(@Param("cid") String cid);

	/*
	 * 根据分类查询商品 param : degree : 商品新旧程度 pageCode : 当前页码 limitNumber : 页面所需查找数
	 */
	public List<Goods> selectByDegree(@Param("degree") String degree,
			@Param("pageCode") int pageCode,
			@Param("limitNumber") int limitNumber);

	/*
	 * 按商品新旧程度查询出这类所有商品 param : degree : 商品新旧程度 return : 该类商品总数目
	 */
	public int selectAllByDegree(@Param("degree") String degree);

	/*
	 * 根据商品价格查询 param : price1 : 价格低价 price2 : 价格上价 pageCode : 当前页 limitNumber :
	 * 页面商品数 return : 返回查询到的商品列表
	 */
	public List<Goods> selectByPrice(@Param("price1") int price1,
			@Param("price2") int price2, @Param("pageCode") int pageCode,
			@Param("limitNumber") int limitNumber);

	/*
	 * 根据价格区间查询出所有商品 param : price1 : 价格低价 price2 : 价格上价 return : 返回查询到的所有商品数
	 */
	public int selectAllByPrice(@Param("price1") int price1,
			@Param("price2") int price2);

	/*
	 * 根据用户id查询商品 param : uid : 用户id pageCode : 当前页 limitNumber : 页面商品数 return :
	 * 当前用户商品列表
	 */
	public List<Goods> selectByUid(@Param("uid") String uid,
			@Param("pageCode") int pageCode,
			@Param("limitNumber") int limitNumber);

	/*
	 * 根据用户id查询商品总数 param : uid : 用户id return : 用户商品总数
	 */
	public int countByUid(@Param("uid") String uid);

	/*
	 * 根据商品id更改商品信息 param : goodsId: 商品id goodsName: 商品名称 goodsPrice: 商品价格
	 * goodsDescribe: 商品描述 onSaleTime: 商品上架时间 degree: 商品新旧程度
	 */
	public void updateGoodsInform(@Param("goodsId") String goodsId,
			@Param("goodsName") String goodsName,
			@Param("goodsPrice") double goodsPrice,
			@Param("goodsDescribe") String goodsDescribe,
			@Param("onSaleTime") String onSaleTime,
			@Param("degree") String degree);

	/*
	 * 根据订单状态查询已买商品 param :uid : 用户id status : 订单状态 send : 发货状态 pageCode : 当前页
	 * limitNumber : 页面商品数 return : 当前用户商品列表
	 */
	public List<OrderItem> selectByStatus(@Param("uid") String uid,
			@Param("status") int status, @Param("send") int send,
			@Param("pageCode") int pageCode,
			@Param("limitNumber") int limitNumber);
	
	/*
	 * 根据订单状态查询已买商品 param :uid : 用户id status : 订单状态 send
	 */
	public int countByStatus(@Param("uid") String uid,
			@Param("status") int status, @Param("send") int send);

	/*
	 * 更改发货状态
	 */
	public void updateStatus(String orderItemId);
	
	
	/*
	 * 根据分类查询商品 param : name : 商品模糊名 pageCode : 当前页码 limitNumber : 页面所需查找数
	 */
	public List<Goods> selectByLike(@Param("name") String name,
			@Param("pageCode") int pageCode,
			@Param("limitNumber") int limitNumber);

	/*
	 * 按商品新旧程度查询出这类所有商品 param : name : 商品模糊名 return : 该类商品总数目
	 */
	public int selectAllByLike(@Param("name") String name);

}
