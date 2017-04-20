package action.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import service.CategoryService;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import entity.Category;

public class SelectCategory extends ActionSupport
{
	private List<Category> category;
	
	@Autowired
	private CategoryService categoryService;
	
	//查询所有分类
	public String findAllCategory() throws Exception
	{
		category = categoryService.findAllCategory();
		return Action.SUCCESS;
	}
	

 	public List<Category> getCategory()
	{
		return category;
	}

	public void setCategory(List<Category> category)
	{
		this.category = category;
	}

	
	
	

}
