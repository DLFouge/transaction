package dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Goods;

public interface GoodsMapper
{
	/**
	 * 按商品id查询商品详细信息
	 * @param goodsId
	 * @return
	 */
	public Goods selectById(@Param("goodsId")String goodsId);
	/**
	 * 根据商品名字查询商品详细信息
	 * @param goodsName
	 * @return
	 */
	public Goods selectByName(@Param("goodsName")String goodsName);
	/**
	 * 上架商品添加商品信息
	 * @param goods
	 * @return
	 */
	public int addGoods(Goods goods);
	/**
	 * 根据用户id查询该用户所有上架的商品
	 * @param userId
	 * @return
	 */
	public List<Goods> selectAllAddGoods(@Param("userId")String userId);
	/**
	 * 根据商品id删除商品信息
	 * @param goodsId
	 * @return
	 */
	public int deleteGoods(@Param("goodsId")String goodsId);
	
	/*
	 *  按商品分类（cid）查询出这类所有商品
	 *  param : 分类id
	 */
	public int selectAllByCid(@Param("cid") String cid);

}
