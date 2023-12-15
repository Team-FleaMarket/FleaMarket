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
    List<Goods> selectByStatusAndStudentNo(int status, String studentNo, int currentPage, int pageSize);
    Goods selectById(int id);

    void insertGoods(Goods goods);
    void deleteGoods(int id);
    void updateGoods(Goods goods);

    void updateGoodsStatus(Goods goods);

    List<Goods> selectByStatusAndGoodsStatus();

    //下一个待审核
    Goods getNextToBeReviewed();

    //设置已分配
    void setAttributed(int id);

    //设置未分配
    void setUnAttributed(int id);

    //查询所有未被审核的已分配商品
    List<Goods> getAllAttributedGoodsNotReviewed();

    boolean review(int id, int status);
    List<Goods> selectByGoodsStatusAndStudentNo(int goodsStatus, String studentNo, int currentPage, int pageSize);

    List<Goods> getGoodsByCategory(int cate, int pageNum, int pageSize);

    int selectByStatusAndStudentNoTotalCnt(int status, String studentNo);

    int selectByGoodsStatusAndStudentNoTotalCnt(int goodsStatus, String studentNo);

    int selectByStatusAndStudentNoAndGoodsNameTotalCnt(Integer status, String studentNo, String goodsName);

    List<Goods> selectByStatusAndStudentNoAndGoodsName(Integer integer, String studentNo, String goodsName, int currentPage, int pageSize);

    int selectByGoodsStatusAndStudentNoAndGoodsNameTotalCnt(Integer goodsStatus, String studentNo, String goodsName);

    List<Goods> selectByGoodsStatusAndStudentNoAndGoodsName(Integer integer, String studentNo, String goodsName, int currentPage, int pageSize);
}
