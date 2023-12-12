package cn.edu.nwpu.fleamarket.service;

import cn.edu.nwpu.fleamarket.pojo.Goods;

import java.util.List;

/**
 * @Author: Hanwen
 * @Date: 2018/6/7 下午4:34
 */
public interface GoodsService {

    List<Goods> selectAllGoods();
    int selectCountByCateList(List<Integer> cateList);
    List<Goods> selectByStatus(int status);
    List<Goods> selectByStudentNo(String studentNo);
    List<Goods> selectByStatusAndStudentNo(int status, String studentNo);
    Goods selectById(int id);

    void insertGoods(Goods goods);
    void deleteGoods(int id);
    void updateGoods(Goods goods);

    void updateGoodsStatus(Goods goods);

    List<Goods> selectByStatusAndGoodsStatus();

    List<Goods> selectByGoodsStatusAndStudentNo(int goodsStatus, String studentNo);

    List<Goods> getGoodsByCategory(int cate, int pageNum, int pageSize);
}
