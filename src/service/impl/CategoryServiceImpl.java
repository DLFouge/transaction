package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import service.CategoryService;
import dao.mapper.CategoryMapper;
import dao.mapper.GoodMapper;
import entity.Category;

public class CategoryServiceImpl implements CategoryService
{
	@Autowired
	private CategoryMapper categoryMapper;
	
	@Autowired
	private GoodMapper goodMapper;
	@Override
	public List<Category> findAllCategory()
	{
		List<Category> list = categoryMapper.findAllCategory();
		return list;
	}
	
	@Override
	public void addCategory(String cid, String cname, String pid, String desc)
	{
		categoryMapper.addCategory(cid, cname, pid, desc);
	}
	//修改分类
	@Override
	public void editCategory(String cid, String cname, String desc)
	{
		categoryMapper.editCategory(cid, cname, desc);
		
	}
	//修改子分类
	@Override
	public void editSubCategory(String cid, String cname, String desc,
			String pid)
	{
		categoryMapper.editSubCategory(cid, cname, desc, pid);
		
	}
	
	//删除一级分类
	@Override
	public boolean deleteFirstCategory(String cid)
	{
		//判断该一级分类中是否含有二级分类
		int  flag = this.categoryMapper.findSubCategory(cid);
		//如果没有则删除
		if(flag == 0)
		{
			this.categoryMapper.deleteCategory(cid);
			return true;
		}
		//如果有则不删除
		else
		{
			return false;
		}
	}
	
	//删除二级分类
	@Override
	public boolean deleteSecondCategory(String cid)
	{
		//查看该二级分类下是否商品
		int flag = goodMapper.selectAllByCid(cid);
		//如果没有则删除该二级分类
		if(flag == 0 )
		{
			this.categoryMapper.deleteCategory(cid);
			return true;
			
		}
		//有则返回false
		else
		{
			return false;
		}
		
	}
	
	//查询一级分类中的所有二级分类
	public Category selectSubCategory(String cid)
	{
		Category category = this.categoryMapper.selectSubCategory(cid);
		return category;
	}


}
