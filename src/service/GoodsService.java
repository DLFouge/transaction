package service;

import java.util.List;

import entity.Goods;

public interface GoodsService {
	/**
	 * 根据id查询商品详细信息
	 * @param goodsId
	 * @return
	 */
	public Goods selectById(String goodsId);
	
	/**
	 *根据名称查询单个商品详细信息
	 * @param goodsName
	 * @return
	 */
	public Goods selectByName(String goodsName);
	/**
	 * 添加商品
	 * @param goods
	 * @return
	 */
	public boolean addGoods(Goods goods);
	/**
	 * 根据用户id查询所有上架商品
	 * @param useId
	 * @return
	 */
	public List<Goods> selectAllAddGoods(String useId);
	/**
	 * 删除商品
	 * @param goodsId
	 * @return
	 */
	public boolean deleteGoods(String goodsId);
	
}
