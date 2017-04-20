package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import service.GoodsService;
import dao.mapper.GoodsMapper;
import entity.Goods;

public class GoodsServiceImpl implements GoodsService {
	
	@Autowired
	private GoodsMapper goodsMapper;
	
	@Override
	public Goods selectById(String goodsId) {
		Goods goods = new Goods();
		goods = goodsMapper.selectById(goodsId);
		return goods;
	}

	@Override
	public Goods selectByName(String goodsName) {
		Goods goods = new Goods();
		goods = goodsMapper.selectByName(goodsName);
		return goods;
	}

	@Override
	public boolean addGoods(Goods goods) {
		int row = goodsMapper.addGoods(goods);
		return row==1;
	}

	@Override
	public List<Goods> selectAllAddGoods(String useId) {
		List<Goods> goodsList = goodsMapper.selectAllAddGoods(useId);
		
		return goodsList;
	}

	@Override
	public boolean deleteGoods(String goodsId) {
		int row = goodsMapper.deleteGoods(goodsId);
		return row==1;
	}
}
