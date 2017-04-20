package action.good;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import service.GoodsService;
import entity.Goods;

public class SelectAllAddGoods {
	@Autowired
	private GoodsService goodsService;
	
	private List<Goods> goodsList;
	
	public String selectAllAddGoods(){
		//String userId = ((User)ServletActionContext.getRequest().getSession().getAttribute("user")).getUid();
		goodsList = goodsService.selectAllAddGoods("q");
		if(goodsList!=null){
			return "success";
		}else{
			return "fail";
		}
	}

	public GoodsService getGoodsService() {
		return goodsService;
	}

	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}

	public List<Goods> getGoodsList() {
		return goodsList;
	}

	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}
	
	
}
