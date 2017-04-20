package action.user;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class ExitAction extends ActionSupport
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String exit() throws Exception
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.invalidate();
		return Action.SUCCESS;
	}

}
