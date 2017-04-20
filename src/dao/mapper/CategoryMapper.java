package dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Category;

public interface CategoryMapper
{
	/*
	 * 查询出所有的分类
	 * return :
	 * 		系统所有一级分类以及二级分类
	 */
	public List<Category> findAllCategory();
	
	/*
	 * --------------------后台---------------------------------
	 */
	// 添加分类
	public void addCategory(@Param("cid") String cid,
			@Param("cname") String cname, @Param("pid") String pid,
			@Param("desc") String desc);

	// 修改父分类
	public void editCategory(@Param("cid") String cid,
			@Param("cname") String cname, @Param("desc") String desc);

	// 修改子分类
	public void editSubCategory(@Param("cid") String cid,
			@Param("cname") String cname, @Param("desc") String desc,
			@Param("pid") String pid);
	
	//查找该分类下的一级分类
	public int findSubCategory(@Param("cid") String cid);
	
	//删除分类
	public void deleteCategory(@Param("cid") String cid);
	
	//查找二级分类
	public Category selectSubCategory(@Param("cid") String cid);
	

}
