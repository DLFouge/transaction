package entity;

import java.util.List;

public class Order
{
	private String orderId; //订单id
	private String orderTime; //下单时间
	private double total;    //订单总价
	private int status;  //订单状态  1.未付款  2.已付款但未发货  3.已付款未确定 4.确认收货交易成功 5.取消订单
	private String address; //订单地址
	private User user;     //下单用户
	private List<OrderItem> list;  //订单中订单子项
	
	//setter and getter 方法
	public String getOrderId()
	{
		return orderId;
	}
	public String getOrderTime()
	{
		return orderTime;
	}
	public double getTotal()
	{
		return total;
	}
	public int getStatus()
	{
		return status;
	}
	public String getAddress()
	{
		return address;
	}
	public User getUser()
	{
		return user;
	}
	public List<OrderItem> getList()
	{
		return list;
	}
	public void setOrderId(String orderId)
	{
		this.orderId = orderId;
	}
	public void setOrderTime(String orderTime)
	{
		this.orderTime = orderTime;
	}
	public void setTotal(double total)
	{
		this.total = total;
	}
	public void setStatus(int status)
	{
		this.status = status;
	}
	public void setAddress(String address)
	{
		this.address = address;
	}
	public void setUser(User user)
	{
		this.user = user;
	}
	public void setList(List<OrderItem> list)
	{
		this.list = list;
	}
	
	

}
