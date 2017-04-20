package service;

import java.util.List;

import entity.Category;

public interface CategoryService
{
	/*
	 * 查找所有的分类
	 * 	return :
	 * 		系统所有分类
	 */
	public List<Category> findAllCategory();
	
	/*
	 * 添加分类
	 * param : 
	 * 		cid : 分类id
	 * 		cname : 分类名称
	 * 		desc : 分类描述
	 */
	public void addCategory(String cid,String cname,String pid,String desc);
		
	/*
	* 修改父分类
	* param :
	* 	cid : 分类id
    * 	cname : 分类名称
	* 	desc : 分类名称
	*/
	public void editCategory(String cid,String cname,String desc);
		
	/*
	 * 修改子分类
	 * param　: 
	 * 		cid : 分类id
	 * 		cname : 分类名称
	 * 		desc : 分类描述
	 * 		pid : 一级分类id
	 * 		
	 */
	public void editSubCategory(String cid,String cname,String desc,String pid);
		
	/*
	 * 删除一级分类
	 * param : 
	 * 		cid : 分类id
	 */
	public boolean deleteFirstCategory(String cid);
		
	/*
	 * 删除二级分类
	 * param : 
	 * 		cid : 二级分类id
	 */
	public boolean deleteSecondCategory(String cid);
		
	/*
	 * 查询某个一级分类中的所有二级分类
	 * param : 
	 * 		cid : 一级分类id
	 */
	public Category selectSubCategory(String cid);

}
