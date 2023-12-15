package cn.edu.nwpu.fleamarket.dao;

import cn.edu.nwpu.fleamarket.pojo.Goods;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Date;
import java.util.List;

/**
 * 商品 mapper
 */
public interface GoodsDao {

    List<Goods> selectAllGoods();
    int selectCountByCateList(List<Integer> cateList);
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
            @Result(column = "buyer_no", property = "buyerNo"),
            @Result(column = "image_path", property = "imagePath"),
            @Result(column = "added_time", property = "addedTime"),
            @Result(column = "sale_time", property = "saleTime")
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
     * 分页查找已售出商品 时间倒序排序
     */
    @Select("SELECT * FROM goods WHERE goods_status = 1 ORDER BY sale_time DESC LIMIT #{start}, 6")
    @ResultMap("goodsResultMap")
    List<Goods> getSoldGoodsByPage(int start);

    /**
     * @return 已售商品数
     */
    @Select("SELECT count(*) FROM goods WHERE goods_status = 1")
    int getSoldNumber();

    /**
     * 按时间范围查询已售商品
     */
    @Select("SELECT * FROM goods WHERE goods_status = 1 AND sale_time BETWEEN #{start} AND #{end} ORDER BY sale_time DESC")
    @ResultMap("goodsResultMap")
    List<Goods> getSoldGoodsByDate(@Param("start") Date start, @Param("end") Date end);

    /**
     *返回全部已售商品
     */
    @Select("SELECT * FROM goods WHERE goods_status = 1 ORDER BY sale_time DESC")
    @ResultMap("goodsResultMap")
    List<Goods> getAllSoldGoods();

    /**
     * 根据出售者学号查询
     */
    @Select("SELECT * FROM goods WHERE goods_status = 1 AND student_no LIKE #{query} ORDER BY sale_time DESC")
    @ResultMap("goodsResultMap")
    List<Goods> querySoldBySno(String query);

    /**
     * 根据购买者学号查询
     */
    @Select("SELECT * FROM goods WHERE goods_status = 1 AND buyer_no LIKE #{query} ORDER BY sale_time DESC")
    @ResultMap("goodsResultMap")
    List<Goods> querySoldByBno(String query);
    int selectByStatusAndStudentNoAndGoodsNameTotalCnt(@Param("status") Integer status, @Param("studentNo") String studentNo, @Param("goodsName") String goodsName);

    List<Goods> selectByStatusAndStudentNoAndGoodsName(@Param("status") Integer status, @Param("studentNo") String studentNo, @Param("goodsName") String goodsName, @Param("offset") int offset, @Param("pageSize") int pageSize);

    int selectByGoodsStatusAndStudentNoAndGoodsNameTotalCnt(@Param("goodsStatus") Integer goodsStatus, @Param("studentNo") String studentNo, @Param("goodsName") String goodsName);

    List<Goods> selectByGoodsStatusAndStudentNoAndGoodsName(@Param("goodsStatus") Integer integer, @Param("studentNo") String studentNo, @Param("goodsName") String goodsName, @Param("offset") int offset, @Param("pageSize") int pageSize);
}
