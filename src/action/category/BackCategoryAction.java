package action.category;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import service.CategoryService;
import util.UuidUtil;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import entity.Category;

public class BackCategoryAction extends ActionSupport
{
	private String cid;//分类id
	private String cname;//分类名称
	private String desc;//分类描述
	private String pid;//父分类
	
	@Autowired
	private CategoryService categoryService;
	
	private List<Category> list;
	private Category category;
	
	private String msg;//页面错误消息显示
	
	//查询所有分类
	public String findAllCategory() throws Exception
	{
		list = categoryService.findAllCategory();
		return Action.SUCCESS;
	}
	//添加分类
	public String addCategory() throws Exception
	{
		String cid = UuidUtil.uuid();
		this.categoryService.addCategory(cid, cname, pid, desc);
		
		return this.findAllCategory();
	}
	//修改父分类
	public String editFirstCategory() throws Exception
	{
		this.categoryService.editCategory(cid, cname, desc);
		return this.findAllCategory();
	}
	//修改子分类
	public String editSubCategory() throws Exception
	{
		this.categoryService.editSubCategory(cid, cname, desc, pid);
		return this.findAllCategory();
	}
	
	//查询某一分类下的所有二级分类
	public String ajaxFindSubCategory() throws Exception
	{
		category = this.categoryService.selectSubCategory(cid);
		String json = this.toJson(category.getChilds());
		HttpServletResponse response = ServletActionContext.getResponse();
		response.getWriter().write(json);
		return null;
	}
	//将Category对象得到一个Json对象{"cid":"sdfsad","cname":"dsfsa"}
	private String toJson(Category category)
	{
		StringBuilder sb = new StringBuilder("{");
		
		sb.append("\"cid\":").append("\""+category.getCategoryId()+"\"");
		sb.append(",");
		sb.append("\"cname\":").append("\""+category.getCategoryName()+"\"");
		
		sb.append("}");
		return sb.toString();
	}
	//循环list得到一个json对象[{"cid":"sdfsad","cname":"dsfsa"},{"cid":"sdfsad","cname":"dsfsa"}]
	private String toJson(List<Category> list)
	{
		StringBuilder sb = new StringBuilder("[");
		for(int i = 0; i <list.size(); i++)
		{
			sb.append(toJson(list.get(i)));
			if(i < list.size()-1)
			{
				sb.append(",");
			}
		}
		sb.append("]");
		return sb.toString();
	}
	//删除一级分类
	public String deleteCategory() throws Exception
	{
		//删除成功
		if(this.categoryService.deleteFirstCategory(cid))
		{
			return this.findAllCategory();
		}
		//删除失败
		else
		{
			this.setMsg("错误！该一级分类下还有二级分类,请先删除二级分类！");
			return Action.ERROR;
		}
		
	}
	
	//删除二级分类
	public String deleteSecondCategory() throws Exception
	{
		if(this.categoryService.deleteSecondCategory(cid))
		{
			return this.findAllCategory();
		}
		else 
		{
			this.setMsg("错误！改二级分类下还有图书，请先删除图书！");
			return Action.ERROR;
		}
	}

	//setter and getter
	
	
	public CategoryService getCategoryService()
	{
		return categoryService;
	}

	public Category getCategory()
	{
		return category;
	}
	public void setCategory(Category category)
	{
		this.category = category;
	}
	public String getMsg()
	{
		return msg;
	}
	public void setMsg(String msg)
	{
		this.msg = msg;
	}
	public String getCid()
	{
		return cid;
	}
	public void setCid(String cid)
	{
		this.cid = cid;
	}
	public String getPid()
	{
		return pid;
	}
	public void setPid(String pid)
	{
		this.pid = pid;
	}
	public String getCname()
	{
		return cname;
	}

	public String getDesc()
	{
		return desc;
	}

	public void setCname(String cname)
	{
		this.cname = cname;
	}

	public void setDesc(String desc)
	{
		this.desc = desc;
	}

	public List<Category> getList()
	{
		return list;
	}

	public void setCategoryService(CategoryService categoryService)
	{
		this.categoryService = categoryService;
	}

	public void setList(List<Category> list)
	{
		this.list = list;
	}
	
	
}
