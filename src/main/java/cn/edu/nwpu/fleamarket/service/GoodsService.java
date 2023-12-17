package cn.edu.nwpu.fleamarket.service;

import cn.edu.nwpu.fleamarket.data.OrderInformation;
import cn.edu.nwpu.fleamarket.data.OrderInformationPageResult;
import cn.edu.nwpu.fleamarket.pojo.Goods;
import cn.edu.nwpu.fleamarket.pojo.Student;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Or;

import java.util.Date;
import java.util.List;


public interface GoodsService {

    List<Goods> selectAllGoods();
    int selectCountByCateList(List<Integer> cateList);
    List<Goods> selectByStatus(int status);
    List<Goods> selectByStudentNo(String studentNo);
    List<OrderInformation> selectByStatusAndStudentNo(int status, String studentNo, int currentPage, int pageSize);
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
    List<OrderInformation> selectByGoodsStatusAndStudentNo(int goodsStatus, String studentNo, int currentPage, int pageSize);

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
    int selectByStatusAndStudentNoAndGoodsNameTotalCnt(Integer status, String studentNo, String goodsName);

    List<OrderInformation> selectByStatusAndStudentNoAndGoodsName(Integer integer, String studentNo, String goodsName, int currentPage, int pageSize);

    int selectByGoodsStatusAndStudentNoAndGoodsNameTotalCnt(Integer goodsStatus, String studentNo, String goodsName);

    List<OrderInformation> selectByGoodsStatusAndStudentNoAndGoodsName(Integer integer, String studentNo, String goodsName, int currentPage, int pageSize);

    Goods checkIsReviewedAndNotSold(Integer goodsId);

    Student getStudentByStudentNo(String studentNo);

    List<Goods> selectByGoodsName(String query, int page, int pageSize);

    OrderInformationPageResult getNotReviewed(boolean isSearching, String goodsName, String studentNo,int currentPage);

    OrderInformationPageResult getNotSold(boolean isSearching, String goodsName, String studentNo, int currentPage);

    OrderInformationPageResult getSold(boolean isSearching, String goodsName, String studentNo, int currentPage);

    OrderInformationPageResult getMyPurchase(boolean isSearching, String goodsName, String studentNo, int currentPage);

    OrderInformationPageResult getInProgress(boolean isSearching, String goodsName, String studentNo, int currentPage);

    OrderInformationPageResult getReviewedFail(boolean isSearching, String goodsName, String studentNo, int currentPage);

    void offShelf(Integer goodsId, String studentNo);

    void editGoods(Goods goods);

    /**
     * 某种商品销售总额
     * @param cate 种类
     * @return 销售总额
     */
    double getSales(int cate);
}
