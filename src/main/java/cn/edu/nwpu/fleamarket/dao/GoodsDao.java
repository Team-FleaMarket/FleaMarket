package cn.edu.nwpu.fleamarket.dao;

import cn.edu.nwpu.fleamarket.pojo.Goods;
import cn.edu.nwpu.fleamarket.pojo.Student;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * 商品
 *
 * @author lsy
 * @date 2023/12/15
 */
public interface GoodsDao {

    /**
     * 选择所有商品
     *
     * @return {@link List}<{@link Goods}>
     */
    List<Goods> selectAllGoods();

    /**
     * 选择按类别列表计数
     *
     * @param cateList cate 列表
     * @return {@link Integer}
     */
    Integer selectCountByCateList(List<Integer> cateList);

    /**
     * 按是否审核状态选择
     *
     * @param status 地位
     * @return {@link List}<{@link Goods}>
     */
    List<Goods> selectByStatus(int status);

    /**
     * 按学生编号选择
     *
     * @param studentNo 学生编号
     * @return {@link List}<{@link Goods}>
     */
    List<Goods> selectByStudentNo(String studentNo);

    /**
     * 按 ID 选择
     *
     * @param id 编号
     * @return {@link Goods}
     */
    Goods selectById(int id);

    /**
     * 添加货物
     *
     * @param goods 货物
     */
    void insertGoods(Goods goods);

    /**
     * 删除商品
     *
     * @param id 编号
     */
    void deleteGoods(int id);

    /**
     * 更新商品
     *
     * @param goods 货物
     */
    void updateGoods(Goods goods);

    /**
     * 按是否审核和学生编号选择
     *
     * @param goods    货物
     * @param offset   抵消
     * @param pageSize 页面大小
     * @return {@link List}<{@link Goods}>
     */
    List<Goods> selectByStatusAndStudentNo(@Param("goods") Goods goods,@Param("offset") int offset, @Param("pageSize") int pageSize);

    /**
     * 更新商品状态
     *
     * @param goods 货物
     */
    void updateGoodsStatus(Goods goods);

    /**
     * 按是否审核状态和售出状态选择
     *
     * @return {@link List}<{@link Goods}>
     */
    List<Goods> selectByStatusAndGoodsStatus();

    /**
     * 获取下一个要接受审核内容
     *
     * @return {@link Goods}
     */
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

    /**
     * 设置已分配审核员
     *
     * @param id 编号
     */
    @Update("UPDATE goods set attributed = 1 WHERE id = #{id}")
    void setAttributed(int id);

    /**
     * 设置未分配审核员
     *
     * @param id 编号
     */
    @Update("UPDATE goods set attributed = 0 WHERE id = #{id}")
    void setUnAttributed(int id);

    /**
     * 查询所有未被审核的已分配商品
     *
     * @return {@link List}<{@link Goods}>
     */
    @Select("SELECT * from goods where status = 0 and attributed = 1")
    List<Goods> getAllAttributedGoodsNotReviewed();

    /**
     * 更新商品审核状态
     *
     * @param id     编号
     * @param status 审核状态
     */
    @Update("UPDATE goods set status = #{status} where id = #{id}")
    void review(@Param("id") int id, @Param("status") int status);

    /**
     * 按类别页面获取商品
     *
     * @param cate     商品类别
     * @param pageSize 页面内商品多少
     * @return {@link List}<{@link Goods}>
     */
    List<Goods> getGoodsByCategoryPages(@Param("cate") int cate, @Param("offset") int offset, @Param("pageSize") int pageSize);

    /**
     * 按商品是否售出状态和学生编号选择
     *
     * @param goods    商品
     * @param pageSize 页面内商品多少
     * @return {@link List}<{@link Goods}>
     */
    List<Goods> selectByGoodsStatusAndStudentNo(@Param("goods") Goods goods, @Param("offset") int offset, @Param("pageSize") int pageSize);

    /**
     * 根据审核状态和学号查找商品总数
     *
     * @param status    类别
     * @param studentNo 学生学号
     * @return int
     */
    int selectByStatusAndStudentNoTotalCnt(@Param("status") int status, @Param("studentNo") String studentNo);

    /**
     * 根据出售状态查找商品总数
     *
     * @param goodsStatus 货物状态
     * @param studentNo   学生编号
     * @return int
     */
    int selectByGoodsStatusAndStudentNoTotalCnt(@Param("goodsStatus") int goodsStatus, @Param("studentNo") String studentNo);

    /**
     * 分页查找已售出商品 时间倒序排序
     *
     * @param start 开始
     * @return {@link List}<{@link Goods}>
     */
    @Select("SELECT * FROM goods WHERE goods_status = 1 ORDER BY sale_time DESC LIMIT #{start}, 6")
    @ResultMap("goodsResultMap")
    List<Goods> getSoldGoodsByPage(int start);

