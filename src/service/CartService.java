package service;

import java.util.List;

import entity.AllCartItem;
import entity.CartItem;

public interface CartService
{
	/*
	 * 根据用户id查询出该用户所有购物 param : 用户id return : 该用户购物车中所有商品
	 */
	public AllCartItem selectByUId(String uid);

	/*
	 * 根据用户id,购物数目以及购物商品id添加商品项 param : uid : 用户id quantity : 商品数量 goodId : 商品id
	 */
	public AllCartItem addCartItem(String uid, int quantity, String goodsId);

	/*
	 * 批量删除购物项 param : uid　:用户id list : 商品id列表项 return : 返回所有该用户的购物项
	 */
	public AllCartItem deleteCartItem(String uid, List<String> list);

	/*
	 * ajax对商品商品项的异步加减操作
	 * param : 
	 * 		cartId : 购物车项
	 * 		quantity : 商品数量
	 */
	public CartItem ajaxJiaAndJian(String cartId, int quantity);
	
	/*
	 * 查询当前用户所想买取得商品
	 * param : 
	 * 		list : 用户想购买商品集
	 * 		uid : 用户id
	 * return :
	 *      返回该用户所想买的商品
	 */
	public AllCartItem submitGoodsItem(List<String> list,String uid);

}
