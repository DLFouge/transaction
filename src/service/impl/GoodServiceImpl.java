package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import dao.mapper.GoodMapper;
import entity.Goods;
import entity.GoodsPage;
import entity.OrderItem;

public class GoodServiceImpl implements service.GoodService
{

	@Autowired
	private GoodMapper goodMapper;

	private GoodsPage<Goods> goodsPage = new GoodsPage<Goods>();

	private List<Goods> list;

	@Override
	public GoodsPage<Goods> selectByCid(String cid, int pageCode,
			int limitNumber)
	{
		list = goodMapper.selectByCid(cid, pageCode, limitNumber);
		goodsPage.setList(list);
		return goodsPage;
	}

	@Override
	public int selectBycid(String cid)
	{
		return goodMapper.selectAllByCid(cid);
	}

	@Override
	public GoodsPage<Goods> selectByDegree(String degree, int pageCode,
			int limitNumber)
	{
		list = goodMapper.selectByDegree(degree, pageCode, limitNumber);
		goodsPage.setList(list);
		return goodsPage;
	}

	@Override
	public int selectByDegree(String degree)
	{
		return goodMapper.selectAllByDegree(degree);
	}

	@Override
	public GoodsPage<Goods> selectByPrice(int price1, int price2, int pageCode,
			int limitNumber)
	{
		list = goodMapper.selectByPrice(price1, price2, pageCode, limitNumber);
		goodsPage.setList(list);
		return goodsPage;
	}

	@Override
	public int selectAllByPrice(int price1, int price2)
	{
		return goodMapper.selectAllByPrice(price1, price2);
	}

	@Override
	public int countByUid(String uid)
	{
		return goodMapper.countByUid(uid);
	}

	@Override
	public GoodsPage<Goods> selectByUid(String uid, int pageCode,
			int limitNumber)
	{
		list = goodMapper.selectByUid(uid, pageCode, limitNumber);
		goodsPage.setList(list);
		return goodsPage;
	}

	@Override
	public void updateGoodsInform(String goodsId, String goodsName,
			double goodsPrice, String goodsDescribe, String onSaleTime,
			String degree)
	{
		goodMapper.updateGoodsInform(goodsId, goodsName, goodsPrice,
				goodsDescribe, onSaleTime, degree);

	}
	
	@Override
	public GoodsPage<OrderItem> selectByStatus(String uid, int status,int send,
			int pageCode, int limitNumber)
	{
		List<OrderItem> list = goodMapper.selectByStatus(uid, status, send, pageCode, limitNumber);
		GoodsPage<OrderItem> goodsPage = new GoodsPage<OrderItem>();
		goodsPage.setList(list);
		return goodsPage;
	}
	
	@Override
	public int countByStatus(String uid, int status, int send)
	{
		return goodMapper.countByStatus(uid, status, send);
	}
	
	@Override
	public void updateStatus(String OrderItemId)
	{
		goodMapper.updateStatus(OrderItemId);
		
	}
	
	@Override
	public int selectAllByLike(String name)
	{
		return goodMapper.selectAllByLike(name);
	}
	
	@Override
	public GoodsPage<Goods> selectByLike(String name, int pageCode,
			int limitNumber)
	{
		list = goodMapper.selectByLike(name, pageCode, limitNumber);
		goodsPage.setList(list);
		return goodsPage;
	}
}
