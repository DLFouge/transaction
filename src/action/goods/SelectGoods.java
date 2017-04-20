package action.goods;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import service.CategoryService;
import service.GoodService;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import entity.Category;
import entity.ConstanceValue;
import entity.Goods;
import entity.GoodsPage;
import entity.OrderItem;
import entity.User;

public class SelectGoods extends ActionSupport
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int pageCode;// 当前页码
	private String categoryId;// 当前查询分类id
	private GoodsPage<Goods> pagingDate; // 分页所需数据
	private List<Category> category; // 所有分类

	private String thedegree;// 新旧程度
	private int price1;
	private int price2;
	private String orderItemId; //订单子项id
	
	private int status;//是否付款
	private int send;//是否发货
	private String btn; //发货标志
	
	private GoodsPage<OrderItem> page;//订单项分页
	private String goodsName; //书名

	@Autowired
	private GoodService goodService;

	@Autowired
	private CategoryService categoryService;

	private void defaultPageCode()
	{
		if (this.getPageCode() == 0) // 设置默认的页面为第一页
		{
			this.setPageCode(1);
		}

	}

	// 按分类查询出物品
	public String selectByCid() throws Exception
	{
		// 设置所有分类
		this.category = categoryService.findAllCategory();
		/*
		 * 1.设置页码，判断当前页是否为第一页
		 */
		this.defaultPageCode();
		/*
		 * 2.查询出当前类所限定的商品(0-11或者是12-23)
		 */
		int pageGoodsNumber = ConstanceValue.PAGE_GOODS_NUMBER;// 页面商品显示个数
		pagingDate = goodService.selectByCid(categoryId, (pageCode - 1)
				* pageGoodsNumber, pageGoodsNumber);
		/*
		 * 3.设置当前页码
		 */
		pagingDate.setCurrentPage(this.getPageCode());
		/*
		 * 4.查询出这类商品的总数
		 */
		int totalGoods = goodService.selectBycid(categoryId);
		/*
		 * 5.设置总页码
		 */
		int totalPage;
		if (totalGoods % pageGoodsNumber != 0)
		{
			totalPage = totalGoods / pageGoodsNumber + 1;
		} else
		{
			totalPage = totalGoods / pageGoodsNumber;
		}
		pagingDate.setTotalPage(totalPage);
		/*
		 * 6.获取访问地址，让页面的数字跳转访问同一个action
		 */
		HttpServletRequest request = ServletActionContext.getRequest();
		StringBuffer url = request.getRequestURL();
		// 设置按一个查询方式进行查询
		url.append("?categoryId=" + this.getCategoryId());
		pagingDate.setUrl(url.toString());

		return Action.SUCCESS;
	}
	
	//根据书名模糊查询
	
	public String selectByLike() throws Exception
	{
		// 设置所有分类
		this.category = categoryService.findAllCategory();
		/*
		 * 1.设置页码，判断当前页是否为第一页
		 */
		this.defaultPageCode();
		/*
		 * 2.查询出当前类所限定的商品(0-11或者是12-23)
		 */
		int pageGoodsNumber = ConstanceValue.PAGE_GOODS_NUMBER;// 页面商品显示个数
		pagingDate = goodService.selectByLike(goodsName, (pageCode - 1)
				* pageGoodsNumber, pageGoodsNumber);
		/*
		 * 3.设置当前页码
		 */
		pagingDate.setCurrentPage(this.getPageCode());
		/*
		 * 4.查询出这类商品的总数
		 */
		int totalGoods = goodService.selectAllByLike(goodsName);
		/*
		 * 5.设置总页码
		 */
		int totalPage;
		if (totalGoods % pageGoodsNumber != 0)
		{
			totalPage = totalGoods / pageGoodsNumber + 1;
		} else
		{
			totalPage = totalGoods / pageGoodsNumber;
		}
		pagingDate.setTotalPage(totalPage);
		/*
		 * 6.获取访问地址，让页面的数字跳转访问同一个action
		 */
		HttpServletRequest request = ServletActionContext.getRequest();
		StringBuffer url = request.getRequestURL();
		// 设置按一个查询方式进行查询
		url.append("?goodsName=" + this.getGoodsName());
		pagingDate.setUrl(url.toString());

		return Action.SUCCESS;
	}

	// 根据商品的新旧程度进行查找
	public String selectByDegree() throws Exception
	{
		// 设置所有分类
		this.category = categoryService.findAllCategory();
		/*
		 * 1.设置页码，判断当前页是否为第一页
		 */
		this.defaultPageCode();
		/*
		 * 2.查询出当前类所限定的商品(0-11或者是12-23)
		 */
		int pageGoodsNumber = ConstanceValue.PAGE_GOODS_NUMBER;// 页面商品显示个数

		pagingDate = goodService.selectByDegree(this.getThedegree(),
				(pageCode - 1) * pageGoodsNumber, pageGoodsNumber);
		/*
		 * 3.设置当前页码
		 */
		pagingDate.setCurrentPage(this.getPageCode());
		/*
		 * 4.查询出这类商品的总数
		 */
		int totalGoods = goodService.selectByDegree(this.thedegree);
		/*
		 * 5.设置总页码
		 */
		int totalPage;
		if (totalGoods % pageGoodsNumber != 0)
		{
			totalPage = totalGoods / pageGoodsNumber + 1;
		} else
		{
			totalPage = totalGoods / pageGoodsNumber;
		}
		pagingDate.setTotalPage(totalPage);
		/*
		 * 6.获取访问地址，让页面的数字跳转访问同一个action
		 */
		HttpServletRequest request = ServletActionContext.getRequest();
		StringBuffer url = request.getRequestURL();
		// 设置按一个查询方式进行查询
		url.append("?thedegree=" + this.getThedegree());
		pagingDate.setUrl(url.toString());

		return Action.SUCCESS;
	}

	// 按商品价格查询
	public String selectByPrice() throws Exception
	{
		// 设置所有分类
		this.category = categoryService.findAllCategory();
		/*
		 * 1.设置页码，判断当前页是否为第一页
		 */
		this.defaultPageCode();
		/*
		 * 2.查询出当前类所限定的商品(0-11或者是12-23)
		 */
		int pageGoodsNumber = ConstanceValue.PAGE_GOODS_NUMBER;// 页面商品显示个数

		pagingDate = goodService.selectByPrice(price1, price2, (pageCode - 1)
				* pageGoodsNumber, pageGoodsNumber);
		/*
		 * 3.设置当前页码
		 */
		pagingDate.setCurrentPage(this.getPageCode());
		/*
		 * 4.查询出这类商品的总数
		 */
		int totalGoods = goodService.selectAllByPrice(price1, price2);
		/*
		 * 5.设置总页码
		 */
		int totalPage;
		if (totalGoods % pageGoodsNumber != 0)
		{
			totalPage = totalGoods / pageGoodsNumber + 1;
		} else
		{
			totalPage = totalGoods / pageGoodsNumber;
		}
		pagingDate.setTotalPage(totalPage);
		/*
		 * 6.获取访问地址，让页面的数字跳转访问同一个action
		 */
		HttpServletRequest request = ServletActionContext.getRequest();
		StringBuffer url = request.getRequestURL();
		// 设置按一个查询方式进行查询
		url.append("?price1=" + this.getPrice1() + "&price2="
				+ this.getPrice2());
		pagingDate.setUrl(url.toString());

		return Action.SUCCESS;
	}

	// 按商品价格查询
	public String selectAllGoodByUid() throws Exception
	{

		/*
		 * 1.设置页码，判断当前页是否为第一页
		 */
		this.defaultPageCode();
		/*
		 * 2.查询出当前类所限定的商品(0-11或者是12-23)
		 */
		int pageGoodsNumber = ConstanceValue.PAGE_USER_UPLOAD_NUMBER;// 页面商品显示个数
		User user = (User) (ServletActionContext.getRequest().getSession()
				.getAttribute("user"));
		pagingDate = goodService.selectByUid(user.getUid(), (pageCode - 1)
				* pageGoodsNumber, pageGoodsNumber);
		/*
		 * 3.设置当前页码
		 */
		pagingDate.setCurrentPage(this.getPageCode());
		/*
		 * 4.查询出这类商品的总数
		 */
		int totalGoods = goodService.countByUid(user.getUid());
		/*
		 * 5.设置总页码
		 */
		int totalPage;
		if (totalGoods % pageGoodsNumber != 0)
		{
			totalPage = totalGoods / pageGoodsNumber + 1;
		} else
		{
			totalPage = totalGoods / pageGoodsNumber;
		}
		pagingDate.setTotalPage(totalPage);
		/*
		 * 6.获取访问地址，让页面的数字跳转访问同一个action
		 */
		HttpServletRequest request = ServletActionContext.getRequest();
		StringBuffer url = request.getRequestURL();
		// 设置按一个查询方式进行查询
		url.append("?price1=" + "");
		pagingDate.setUrl(url.toString());

		return Action.SUCCESS;
	}
	
	//根据支付状态查询商品
	public String payStatus() throws Exception
	{
		/*
		 * 1.设置页码，判断当前页是否为第一页
		 */
		this.defaultPageCode();
		/*
		 * 2.查询出当前类所限定的商品(0-11或者是12-23)
		 */
		int pageGoodsNumber = ConstanceValue.PAGE_USER_UPLOAD_NUMBER;// 页面商品显示个数
		User user = (User) (ServletActionContext.getRequest().getSession()
				.getAttribute("user"));
		
		//改
		page = goodService.selectByStatus(user.getUid(), status, send,(pageCode - 1)
				* pageGoodsNumber, pageGoodsNumber);
		/*
		 * 3.设置当前页码
		 */
		page.setCurrentPage(this.getPageCode());
		/*
		 * 4.查询出这类商品的总数
		 */
		
		//改
		int totalGoods = goodService.countByStatus(user.getUid(), status, send);
		/*
		 * 5.设置总页码
		 */
		int totalPage;
		if (totalGoods % pageGoodsNumber != 0)
		{
			totalPage = totalGoods / pageGoodsNumber + 1;
		} else
		{
			totalPage = totalGoods / pageGoodsNumber;
		}
		page.setTotalPage(totalPage);
		/*
		 * 6.获取访问地址，让页面的数字跳转访问同一个action
		 */
		HttpServletRequest request = ServletActionContext.getRequest();
		StringBuffer url = request.getRequestURL();
		// 设置按一个查询方式进行查询
		url.append("?status=" + status +"&send="+ send);
		page.setUrl(url.toString());

		return Action.SUCCESS;
	}

	//更改发货状态
	public String updateStatus() throws Exception
	{
		goodService.updateStatus(orderItemId);
		this.setSend(0);
		this.setStatus(2);
		this.setBtn("out");
		this.payStatus();
		return Action.SUCCESS;
	}
	public int getPrice1()
	{
		return price1;
	}

	public void setPrice1(int price1)
	{
		this.price1 = price1;
	}

	public int getPrice2()
	{
		return price2;
	}

	public void setPrice2(int price2)
	{
		this.price2 = price2;
	}

	public int getPageCode()
	{
		return pageCode;
	}

	public String getCategoryId()
	{
		return categoryId;
	}

	public GoodsPage<Goods> getPagingDate()
	{
		return pagingDate;
	}

	public void setPageCode(int pageCode)
	{
		this.pageCode = pageCode;
	}

	public void setCategoryId(String categoryId)
	{
		this.categoryId = categoryId;
	}

	public void setPagingDate(GoodsPage<Goods> pagingDate)
	{
		this.pagingDate = pagingDate;
	}

	public List<Category> getCategory()
	{
		return category;
	}

	public void setCategory(List<Category> category)
	{
		this.category = category;
	}

	public String getThedegree()
	{
		return thedegree;
	}

	public void setThedegree(String thedegree)
	{
		this.thedegree = thedegree;
	}

	public int getStatus()
	{
		return status;
	}

	public int getSend()
	{
		return send;
	}

	public GoodsPage<OrderItem> getPage()
	{
		return page;
	}

	public void setStatus(int status)
	{
		this.status = status;
	}

	public void setSend(int send)
	{
		this.send = send;
	}

	public void setPage(GoodsPage<OrderItem> page)
	{
		this.page = page;
	}

	
	public String getBtn()
	{
		return btn;
	}

	public void setBtn(String btn)
	{
		this.btn = btn;
	}

	public String getOrderItemId()
	{
		return orderItemId;
	}

	public void setOrderItemId(String orderItemId)
	{
		this.orderItemId = orderItemId;
	}

	public String getGoodsName()
	{
		return goodsName;
	}

	public void setGoodsName(String goodsName)
	{
		this.goodsName = goodsName;
	}

	
	
	
}
