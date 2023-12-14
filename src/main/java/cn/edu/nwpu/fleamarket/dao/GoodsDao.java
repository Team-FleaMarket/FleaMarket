package cn.edu.nwpu.fleamarket.dao;

import cn.edu.nwpu.fleamarket.pojo.Goods;
import org.apache.ibatis.annotations.*;
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

    @Select("SELECT * FROM goods WHERE attributed = 0 AND status = 0 ORDER BY id LIMIT 1")
    @Results(id = "goodsResultMap", value = {
            @Result(column = "student_no", property = "studentNo"),
            @Result(column = "goods_name", property = "goodsName"),
            @Result(column = "image_path", property = "imagePath")
    })
    Goods getNextToBeReviewed();

    //设置已分配审核员
    @Update("UPDATE goods set attributed = 1 WHERE id = #{id}")
    void setAttributed(int id);

    //设置未分配审核员
    @Update("UPDATE goods set attributed = 0 WHERE id = #{id}")
    void setUnAttributed(int id);

    //查询所有未被审核的已分配商品
    @Select("SELECT * from goods where status = 0 and attributed = 1")
    List<Goods> getAllAttributedGoodsNotReviewed();

    @Update("UPDATE goods set status = #{status} where id = #{id}")
    void review(@Param("id") int id, @Param("status") int status);
    List<Goods> getGoodsByCategoryPages(@Param("cate") int cate, @Param("offset") int offset, @Param("pageSize") int pageSize);

    List<Goods> selectByGoodsStatusAndStudentNo(@Param("goods") Goods goods, @Param("offset") int offset, @Param("pageSize") int pageSize);

    int selectByStatusAndStudentNoTotalCnt(@Param("status") int status, @Param("studentNo") String studentNo);

    int selectByGoodsStatusAndStudentNoTotalCnt(@Param("goods_status") int goodsStatus, @Param("studentNo") String studentNo);

    /**
     * 选取已售出商品
     */
    @Select("SELECT * FROM goods WHERE goods_status = 1")
    @ResultMap("goodsResultMap")
    List<Goods> getSoldGoods();

}
