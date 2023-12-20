package cn.edu.nwpu.fleamarket.service;

import cn.edu.nwpu.fleamarket.data.OrderInformation;
import cn.edu.nwpu.fleamarket.data.OrderInformationPageResult;
import cn.edu.nwpu.fleamarket.pojo.Goods;
import cn.edu.nwpu.fleamarket.pojo.Student;

import java.util.Date;
import java.util.List;


/**
 * 商品服务
 *
 * @author lsy
 * @date 2023/12/15
 */
public interface GoodsService {

    /**
     * 选择所有商品
     *
     * @return {@link List}<{@link Goods}>
     */
    List<Goods> selectAllGoods();

    /**
     * 选择按类别计数
     *
     * @param cateList cate 列表
     * @return {@link Integer}
     */
    Integer selectCountByCateList(List<Integer> cateList);

    /**
     * 按状态选择
     *
     * @param status 是否审核
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
     * 按审核状态和学生编号选择
     *
     * @param status      审核状态
     * @param studentNo   学生编号
     * @param currentPage 当前页面
     * @param pageSize    页面大小
     * @return {@link List}<{@link OrderInformation}>
     */
    List<OrderInformation> selectByStatusAndStudentNo(int status, String studentNo, int currentPage, int pageSize);

    /**
     * 按 ID 选择
     *
     * @param id 编号
     * @return {@link Goods}
     */
    Goods selectById(int id);

    /**
     * 添加商品
     *
     * @param goods 商品
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
     * 获取下一个要接受审核内容
     *
     * @return {@link Goods}
     *///下一个待审核
    Goods getNextToBeReviewed();

    /**
     * 设置属性
     *
     * @param id 编号
     *///设置已分配
    void setAttributed(int id);

    /**
     * 设置未分配
     *
     * @param id 编号
     */
    void setUnAttributed(int id);

    /**
     * 获取所有未审核分配商品
     *
     * @return {@link List}<{@link Goods}>
     */
    List<Goods> getAllAttributedGoodsNotReviewed();

    /**
     * 是否审核
     *
     * @param id     编号
     * @param status 审核状态
     * @return boolean
     */
    boolean review(int id, int status);

    /**
     * 按商品出售状态和学生编号选择
     *
     * @param goodsStatus 商品出售状态
     * @param studentNo   学生编号
     * @param currentPage 当前页面
     * @param pageSize    页面大小
     * @return {@link List}<{@link OrderInformation}>
     */
    List<OrderInformation> selectByGoodsStatusAndStudentNo(int goodsStatus, String studentNo, int currentPage, int pageSize);

    /**
     * 按类别获取商品
     *
     * @param cate    类别
     * @param pageNum  页码
     * @param pageSize 页面大小
     * @return {@link List}<{@link Goods}>
     */
    List<Goods> getGoodsByCategory(int cate, int pageNum, int pageSize);

    /**
     * 按出售状态和学生选择商品总数
     *
     * @param status    审核状态
     * @param studentNo 学生编号
     * @return int
     */
    int selectByStatusAndStudentNoTotalCnt(int status, String studentNo);

    /**
     * 按商品出售状态和学生选择总数
     *
     * @param goodsStatus 货物出售状态
     * @param studentNo   学生编号
     * @return int
     */
    int selectByGoodsStatusAndStudentNoTotalCnt(int goodsStatus, String studentNo);

    /**
     * 获得售出总数
     *
     * @return int
     */
    int getSoldTotalCnt();

    /**
     * 按页面查找出售
     *
     * @param page 页
     * @return {@link List}<{@link Goods}>
     */
    List<Goods> getSoldByPage(int page);

    /**
     * 获取所有已售出商品
     *
     * @return {@link List}<{@link Goods}>
     */
    List<Goods> getAllSoldGoods();

    /**
     * 按日期获取已售商品
     *
     * @param start 开始
     * @param end   结束
     * @return {@link List}<{@link Goods}>
     */
    List<Goods> getSoldGoodsByDate(Date start, Date end);

    /**
     * 根据卖家id销售查询
     *
     * @param query 查询
     * @return {@link List}<{@link Goods}>
     */
    List<Goods> querySoldBySno(String query);

    /**
     * 根据买家id销售查询
     *
     * @param query 查询
     * @return {@link List}<{@link Goods}>
     */
    List<Goods> querySoldByBno(String query);

    /**
     * 按审核状态和学生编号和商品名称选择的商品总数
     *
     * @param status    审核状态
     * @param studentNo 学生编号
     * @param goodsName 商品名称
     * @return int
     */
    int selectByStatusAndStudentNoAndGoodsNameTotalCnt(Integer status, String studentNo, String goodsName);

