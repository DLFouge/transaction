package action.order;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import service.CartService;
import service.OrderService;
import util.UuidUtil;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import entity.AllCartItem;
import entity.CartItem;
import entity.ConstanceValue;
import entity.GoodsPage;
import entity.Order;
import entity.OrderItem;
import entity.User;

public class OrderAction extends ActionSupport
{

	private static final long serialVersionUID = 1L;
	private List<String> list; // 用户想买的购物项id
	private Order order; // 订单项
	private String address; // 用户地址
	private String oid;// 订单号
	private double total;// 订单总价
	private int pageCode = 1;// 页面当前页码,默认为1
	private String btn;// 取消或则
	private int status;// 订单状态

	private GoodsPage<Order> pagingDate;// 订单分页所需数据

	@Autowired
	private CartService cartService;// 购物车服务
	@Autowired
	private OrderService orderService;// 订单服务

	// 创建订单
	public String createOrder() throws Exception
	{
		/*
		 * 1.创建订单
		 */
		// 创建订单id
		String id = UuidUtil.uuid();
		// 创建订单时间
		String orderTime = String.format("%tF %<tT", new Date());

		// 跨模块，先查询出所有购物项，再计算其总计
		// 先拿出该用户id
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("user");
		// 查询出改用户想买的购物项生成订单

		AllCartItem cartItem = cartService.submitGoodsItem(list, user.getUid());

		// 生成订单
		order = new Order();
		order.setOrderId(id);// 设置主键
		order.setOrderTime(orderTime);// 设置订单时间
		order.setTotal(Double.valueOf(cartItem.allCartItemMoney()));// 设置订单总计
		order.setStatus(1);// 设置订单状态 1为默认状态机未付款
		order.setAddress(address);// 设置订单地址

		order.setUser(user);// 设置订单所有者
		orderService.addOrder(order);

		/*
		 * 2.创建订单下的订单项
		 */
		// 根据AllCartItem添加订单项
		List<OrderItem> orderItemList = new LinkedList<OrderItem>();// 生成订单项
		for (CartItem item : cartItem.getList())
		{
			// 设置订单属性
			OrderItem orderItem = new OrderItem();
			orderItem.setOrderItemId(UuidUtil.uuid());
			orderItem.setQuantity(item.getQuantity());
			orderItem.setSubtotal(Double.valueOf(item.totalMoney() + ""));
			orderItem.setGoods(item.getGood());
			orderItem.setOrder(order);
			orderItemList.add(orderItem);
		}
		// 将所有订单项添加到一个订单中
		order.setList(orderItemList);
		// 生成订单项
		orderService.addOrderItem(orderItemList);

		return Action.SUCCESS;
	}

	// 根据用户id查询用户所有订单
	public String selectAllOrder() throws Exception
	{
		// 生成pagingDate对象
		pagingDate = new GoodsPage<Order>();

		/*
		 * 1.拿出用户id
		 */
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("user");
		String uid = user.getUid();

		/*
		 * 2.根据用户id查询出总订单数
		 */
		int allTotalNumber = orderService.selectAllOrder(uid);
		pagingDate.setTotalRecord(allTotalNumber);
		/*
		 * 3.设置总页码
		 */
		int allPageNumber = 0;// 总的页数
		int eachPageNumber = ConstanceValue.PAGE_ORDER_NUMBER; // 每一页的商品数
		if (allTotalNumber % eachPageNumber == 0)
		{
			allPageNumber = allTotalNumber / eachPageNumber;
		} else
		{
			allPageNumber = allTotalNumber / eachPageNumber + 1;
		}
		pagingDate.setTotalPage(allPageNumber);
		/*
		 * 4.设置当前页码
		 */
		pagingDate.setCurrentPage(this.pageCode);
		/*
		 * 5.设置订单内容
		 */
		pagingDate.setList(orderService.selectAllOrder(uid, (pageCode - 1)
				* eachPageNumber, eachPageNumber));

		/*
		 * 6.设置url
		 */
		HttpServletRequest request = ServletActionContext.getRequest();
		StringBuffer url = request.getRequestURL();
		// 设置按一个查询方式进行查询
		url.append("?cid=" + "");
		pagingDate.setUrl(url.toString());
		return Action.SUCCESS;
	}

