package entity;

import java.math.BigDecimal;

public class CartItem
{
	private String cartId; // 订单id
	private int quantity;// 订单数目
	private Goods good;// 书本
	private User user;//用户

	public BigDecimal totalMoney()  //返回该订单条目的小计
	{
		BigDecimal number1 = new BigDecimal(this.good.getGoodsPrice() + "");
		BigDecimal number2 = new BigDecimal(this.quantity + "");
		BigDecimal total = number1.multiply(number2);
		return total;

	}

	public String getCartId()
	{
		return cartId;
	}

	public int getQuantity()
	{
		return quantity;
	}

	public void setCartId(String cartId)
	{
		this.cartId = cartId;
	}

	public void setQuantity(int quantity)
	{
		this.quantity = quantity;
	}

	public Goods getGood()
	{
		return good;
	}

	public void setGood(Goods good)
	{
		this.good = good;
	}

	public User getUser()
	{
		return user;
	}

	public void setUser(User user)
	{
		this.user = user;
	}
	

}
