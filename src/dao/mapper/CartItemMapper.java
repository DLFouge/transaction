package dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.CartItem;

public interface CartItemMapper
{
	/*
	 * 根据用户id把用户购买的商品全查出来 param : uid : 用户id return : 该用户下所有购物项
	 */
	public List<CartItem> selectByUId(@Param("uid") String uid);

	/*
	 * 根据用户id以及商品id查询购物车项 param : uid : 用户id goodId : 商品id
	 */
	public CartItem selectByUIdAndGoodsId(@Param("uid") String uid,
			@Param("goodsId") String goodsId);

	/*
	 * 根据用户id,商品id,以及更新数量更新购物车项 param : uid : 用户id goodsId : 商品id quantity :
	 * 商品数量
	 */
	public void updateCartItem(@Param("uid") String uid,
			@Param("goodsId") String goodsId, @Param("quantity") int quantity);

	/*
	 * 新生成购物项 param : 购物车项
	 */
	public void insertCartItem(CartItem cartItem);

	/*
	 * 批量删除购物项 param : list : 删除商品列表
	 */
	public void deleteCartItem(List<String> list);

	/*
	 * ajax根据对商品项和数量对商品进行异步加减操作 param : itemId　: 商品项 quantity : 商品数量
	 */
	public void ajaxJiaAndJian(@Param("itemId") String itemId,
			@Param("quantity") int quantity);

	/*
	 * 根据商品项id查询出商品 param : CartItemId : 购物项商品id return : 返回该id所对应的商品
	 */
	public CartItem selectByCartItemId(@Param("CartItemId") String CartItemId);

	/*
	 * 查询当用用户所想买取得商品
	 * param : 
	 *      list : 所想买商品id列表
	 *      uid  : 用户id
	 */
	public List<CartItem> submitGoodsItem(@Param("list") List<String> list,
			@Param("uid") String uid);

}
