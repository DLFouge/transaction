package action.order;

import java.util.Properties;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import service.OrderService;
import util.PaymentUtil;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class PaymentAction extends ActionSupport
{

	private static final long serialVersionUID = 1L;
	private String p1_MerId; // 商户编号
	private String r0_Cmd; // 业务类型
	private String r1_Code;// 支付结果
	private String r2_TrxId;// 易宝支付流水账号
	private String r3_Amt;// 支付金额
	private String r4_Cur;// 支付币种
	private String r5_Pid;// 商品名称
	private String r6_Order;// 商户订单号
	private String r7_Uid;// 易宝会员支付id
	private String r8_MP;// 商户扩展信息
	private String r9_BType;// 交易结果返回类型
	private String hmac;// 根据以上十二个值加密值
	private String oid;// 订单号
	private String yh;// 支付通道
	private String code; //页面显示标志信息
	private String msg;//页面显示信息
	
	private OrderService orrderService;

	// 付款
 	public String payment() throws Exception
	{
		Properties pro = new Properties();
		pro.load(this.getClass().getClassLoader()
				.getResourceAsStream("Payment.properties"));
		/*
		 * 1.获取十三个参数
		 */

		String p0_Cmd = "Buy"; // 业务类型，固定值为"Buy"
		String p1_MerId = pro.getProperty("p1_MerId");// 商号编码，在易宝中唯一标识
		String p2_Order = this.oid;// 订单编号
		String p3_Amt = "0.01";// 支付金额
		String p4_Cur = "CNY";// 交易币种，固定值为"CNY"
		String p5_Pid = "";// 商品名称
		String p6_Pcat = "";// 商品种类
		String p7_Pdesc = "";// 商品描述
		String p8_Url = pro.getProperty("p8_Url");// 支付成功后，易宝会访问这个地址
		String p9_SAF = "";// 送货地址
		String pa_MP = "";// 扩展地址
		String pd_FrpId = this.yh;// 支付通道
		String pr_NeedResponse = "1";// 应答机制，固定值为"1"
		String keyValue = pro.getProperty("keyValue");// 电商密钥
		/*
		 * 2.根据以上十三个值计算hmac 还需要一个加密算法
		 */
		String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt,
				p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP,
				pd_FrpId, pr_NeedResponse, keyValue);

		/*
		 * 3.重定向到易宝
		 */

		StringBuffer buff = new StringBuffer(
				"https://www.yeepay.com/app-merchant-proxy/node");
		buff.append("?p0_Cmd=" + p0_Cmd).append("&p1_MerId=" + p1_MerId)
				.append("&p2_Order=" + p2_Order).append("&p3_Amt=" + p3_Amt)
				.append("&p4_Cur=" + p4_Cur).append("&p5_Pid=" + p5_Pid)
				.append("&p6_Pcat=" + p6_Pcat).append("&p7_Pdesc=" + p7_Pdesc)
				.append("&p8_Url=" + p8_Url).append("&p9_SAF=" + p9_SAF)
				.append("&pa_MP=" + pa_MP).append("&pd_FrpId=" + pd_FrpId)
				.append("&pr_NeedResponse=" + pr_NeedResponse)
				.append("&hmac=" + hmac);

		// 重定向到易宝
		HttpServletResponse response = ServletActionContext.getResponse();
		response.sendRedirect(buff.toString());

		return null;
	}

	// 从第三方平台返回访问的方法
	public String back() throws Exception
	{
		/*
		 * 2.获取keyValue
		 */
		Properties pro = new Properties();
		pro.load(this.getClass().getClassLoader()
				.getResourceAsStream("Payment.properties"));
		String keyValue = pro.getProperty("keyValue");
		/*
		 * 3.根据收到的十二个值和keyValue验证传过来的hmac的正确性
		 */
		boolean flag = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd,
				r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid, r6_Order,
				r7_Uid, r8_MP, r9_BType, keyValue);
		/*
		 * 4.验证flag的正确性，如果错误说明在传播的过程中受到他人的篡改
		 */
		if(!flag)
		{
			this.setCode("error");
			this.setMsg("你不是好人！");
			return Action.ERROR;
		}
		if(this.r1_Code.equals("1"))//这一步可以不要，因为此值为固定值为"1"
		{
			if(this.r9_BType.equals("1"))//这是易宝引导客服端浏览器的返回
			{
				this.orrderService.updateOrderStatus(this.r6_Order, 2);
				this.setCode("success");
				this.setMsg("恭喜付款成功！");
				return Action.SUCCESS;
			}else if(this.r9_BType.equals("2"))//这是易宝跟服务器的点对点访问
			{
				//两次都要更改用户商品状态的值，因为你不知道用户是否会按照易宝的引导去点链接
				this.orrderService.updateOrderStatus(this.r6_Order, 2);
				HttpServletResponse response = ServletActionContext.getResponse();
				//给易宝服务器发送成功，不然它会这一天给你发送消息
				response.getWriter().print("success");
			}
			
		}
		return null;
	}

	
	// setter and getter
	public String getOid()
	{
		return oid;
	}

	public OrderService getOrrderService()
	{
		return orrderService;
	}

	public void setOrrderService(OrderService orrderService)
	{
		this.orrderService = orrderService;
	}

	public String getCode()
	{
		return code;
	}

	public String getMsg()
	{
		return msg;
	}

	public void setCode(String code)
	{
		this.code = code;
	}

	public void setMsg(String msg)
	{
		this.msg = msg;
	}

	public String getP1_MerId()
	{
		return p1_MerId;
	}

	public String getR0_Cmd()
	{
		return r0_Cmd;
	}

	public String getR1_Code()
	{
		return r1_Code;
	}

	public String getR2_TrxId()
	{
		return r2_TrxId;
	}

	public String getR3_Amt()
	{
		return r3_Amt;
	}

	public String getR4_Cur()
	{
		return r4_Cur;
	}

	public String getR5_Pid()
	{
		return r5_Pid;
	}

	public String getR6_Order()
	{
		return r6_Order;
	}

	public String getR7_Uid()
	{
		return r7_Uid;
	}

	public String getR8_MP()
	{
		return r8_MP;
	}

	public String getR9_BType()
	{
		return r9_BType;
	}

	public String getHmac()
	{
		return hmac;
	}

	public void setP1_MerId(String p1_MerId)
	{
		this.p1_MerId = p1_MerId;
	}

	public void setR0_Cmd(String r0_Cmd)
	{
		this.r0_Cmd = r0_Cmd;
	}

	public void setR1_Code(String r1_Code)
	{
		this.r1_Code = r1_Code;
	}

	public void setR2_TrxId(String r2_TrxId)
	{
		this.r2_TrxId = r2_TrxId;
	}

	public void setR3_Amt(String r3_Amt)
	{
		this.r3_Amt = r3_Amt;
	}

	public void setR4_Cur(String r4_Cur)
	{
		this.r4_Cur = r4_Cur;
	}

	public void setR5_Pid(String r5_Pid)
	{
		this.r5_Pid = r5_Pid;
	}

	public void setR6_Order(String r6_Order)
	{
		this.r6_Order = r6_Order;
	}

	public void setR7_Uid(String r7_Uid)
	{
		this.r7_Uid = r7_Uid;
	}

	public void setR8_MP(String r8_MP)
	{
		this.r8_MP = r8_MP;
	}

	public void setR9_BType(String r9_BType)
	{
		this.r9_BType = r9_BType;
	}

	public void setHmac(String hmac)
	{
		this.hmac = hmac;
	}

	public String getYh()
	{
		return yh;
	}

	public void setYh(String yh)
	{
		this.yh = yh;
	}

	public void setOid(String oid)
	{
		this.oid = oid;
	}

}
