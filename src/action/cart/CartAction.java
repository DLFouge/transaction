package action.cart;

import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import service.CartService;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import entity.AllCartItem;
import entity.CartItem;
import entity.User;

public class CartAction extends ActionSupport
{
	private AllCartItem allCartItem; // 用户购物车
	private String goodsId;// 商品id
	private int quantity;// 商品数量
	private String singalCartId; // 加减操作时的单个购物项

	private List<String> cartId; // 实行批量删除的购物id

	@Autowired
	private CartService cartService;

	// 查询出用户所有购物
	public String cartItems() throws Exception
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("user");
		allCartItem = cartService.selectByUId(user.getUid());
		allCartItem.setUser(user);
		return Action.SUCCESS;
	}

	// 用户添加购物
	public String addCartItem() throws Exception
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("user");
		allCartItem = cartService.addCartItem(user.getUid(), quantity,goodsId );
		return Action.SUCCESS;
	}

	// 实现批量删除购物车项
	public String deleteCartItem() throws Exception
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("user");
		
		allCartItem = cartService.deleteCartItem(user.getUid(), cartId);
		return Action.SUCCESS;
	}

	// ajax对商品进行异步的加减操作
	public String ajaxJiaAndJian() throws Exception
	{
		// 获取到更新项
		CartItem cartItem = cartService.ajaxJiaAndJian(singalCartId, quantity);

		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter out = response.getWriter();
		// 以json格式返回
		out.write("{\"quantity\"" + ":" + cartItem.getQuantity() + "}");
		return null;
	}

	// 用户提交表单
	public String submitGoodsItem() throws Exception
	{
		// 获取当前用户
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("user");
		// 提供当前用户所想买的购物项id
		System.out.println(cartId.size());
		allCartItem = cartService.submitGoodsItem(cartId, user.getUid());
		return Action.SUCCESS;
	}

	// setter and getter

	public AllCartItem getAllCartItem()
	{
		return allCartItem;
	}

	public String getSingalCartId()
	{
		return singalCartId;
	}

	public void setSingalCartId(String singalCartId)
	{
		this.singalCartId = singalCartId;
	}

	public List<String> getCartId()
	{
		return cartId;
	}

	public void setCartId(List<String> cartId)
	{
		this.cartId = cartId;
	}

	public String getGoodsId()
	{
		return goodsId;
	}

	public void setGoodsId(String goodsId)
	{
		this.goodsId = goodsId;
	}

	public int getQuantity()
	{
		return quantity;
	}

	public void setQuantity(int quantity)
	{
		this.quantity = quantity;
	}

	public CartService getCartService()
	{
		return cartService;
	}

	public void setAllCartItem(AllCartItem allCartItem)
	{
		this.allCartItem = allCartItem;
	}

	public void setCartService(CartService cartService)
	{
		this.cartService = cartService;
	}
}
