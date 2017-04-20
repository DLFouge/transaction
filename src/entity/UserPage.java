package entity;

import java.util.List;

public class UserPage
{
	private int currentPage;//当前页码
	private int totalPage;//总页码
	private int totalRecord;//总记录数
	private List<User> list; //用户集
	private String url;//数字所需要的action地址，保证每次点击数字都是调用相同的方法
	
	
	public int getCurrentPage()
	{
		return currentPage;
	}
	public int getTotalPage()
	{
		return totalPage;
	}
	public int getTotalRecord()
	{
		return totalRecord;
	}
	public List<User> getList()
	{
		return list;
	}
	public String getUrl()
	{
		return url;
	}
	public void setCurrentPage(int currentPage)
	{
		this.currentPage = currentPage;
	}
	public void setTotalPage(int totalPage)
	{
		this.totalPage = totalPage;
	}
	public void setTotalRecord(int totalRecord)
	{
		this.totalRecord = totalRecord;
	}
	public void setList(List<User> list)
	{
		this.list = list;
	}
	public void setUrl(String url)
	{
		this.url = url;
	}
	
}