    /**
     * 获取售出数目
     *
     * @return 已售商品数
     */
    @Select("SELECT count(*) FROM goods WHERE goods_status = 1")
    int getSoldNumber();

    /**
     * 按时间范围查询已售商品
     *
     * @param start 开始
     * @param end   结束
     * @return {@link List}<{@link Goods}>
     */
    @Select("SELECT * FROM goods WHERE goods_status = 1 AND sale_time BETWEEN #{start} AND #{end} ORDER BY sale_time DESC")
    @ResultMap("goodsResultMap")
    List<Goods> getSoldGoodsByDate(@Param("start") Date start, @Param("end") Date end);

    /**
     * 返回全部已售商品
     *
     * @return {@link List}<{@link Goods}>
     */
    @Select("SELECT * FROM goods WHERE goods_status = 1 ORDER BY sale_time DESC")
    @ResultMap("goodsResultMap")
    List<Goods> getAllSoldGoods();

    /**
     * 根据出售者学号查询
     *
     * @param query 查询
     * @return {@link List}<{@link Goods}>
     */
    @Select("SELECT * FROM goods WHERE goods_status = 1 AND student_no LIKE #{query} ORDER BY sale_time DESC")
    @ResultMap("goodsResultMap")
    List<Goods> querySoldBySno(String query);

    /**
     * 根据购买者学号查询
     *
     * @param query 查询
     * @return {@link List}<{@link Goods}>
     */
    @Select("SELECT * FROM goods WHERE goods_status = 1 AND buyer_no LIKE #{query} ORDER BY sale_time DESC")
    @ResultMap("goodsResultMap")
    List<Goods> querySoldByBno(String query);

    /**
     * 根据商品状态，学生id和 商品名称进行搜索总数
     *
     * @param status    审核状态
     * @param studentNo 学生编号
     * @param goodsName 商品名称
     * @return int
     */
    int selectByStatusAndStudentNoAndGoodsNameTotalCnt(@Param("status") Integer status, @Param("studentNo") String studentNo, @Param("goodsName") String goodsName);

    /**
     * 按审核状态、学生编号和商品名称选择
     *
     * @param status    审核状态
     * @param studentNo 学生编号
     * @param goodsName 商品名称
     * @param pageSize  页面商品数量
     * @return {@link List}<{@link Goods}>
     */
    List<Goods> selectByStatusAndStudentNoAndGoodsName(@Param("status") Integer status, @Param("studentNo") String studentNo, @Param("goodsName") String goodsName, @Param("offset") int offset, @Param("pageSize") int pageSize);

    /**
     * 按商品状态和学生编号和商品名称选择总数
     *
     * @param goodsStatus 商品出售状态
     * @param studentNo   学生编号
     * @param goodsName   商品名称
     * @return int
     */
    int selectByGoodsStatusAndStudentNoAndGoodsNameTotalCnt(@Param("goodsStatus") Integer goodsStatus, @Param("studentNo") String studentNo, @Param("goodsName") String goodsName);

    /**
     * 按商品状态、学生编号和商品名称选择
     *
     * @param integer   整数
     * @param studentNo 学生编号
     * @param goodsName 商品名称
     * @param pageSize  页面商品数量
     * @return {@link List}<{@link Goods}>
     */
    List<Goods> selectByGoodsStatusAndStudentNoAndGoodsName(@Param("goodsStatus") Integer integer, @Param("studentNo") String studentNo, @Param("goodsName") String goodsName, @Param("offset") int offset, @Param("pageSize") int pageSize);

    /**
     * 设置货物状态
     *
     * @param goodsId 商品编号
     * @param code    出售状态
     */
    void setGoodsStatus(@Param("goodsId") int goodsId, @Param("goodsStatus") Integer code);

    /**
     * 根据学号查找学生
     *
     * @param studentNo 学生编号
     * @return {@link Student}
     */
    Student getStudentByStudentNo(@Param("studentNo") String studentNo);

    /**
     * 按商品名称选择
     *
     * @param query    查询
     * @param pageSize 页面商品数量
     * @return {@link List}<{@link Goods}>
     */
    List<Goods> selectByGoodsName(@Param("query") String query, @Param("offset") int offset, @Param("pageSize") int pageSize);

    /**
     * 某种商品销售总额
     *
     * @param cate 种类
     * @return 销售总额
     */
    @Select("SELECT COALESCE(SUM(price), 0) FROM goods WHERE cate = #{cate} AND goods_status = 1")
    double getSales(@Param("cate") String cate);

    /**
     * 逻辑删除商品
     *
     * @param goodsId 商品编号
     */
    void logicDeleteGoods(@Param("goodsId") int goodsId);

    /**
     * 编辑商品
     *
     * @param goods 商品
     */
    void editGoods(@Param("goods") Goods goods);

    /**
     * 设置审核状态
     *
     * @param id   编号
     * @param code 状态
     */
    void setStatus(@Param("goodsId")int id,@Param("status") Integer code);
}
