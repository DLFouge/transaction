package interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.Interceptor;

import entity.User;

public class LoginInterceptor extends ActionSupport implements Interceptor 
{

	private String code; //页面对错显示
	private String msg;//页面错误信息显示
	@Override
	public void destroy()
	{
		// TODO Auto-generated method stub

	}

	@Override
	public void init()
	{
		// TODO Auto-generated method stub

	}

	@Override
	public String intercept(ActionInvocation arg0) throws Exception
	{
        Map<String,Object> session = arg0.getInvocationContext().getSession();
        User user = (User)session.get("user");
        if(user != null)
        {
        	return arg0.invoke();
        }
        else 
        {
        	HttpServletRequest request = ServletActionContext.getRequest();
        	request.setAttribute("code", "error");
        	request.setAttribute("msg", "您还未登录，请先登录！");
        	return "msg";
        }
		
	}

	//setter and getter 
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
	
}
