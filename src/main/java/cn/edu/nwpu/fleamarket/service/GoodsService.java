package cn.edu.nwpu.fleamarket.service;

import cn.edu.nwpu.fleamarket.pojo.Goods;

import java.util.Date;
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

    //已售商品总数
    int getSoldTotalCnt();

    //分页查询已售商品
    List<Goods> getSoldByPage(int page);

    List<Goods> getAllSoldGoods();

    List<Goods> getSoldGoodsByDate(Date start, Date end);

    List<Goods> querySoldBySno(String query);

    List<Goods> querySoldByBno(String query);
}