	// 根据订单号查询出订单
	public String selectOrderByOid() throws Exception
	{
		order = orderService.selectOrderByOid(oid);
		return Action.SUCCESS;
	}

	// 查询订单总价
	public String selectTotal() throws Exception
	{
		order = orderService.selectOrderByOid(oid);
		this.setTotal(order.getTotal());
		return Action.SUCCESS;
	}

	// 根据订单号和用户id取消用户订单
	public String deleteOrderByOidAndUId() throws Exception
	{
		/*
		 * 1.拿出用户id
		 */
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("user");
		String uid = user.getUid();
		orderService.deleteOrderByOidAndUid(oid, uid);

		/*
		 * 2.返回用户所有订单信息
		 */
		return this.selectAllOrder();
	}

	// 更新用户订单状态
	public String updateOrderStatus() throws Exception
	{
		orderService.updateOrderStatus(oid, status);
		return this.selectAllOrder();
	}

	// 根据订单状态查询订单
	public String selectByStatus() throws Exception
	{
		// 生成pagingDate对象
		pagingDate = new GoodsPage<Order>();

		/*
		 * 1.拿出用户id
		 */
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("user");
		String uid = user.getUid();

		/*
		 * 2.根据用户id和订单状态查询出总订单数
		 */
		int allTotalNumber = orderService.selectAllByStatus(uid, status);
		pagingDate.setTotalRecord(allTotalNumber);
		/*
		 * 3.设置总页码
		 */
		int allPageNumber = 0;// 总的页数
		int eachPageNumber = ConstanceValue.PAGE_ORDER_NUMBER; // 每一页的商品数
		if (allTotalNumber % eachPageNumber == 0)
		{
			allPageNumber = allTotalNumber / eachPageNumber;
		} else
		{
			allPageNumber = allTotalNumber / eachPageNumber + 1;
		}
		pagingDate.setTotalPage(allPageNumber);
		/*
		 * 4.设置当前页码
		 */
		pagingDate.setCurrentPage(this.pageCode);
		/*
		 * 5.设置订单内容
		 */
		pagingDate.setList(orderService.selectByStatus(uid, status,
				(pageCode - 1) * eachPageNumber, eachPageNumber));

		/*
		 * 6.设置url
		 */
		HttpServletRequest request = ServletActionContext.getRequest();
		StringBuffer url = request.getRequestURL();
		// 设置按一个查询方式进行查询
		url.append("?status=" + this.status);
		pagingDate.setUrl(url.toString());
		return Action.SUCCESS;
	}

	// setter and getter

	public List<String> getList()
	{
		return list;
	}

	public int getStatus()
	{
		return status;
	}

	public void setStatus(int status)
	{
		this.status = status;
	}

	public String getBtn()
	{
		return btn;
	}

	public void setBtn(String btn)
	{
		this.btn = btn;
	}

	public int getPageCode()
	{
		return pageCode;
	}

	public void setPageCode(int pageCode)
	{
		this.pageCode = pageCode;
	}

	public GoodsPage<Order> getPagingDate()
	{
		return pagingDate;
	}

	public void setPagingDate(GoodsPage<Order> pagingDate)
	{
		this.pagingDate = pagingDate;
	}

	public String getOid()
	{
		return oid;
	}

	public void setOid(String oid)
	{
		this.oid = oid;
	}

	public double getTotal()
	{
		return total;
	}

	public void setTotal(double total)
	{
		this.total = total;
	}

	public OrderService getOrderService()
	{
		return orderService;
	}

	public void setOrderService(OrderService orderService)
	{
		this.orderService = orderService;
	}

	public String getAddress()
	{
		return address;
	}

	public void setAddress(String address)
	{
		this.address = address;
	}

	public Order getOrder()
	{
		return order;
	}

	public CartService getCartService()
	{
		return cartService;
	}

	public void setOrder(Order order)
	{
		this.order = order;
	}

	public void setCartService(CartService cartService)
	{
		this.cartService = cartService;
	}

	public void setList(List<String> list)
	{
		this.list = list;
	}

}
