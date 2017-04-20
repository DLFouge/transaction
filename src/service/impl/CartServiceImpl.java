package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import service.CartService;
import util.UuidUtil;
import dao.mapper.CartItemMapper;
import entity.AllCartItem;
import entity.CartItem;
import entity.Goods;
import entity.User;

public class CartServiceImpl implements CartService
{
	@Autowired
	private CartItemMapper cartItemMapper;

	private AllCartItem allCartItem = new AllCartItem();
	private CartItem cartItem;

	// 根据用户id查询出该用户所有购物
	@Override
	public AllCartItem selectByUId(String uid)
	{
		List<CartItem> list = cartItemMapper.selectByUId(uid);
		allCartItem.setList(list);
		return allCartItem;
	}

	public AllCartItem addCartItem(String uid, int quantity, String goodsId)
	{
		/*
		 * 1.根据用户uid及图书bid查询数据库，看该用户是否添加了改图书到购物车中
		 */
		cartItem = cartItemMapper.selectByUIdAndGoodsId(uid, goodsId);

		/*
		 * 2.如果已添加，则更新该购物车中的购物数量
		 */
		if (cartItem != null)
		{
			int oldQuantity = cartItem.getQuantity();// 购物车中已有的数目
			int newQuantity = oldQuantity + quantity;
			cartItemMapper.updateCartItem(uid, goodsId, newQuantity);
		}
		/*
		 * 3.如果没有添加，则生成购物车项，添加到数据库中
		 */
		else
		{
			String cartId = UuidUtil.uuid();
			cartItem = new CartItem();
			// 设置购物栏id
			cartItem.setCartId(cartId);
			// 设置购买数量
			cartItem.setQuantity(quantity);
			// 设置书本信息
			Goods goods = new Goods();
			goods.setGoodsId(goodsId);
			cartItem.setGood(goods);
			// 设置图书用户信息
			User user = new User();
			user.setUid(uid);
			cartItem.setUser(user);

			// 添加到数据库中
			cartItemMapper.insertCartItem(cartItem);

		}
		return this.selectByUId(uid);
	}

	/*
	 * 批量删除购物项
	 */
	@Override
	public AllCartItem deleteCartItem(String uid, List<String> list)
	{
		/*
		 * 1.删除list中所有的cartItem项
		 */
		cartItemMapper.deleteCartItem(list);
		/*
		 * 2.返回改用户的购物车
		 */
		return selectByUId(uid);
	}

	// ajax对商品商品项的异步加减操作
	public CartItem ajaxJiaAndJian(String cartId, int quantity)
	{
		// 对购物项进行修改
		cartItemMapper.ajaxJiaAndJian(cartId, quantity);

		// 查询出修改项返回
		cartItem = cartItemMapper.selectByCartItemId(cartId);
		return cartItem;
	}

	// 查询当前用户所想买取得商品
	@Override
	public AllCartItem submitGoodsItem(List<String> list, String uid)
	{
		List<CartItem> listItem = cartItemMapper.submitGoodsItem(list, uid);
		// 返回用户所想买的商品清单
		allCartItem.setList(listItem);
		return allCartItem;
	}

}
