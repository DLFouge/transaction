package entity;

import java.util.List;

public class Category
{
	private String categoryId; //分类id
	private String categoryName; //分类名字
	
	private String pid;   //二级分类所属一级分类id
	private String describe;  //分类描述
	private List<Category> childs;//一级分类下所有二级分类
	
	//setter and getter 方法
	public String getCategoryId()
	{
		return categoryId;
	}
	public String getCategoryName()
	{
		return categoryName;
	}
	public String getPid()
	{
		return pid;
	}
	public String getDescribe()
	{
		return describe;
	}
	public List<Category> getChilds()
	{
		return childs;
	}
	public void setCategoryId(String categoryId)
	{
		this.categoryId = categoryId;
	}
	public void setCategoryName(String categoryName)
	{
		this.categoryName = categoryName;
	}
	public void setPid(String pid)
	{
		this.pid = pid;
	}
	public void setDescribe(String describe)
	{
		this.describe = describe;
	}
	public void setChilds(List<Category> childs)
	{
		this.childs = childs;
	}
	
	
	

}
