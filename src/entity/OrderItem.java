package entity;

public class OrderItem
{
	private String orderItemId;  //id
	private int quantity;    //商品数目
	private double subtotal;  //商品数量
	private Order order;  //商品所属订单
	private Goods goods;  //商品
	
	//setter and getter 方法
	public String getOrderItemId()
	{
		return orderItemId;
	}
	public int getQuantity()
	{
		return quantity;
	}
	public double getSubtotal()
	{
		return subtotal;
	}
	public Order getOrder()
	{
		return order;
	}
	public Goods getGoods()
	{
		return goods;
	}
	public void setOrderItemId(String orderItemId)
	{
		this.orderItemId = orderItemId;
	}
	public void setQuantity(int quantity)
	{
		this.quantity = quantity;
	}
	public void setSubtotal(double subtotal)
	{
		this.subtotal = subtotal;
	}
	public void setOrder(Order order)
	{
		this.order = order;
	}
	public void setGoods(Goods goods)
	{
		this.goods = goods;
	}

}
