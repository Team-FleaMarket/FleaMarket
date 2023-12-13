package cn.edu.nwpu.fleamarket.dao;

import cn.edu.nwpu.fleamarket.pojo.Goods;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author: Hanwen
 * @Date: 2018/6/7 下午4:37
 */
public interface GoodsDao {

    List<Goods> selectAllGoods();
    Integer selectCountByCateList(List<Integer> cateList);
    List<Goods> selectByStatus(int status);
    List<Goods> selectByStudentNo(String studentNo);
    Goods selectById(int id);
    void insertGoods(Goods goods);
    void deleteGoods(int id);
    void updateGoods(Goods goods);

    List<Goods> selectByStatusAndStudentNo(@Param("goods") Goods goods,@Param("offset") int offset, @Param("pageSize") int pageSize);

    void updateGoodsStatus(Goods goods);

    List<Goods> selectByStatusAndGoodsStatus();

    List<Goods> getGoodsByCategoryPages(@Param("cate") int cate, @Param("offset") int offset, @Param("pageSize") int pageSize);

    List<Goods> selectByGoodsStatusAndStudentNo(@Param("goods") Goods goods, @Param("offset") int offset, @Param("pageSize") int pageSize);

    int selectByStatusAndStudentNoTotalCnt(@Param("status") int status, @Param("studentNo") String studentNo);

    int selectByGoodsStatusAndStudentNoTotalCnt(@Param("goods_status") int goodsStatus, @Param("studentNo") String studentNo);
}
