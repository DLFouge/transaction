package dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Order;
import entity.OrderItem;

public interface OrderMapper
{
	// 创建订单
	public void addOrder(Order order);

	// 创建订单子项
	public void addOrderItem(List<OrderItem> list);

	// 根据用户id查询出总订单数
	public int selectAllOrderNumber(@Param("uid") String uid);

	// 根据用户id和当前页面以及页面限定个数查询出所有订单
	public List<Order> selectAllOrder(@Param("uid") String uid,
			@Param("currentPage") int currentPage,
			@Param("constancePage") int constancePage);

	// 根据订单号查询出订单
	public Order selectOrderByOid(@Param("oid") String oid);

	// 根据订单号和用户id取消订单（删除之前首先删除订单子项）
	public int deleteOrderByOidAndUId(@Param("oid") String oid,
			@Param("Uid") String uid);

	// 根据订单号删除订单子项
	public int deleteAllOrderItem(@Param("oid") String oid);

	// 更新用户订单状态
	public void updateOrderStatus(@Param("oid") String oid,
			@Param("status") int status);
	
	/*
	 * 根据订单号状态和用户id查询订单
	 * param : 
	 * 		status : 订单状态
	 * 		uid : 用户id
	 */
	public List<Order> selectByStatus(@Param("uid")String uid,@Param("status")int status,@Param("currentPage") int currentPage,
			@Param("constancePage") int constancePage);
	
	/*
	 *	根据订单号状态和用户id查询订单
	 * param : 
	 * 		status : 订单状态
	 * 		uid : 用户id
	 */
	public int selectAllByStatus(@Param("uid")String uid,@Param("status")int status);

}
