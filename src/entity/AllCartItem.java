package entity;

import java.math.BigDecimal;
import java.util.List;

public class AllCartItem
{
	private List<CartItem> list;   //购物车所有物品
	private User user;      //购物车车主
	
	public String allCartItemMoney()
	{
		BigDecimal sum = new BigDecimal("0");
		for(CartItem cartItem: this.list)
		{
			sum = sum.add(cartItem.totalMoney());
		}
		return sum.toString();
	}

	public List<CartItem> getList()
	{
		return list;
	}

	public User getUser()
	{
		return user;
	}

	public void setList(List<CartItem> list)
	{
		this.list = list;
	}

	public void setUser(User user)
	{
		this.user = user;
	}
   
	
}