    /**
     * 按审核状态、学生编号和商品名称选择
     *
     * @param studentNo   学生编号
     * @param goodsName   商品名称
     * @param currentPage 当前页面
     * @param pageSize    页面大小
     * @return {@link List}<{@link OrderInformation}>
     */
    List<OrderInformation> selectByStatusAndStudentNoAndGoodsName(Integer integer, String studentNo, String goodsName, int currentPage, int pageSize);

    /**
     * 按商品出售状态和学生编号和商品名称选择商品的总数
     *
     * @param goodsStatus 出售状态
     * @param studentNo   学生编号
     * @param goodsName   商品名称
     * @return int
     */
    int selectByGoodsStatusAndStudentNoAndGoodsNameTotalCnt(Integer goodsStatus, String studentNo, String goodsName);

    /**
     * 按商品出售状态、学生编号和商品名称选择
     *
     * @param integer     整数
     * @param studentNo   学生编号
     * @param goodsName   商品名称
     * @param currentPage 当前页面
     * @param pageSize    页面大小
     * @return {@link List}<{@link OrderInformation}>
     */
    List<OrderInformation> selectByGoodsStatusAndStudentNoAndGoodsName(Integer integer, String studentNo, String goodsName, int currentPage, int pageSize);

    /**
     * 检查是经过审核并且未出售
     *
     * @param goodsId 商品编号
     * @return {@link Goods}
     */
    Goods checkIsReviewedAndNotSold(Integer goodsId);

    /**
     *获取学生
     *
     * @param studentNo 学生编号
     * @return {@link Student}
     */
    Student getStudentByStudentNo(String studentNo);

    /**
     * 按商品名称选择
     *
     * @param query    查询
     * @param page     页
     * @param pageSize 页面大小
     * @return {@link List}<{@link Goods}>
     */
    List<Goods> selectByGoodsName(String query, int page, int pageSize);

    /**
     * 未审核
     *
     * @param isSearching 正在搜索
     * @param goodsName   商品名称
     * @param studentNo   学生编号
     * @param currentPage 当前页面
     * @return {@link OrderInformationPageResult}
     */
    OrderInformationPageResult getNotReviewed(boolean isSearching, String goodsName, String studentNo, int currentPage);

    /**
     * 未售卖
     *
     * @param isSearching 正在搜索
     * @param goodsName   商品名称
     * @param studentNo   学生编号
     * @param currentPage 当前页面
     * @return {@link OrderInformationPageResult}
     */
    OrderInformationPageResult getNotSold(boolean isSearching, String goodsName, String studentNo, int currentPage);

    /**
     * 获得已销售
     *
     * @param isSearching 正在搜索
     * @param goodsName   商品名称
     * @param studentNo   学生编号
     * @param currentPage 当前页面
     * @return {@link OrderInformationPageResult}
     */
    OrderInformationPageResult getSold(boolean isSearching, String goodsName, String studentNo, int currentPage);

    /**
     * 获取我的购买
     *
     * @param isSearching 正在搜索
     * @param goodsName   商品名称
     * @param studentNo   学生编号
     * @param currentPage 当前页面
     * @return {@link OrderInformationPageResult}
     */
    OrderInformationPageResult getMyPurchase(boolean isSearching, String goodsName, String studentNo, int currentPage);

    /**
     * 进行中的订单
     *
     * @param isSearching 正在搜索
     * @param goodsName   商品名称
     * @param studentNo   学生编号
     * @param currentPage 当前页面
     * @return {@link OrderInformationPageResult}
     */
    OrderInformationPageResult getInProgress(boolean isSearching, String goodsName, String studentNo, int currentPage);

    /**
     * 审核未通过
     *
     * @param isSearching 正在搜索
     * @param goodsName   商品名称
     * @param studentNo   学生编号
     * @param currentPage 当前页面
     * @return {@link OrderInformationPageResult}
     */
    OrderInformationPageResult getReviewedFail(boolean isSearching, String goodsName, String studentNo, int currentPage);

    /**
     * 非法操作
     *
     * @param goodsId   商品编号
     * @param studentNo 学生编号
     */
    void offShelf(Integer goodsId, String studentNo);

    /**
     * 编辑商品
     *
     * @param goods 商品
     */
    void editGoods(Goods goods);

    /**
     * 某种商品销售总额
     *
     * @param cate 类被
     * @return 销售总额
     */
    double getSales(int cate);
}
