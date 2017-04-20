package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Order;
import entity.OrderItem;

public interface OrderService
{
	/*
	 * 创建订单 param : order : 订单实体类信息
	 */
	public void addOrder(Order order);

	/*
	 * 创建订单子项 param : orderItemList : 订单子项列表
	 */
	public void addOrderItem(List<OrderItem> orderItemList);

	/*
	 * 根据用户号查询出该用户总订单数 param : uid : 用户id return : 该用户订单数
	 */
	public int selectAllOrder(String uid);

	/*
	 * 根据用户id和当前页面以及页面限定个数查询出所有订单 param : uid : 用户id currentPage : 当前页码
	 * constancePage : 页面显示个数 return : 返回查询出来的订单
	 */
	public List<Order> selectAllOrder(String uid, int currentPage,
			int constancePage);

	/*
	 * 根据订单号查询订单 param : oid : 订单号 return : 该订单号所对应的订单
	 */
	public Order selectOrderByOid(String oid);

	/*
	 * 根据订单号和用户id删除订单 param : oid : 订单号 uid : 用户id
	 */
	public void deleteOrderByOidAndUid(String oid, String uid);

	/*
	 * 根据订单号和修改状态修改订单状态 param : oid : 订单号 status : 修改状态
	 */
	public void updateOrderStatus(String oid, int status);

	/*
	 * 根据订单号状态和用户id查询订单 param : status : 订单状态 uid : 用户id currentPage : 当前页码
	 * constancePage : 页面显示个数 return : 返回查询出来的订单
	 */
	public List<Order> selectByStatus(String uid, int status, int currentPage,
			int constancePage);

	/*
	 * 根据用户号和订单状态查询出该用户总订单数 param : uid : 用户id status : 订单状态
	 * return : 订单数
	 */
	public int selectAllByStatus(String uid, int status);
}
