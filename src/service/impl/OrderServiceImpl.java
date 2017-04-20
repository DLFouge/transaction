package service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.binding.BindingException;
import org.springframework.beans.factory.annotation.Autowired;

import service.OrderService;
import dao.mapper.OrderMapper;
import entity.Order;
import entity.OrderItem;

public class OrderServiceImpl implements OrderService
{

	@Autowired
	private OrderMapper orderMapper;

	// 创建订单
	@Override
	public void addOrder(Order order)
	{
		orderMapper.addOrder(order);

	}

	// 创建订单子项
	public void addOrderItem(List<OrderItem> orderItemList)
	{
		orderMapper.addOrderItem(orderItemList);
	}

	// 根据用户id查询该用户总订单数
	public int selectAllOrder(String uid)
	{
		int orderNumber = orderMapper.selectAllOrderNumber(uid);
		return orderNumber;
	}

	// 根据用户id和当前页面以及页面限定个数查询出所有订单
	public List<Order> selectAllOrder(String uid, int currentPage,
			int constancePage)
	{
		List<Order> list = orderMapper.selectAllOrder(uid, currentPage,
				constancePage);
		return list;

	}

	// 根据订单号查询出订单
	public Order selectOrderByOid(String oid)
	{
		Order order = orderMapper.selectOrderByOid(oid);
		return order;
	}

	// 根据订单号和用户id删除订单
	public void deleteOrderByOidAndUid(String oid, String uid)
	{
		orderMapper.deleteAllOrderItem(oid);
		orderMapper.deleteOrderByOidAndUId(oid, uid);
	}

	// 根据订单号和想修改状态修改订单状态
	public void updateOrderStatus(String oid, int status)
	{
		orderMapper.updateOrderStatus(oid, status);
	}

	//根据订单状态查询订单
	@Override
	public List<Order> selectByStatus(String uid, int status, int currentPage,
			int constancePage)
	{
		//等会修改
		List<Order> list = orderMapper.selectByStatus(uid, status, currentPage, constancePage);
		return list;
	}
	
	@Override
	public int selectAllByStatus(String uid, int status)
	{
		
		return orderMapper.selectAllByStatus(uid, status);
	}

}
