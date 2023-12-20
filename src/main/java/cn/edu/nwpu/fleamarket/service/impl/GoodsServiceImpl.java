package cn.edu.nwpu.fleamarket.service.impl;

import cn.edu.nwpu.fleamarket.dao.GoodsDao;
import cn.edu.nwpu.fleamarket.dao.OrdersDao;
import cn.edu.nwpu.fleamarket.dao.StudentDao;
import cn.edu.nwpu.fleamarket.data.OrderInformation;
import cn.edu.nwpu.fleamarket.data.OrderInformationPageResult;
import cn.edu.nwpu.fleamarket.enums.GoodsStatusEnum;
import cn.edu.nwpu.fleamarket.enums.ReviewStatusEnum;
import cn.edu.nwpu.fleamarket.exception.BusinessException;
import cn.edu.nwpu.fleamarket.pojo.Goods;
import cn.edu.nwpu.fleamarket.pojo.Orders;
import cn.edu.nwpu.fleamarket.pojo.Student;
import cn.edu.nwpu.fleamarket.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * 商品服务实现
 *
 * @author lsy
 * @date 2023/12/15
 */
@Service
public class GoodsServiceImpl implements GoodsService {

    /**
     * 商品
     */
    @Autowired
    private GoodsDao goodsDao;

    /**
     * 学生
     */
    @Autowired
    private StudentDao studentDao;

    /**
     * 订单
     */
    @Autowired
    private OrdersDao ordersDao;

    /**
     * 页面商品数量
     */
    private static final int PAGE_SIZE = 24;
    /**
     * 页面商品数量
     */
    private static final int MANAGE_PAGE_SIZE = 5;


    /**
     * 选择所有商品
     *
     * @return {@link List}<{@link Goods}>
     */
    public List<Goods> selectAllGoods() {
        return goodsDao.selectAllGoods();
    }

    /**
     * 选择按类别计数
     *
     * @param cateList cate 商品类别
     * @return {@link Integer}
     */
    public Integer selectCountByCateList(List<Integer> cateList) {
        Integer count = goodsDao.selectCountByCateList(cateList);
        if (count == null) {
            return 0;
        }
        return count;
    }

    /**
     * 按状态选择
     *
     * @param status 是否审核
     * @return {@link List}<{@link Goods}>
     */
    public List<Goods> selectByStatus(int status) {
        return goodsDao.selectByStatus(status);
    }

    /**
     * 按学生编号选择
     *
     * @param studentNo 学生编号
     * @return {@link List}<{@link Goods}>
     */
    public List<Goods> selectByStudentNo(String studentNo) {
        return goodsDao.selectByStudentNo(studentNo);
    }

    /**
     * 按 ID 选择
     *
     * @param id 商品编号
     * @return {@link Goods}
     */
    public Goods selectById(int id) {
        return goodsDao.selectById(id);
    }

    /**
     * 添加商品
     *
     * @param goods 商品
     */
    public void insertGoods(Goods goods) {
        goodsDao.insertGoods(goods);
    }

    /**
     * 删除商品
     *
     * @param id 编号
     */
    public void deleteGoods(int id) {
        goodsDao.deleteGoods(id);
    }

    /**
     * 更新商品
     *
     * @param goods 商品
     */
    public void updateGoods(Goods goods) {
        goodsDao.updateGoods(goods);
    }

    /**
     * 按审核状态和学生编号选择
     *
     * @param status      审核状态
     * @param studentNo   学生编号
     * @param currentPage 当前页面
     * @param pageSize    页面大小
     * @return {@link List}<{@link OrderInformation}>
     */
    public List<OrderInformation> selectByStatusAndStudentNo(int status, String studentNo, int currentPage, int pageSize) {
        Goods goods = new Goods();
        List<OrderInformation> resultList = new ArrayList<>();
        goods.setStatus(status);
        goods.setStudentNo(studentNo);
        goods.setGoodsStatus(0);
        int offset = currentPage * pageSize;
        List<Goods> goodsList = goodsDao.selectByStatusAndStudentNo(goods, offset, pageSize);
        for (Goods goods1 : goodsList) {
            OrderInformation orderInformation = new OrderInformation();
            orderInformation.setGoods(goods1);
            Orders orders = ordersDao.selectByGoodsId(goods1.getId());
            if (orders != null) {
                Student seller = studentDao.selectStudentByStudentNo(orders.getSellerId().toString());
                Student buyer = studentDao.selectStudentByStudentNo(orders.getBuyerId().toString());
                orderInformation.setSeller(seller);
                orderInformation.setBuyer(buyer);
                orderInformation.setOrderId(orders.getId());
                orderInformation.setIsCancel(orders.getIsCancel());
                orderInformation.setBuyerConfirm(orders.getBuyerConfirm());
                orderInformation.setSellerConfirm(orders.getSellerConfirm());
            }
            resultList.add(orderInformation);
        }
        return resultList;
    }

    /**
     * 按商品出售状态和学生编号选择
     *
     * @param goodsStatus 商品出售状态
     * @param studentNo   学生编号
     * @param currentPage 当前页面
     * @param pageSize    页面大小
     * @return {@link List}<{@link OrderInformation}>
     */
    public List<OrderInformation> selectByGoodsStatusAndStudentNo(int goodsStatus, String studentNo, int currentPage, int pageSize) {
        Goods goods = new Goods();
        List<OrderInformation> resultList = new ArrayList<>();
        goods.setGoodsStatus(goodsStatus);
        goods.setStudentNo(studentNo);
        System.out.println("select");
        int offset = currentPage * pageSize;
        List<Goods> goodsList = goodsDao.selectByGoodsStatusAndStudentNo(goods, offset, pageSize);
        for (Goods goods1 : goodsList) {
            Orders orders = ordersDao.selectByGoodsId(goods1.getId());
            OrderInformation orderInformation = new OrderInformation();
            orderInformation.setGoods(goods1);
            if (orders != null) {
                Student seller = studentDao.selectStudentByStudentNo(orders.getSellerId().toString());
                Student buyer = studentDao.selectStudentByStudentNo(orders.getBuyerId().toString());
                orderInformation.setSeller(seller);
                orderInformation.setBuyer(buyer);
                orderInformation.setOrderId(orders.getId());
                orderInformation.setSellerConfirm(orders.getSellerConfirm());
                orderInformation.setBuyerConfirm(orders.getBuyerConfirm());
                orderInformation.setIsCancel(orders.getIsCancel());

            }
            resultList.add(orderInformation);
        }
        return resultList;
    }
    /**
     * 更新商品出售状态
     *
     * @param goods 商品
     */
    public void updateGoodsStatus(Goods goods) {
        goodsDao.updateGoodsStatus(goods);
    }

    /**
     * 按审核状态和出售状态选择
     *
     * @return {@link List}<{@link Goods}>
     */
    public List<Goods> selectByStatusAndGoodsStatus() {
        return goodsDao.selectByStatusAndGoodsStatus();
    }

    /**
     * 获取下一个要接受审核商品
     *
     * @return {@link Goods}
     */
    @Override
    public Goods getNextToBeReviewed() {
        return goodsDao.getNextToBeReviewed();
    }

    /**
     * 设置分配管理员
     *
     * @param id 编号
     */
    @Override
    public void setAttributed(int id) {
        goodsDao.setAttributed(id);
    }

    /**
     * 设置未分配
     *
     * @param id 编号
     */
    @Override
    public void setUnAttributed(int id) {
        goodsDao.setUnAttributed(id);
    }

    /**
     * 获取所有未审核分配商品
     *
     * @return {@link List}<{@link Goods}>
     */
    @Override
    public List<Goods> getAllAttributedGoodsNotReviewed() {
        return goodsDao.getAllAttributedGoodsNotReviewed();
    }

    /**
     * 是否审核
     *
     * @param id     编号
     * @param status 审核状态
     * @return boolean
     */
    @Override
    public boolean review(int id, int status) {
        try {
            goodsDao.review(id, status);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    /**
     * 按类别获取商品
     *
     * @param cate    类别
     * @param pageNum  页码
     * @param pageSize 页面大小
     * @return {@link List}<{@link Goods}>
     */
    public List<Goods> getGoodsByCategory(int cate, int pageNum, int pageSize) {
        return goodsDao.getGoodsByCategoryPages(cate, (pageNum - 1) * pageSize, pageSize);
    }

    /**
     * 按出售状态和学生选择商品总数
     *
     * @param status    审核状态
     * @param studentNo 学生编号
     * @return int
     */
    @Override
    public int selectByStatusAndStudentNoTotalCnt(int status, String studentNo) {
        return goodsDao.selectByStatusAndStudentNoTotalCnt(status, studentNo);
    }

    /**
     * 按商品出售状态和学生选择总数
     *
     * @param goodsStatus 货物出售状态
     * @param studentNo   学生编号
     * @return int
     */
    @Override
    public int selectByGoodsStatusAndStudentNoTotalCnt(int goodsStatus, String studentNo) {
        return goodsDao.selectByGoodsStatusAndStudentNoTotalCnt(goodsStatus, studentNo);
    }

    /**
     * 获得售出总数
     *
     * @return int
     */
    @Override
    public int getSoldTotalCnt() {
        return goodsDao.getSoldNumber();
    }

    /**
     * 按页面查找出售
     *
     * @param page 页
     * @return {@link List}<{@link Goods}>
     */
    @Override
    public List<Goods> getSoldByPage(int page) {
        return goodsDao.getSoldGoodsByPage((page - 1) * 6);
    }

    /**
     * 获取所有已售出商品
     *
     * @return {@link List}<{@link Goods}>
     */
    @Override
    public List<Goods> getAllSoldGoods() {
        return goodsDao.getAllSoldGoods();
    }

    /**
     * 按日期获取已售商品
     *
     * @param start 开始
     * @param end   结束
     * @return {@link List}<{@link Goods}>
     */
    @Override
    public List<Goods> getSoldGoodsByDate(Date start, Date end) {
        return goodsDao.getSoldGoodsByDate(start, end);
    }

    /**
     * 根据卖家id销售查询
     *
     * @param query 查询
     * @return {@link List}<{@link Goods}>
     */
    @Override
    public List<Goods> querySoldBySno(String query) {
        return goodsDao.querySoldBySno(query);
    }

    /**
     * 根据买家id销售查询
     *
     * @param query 查询
     * @return {@link List}<{@link Goods}>
     */
    @Override
    public List<Goods> querySoldByBno(String query) {
        return goodsDao.querySoldByBno(query);
    }

    /**
     * 按审核状态和学生编号和商品名称选择的商品总数
     *
     * @param status    审核状态
     * @param studentNo 学生编号
     * @param goodsName 商品名称
     * @return int
     */
    public int selectByStatusAndStudentNoAndGoodsNameTotalCnt(Integer status, String studentNo, String goodsName) {
        return goodsDao.selectByStatusAndStudentNoAndGoodsNameTotalCnt(status, studentNo, goodsName);
    }

    /**
     * 按审核状态、学生编号和商品名称选择
     *
     * @param status      审核状态
     * @param studentNo   学生编号
     * @param goodsName   商品名称
     * @param currentPage 当前页面
     * @param pageSize    页面大小
     * @return {@link List}<{@link OrderInformation}>
     */
    @Override
    public List<OrderInformation> selectByStatusAndStudentNoAndGoodsName(Integer status, String studentNo, String goodsName, int currentPage, int pageSize) {
        int offset = currentPage * pageSize;
        List<Goods> goodsList = goodsDao.selectByStatusAndStudentNoAndGoodsName(status, studentNo, goodsName, offset, pageSize);
        List<OrderInformation> resultList = new ArrayList<>();
        for (Goods goods : goodsList) {
            Orders orders = ordersDao.selectByGoodsId(goods.getId());
            OrderInformation orderInformation = new OrderInformation();
            orderInformation.setGoods(goods);
            if (orders != null) {
                Student seller = studentDao.selectStudentByStudentNo(orders.getSellerId().toString());
                Student buyer = studentDao.selectStudentByStudentNo(orders.getBuyerId().toString());
                orderInformation.setSeller(seller);
                orderInformation.setBuyer(buyer);
                orderInformation.setOrderId(orders.getId());
                orderInformation.setSellerConfirm(orders.getSellerConfirm());
                orderInformation.setBuyerConfirm(orders.getBuyerConfirm());
                orderInformation.setIsCancel(orders.getIsCancel());

            }
            resultList.add(orderInformation);
        }
        return resultList;

    }

    /**
     * 按商品出售状态和学生编号和商品名称选择商品的总数
     *
     * @param goodsStatus 出售状态
     * @param studentNo   学生编号
     * @param goodsName   商品名称
     * @return int
     */
    @Override
    public int selectByGoodsStatusAndStudentNoAndGoodsNameTotalCnt(Integer goodsStatus, String studentNo, String goodsName) {
        return goodsDao.selectByGoodsStatusAndStudentNoAndGoodsNameTotalCnt(goodsStatus, studentNo, goodsName);
    }

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
    @Override
    public List<OrderInformation> selectByGoodsStatusAndStudentNoAndGoodsName(Integer integer, String studentNo, String goodsName, int currentPage, int pageSize) {
        int offset = currentPage * pageSize;
        List<OrderInformation> orderInformationList = new ArrayList<>();
        List<Goods> goodsList = goodsDao.selectByGoodsStatusAndStudentNoAndGoodsName(integer, studentNo, goodsName, offset, pageSize);
        for (Goods goods : goodsList) {
            Orders orders = ordersDao.selectByGoodsId(goods.getId());
            OrderInformation orderInformation = new OrderInformation();
            orderInformation.setGoods(goods);
            if (orders != null) {
                Student seller = studentDao.selectStudentByStudentNo(orders.getSellerId().toString());
                Student buyer = studentDao.selectStudentByStudentNo(orders.getBuyerId().toString());
                orderInformation.setSeller(seller);
                orderInformation.setBuyer(buyer);
                orderInformation.setBuyerConfirm(orders.getBuyerConfirm());
                orderInformation.setSellerConfirm(orders.getSellerConfirm());
                orderInformation.setIsCancel(orders.getIsCancel());

            }

            orderInformationList.add(orderInformation);
        }
        return orderInformationList;
    }

    /**
     * 检查是经过审核并且未出售
     *
     * @param goodsId 商品编号
     * @return {@link Goods}
     */
    @Override
    public Goods checkIsReviewedAndNotSold(Integer goodsId) {
        Goods goods = goodsDao.selectById(goodsId);
        if (goods == null) {
            throw new BusinessException("商品不存在");
        }
        if (goods.getStatus() != ReviewStatusEnum.REVIEWED.getCode()) {
            throw new BusinessException("商品未被审核");
        }
        if (goods.getGoodsStatus() == GoodsStatusEnum.SOLD.getCode()) {
            throw new BusinessException("商品已被购买");
        }
        if (goods.getGoodsStatus() == GoodsStatusEnum.IN_PROGRESS.getCode()) {
            throw new BusinessException("商品正在交易中");
        }
        return goods;
    }

    /**
     *获取学生
     *
     * @param studentNo 学生编号
     * @return {@link Student}
     */
    @Override
    public Student getStudentByStudentNo(String studentNo) {

        return studentDao.selectStudentByStudentNo(studentNo);
    }

    /**
     * 按商品名称选择
     *
     * @param query    查询
     * @param page     页
     * @param pageSize 页面大小
     * @return {@link List}<{@link Goods}>
     */
    @Override
    public List<Goods> selectByGoodsName(String query, int page, int pageSize) {
        System.out.println("query: " + query + "page: " + page + "pageSize: " + pageSize);
        return goodsDao.selectByGoodsName(query, (page - 1) * pageSize, pageSize);
    }

    /**
     * 未审核
     *
     * @param isSearching 正在搜索
     * @param goodsName   商品名称
     * @param studentNo   学生编号
     * @param currentPage 当前页面
     * @return {@link OrderInformationPageResult}
     */
    @Override
    public OrderInformationPageResult getNotReviewed(boolean isSearching, String goodsName, String studentNo, int currentPage) {
        OrderInformationPageResult result = new OrderInformationPageResult();
        List<OrderInformation> informationList = null;
        if (isSearching) {
            result.setTotalPage(Math.ceilDiv(selectByStatusAndStudentNoAndGoodsNameTotalCnt(ReviewStatusEnum.PENDING.getCode(), studentNo, goodsName), MANAGE_PAGE_SIZE));
            result.setTotalCount(selectByStatusAndStudentNoAndGoodsNameTotalCnt(ReviewStatusEnum.PENDING.getCode(), studentNo, goodsName));
            if (currentPage + 1 > result.getTotalPage() && currentPage != 0) {
                currentPage = result.getTotalPage() - 1;
            }
            informationList = selectByStatusAndStudentNoAndGoodsName(ReviewStatusEnum.PENDING.getCode(), studentNo, goodsName, currentPage, MANAGE_PAGE_SIZE);
        } else {
            result.setTotalPage(Math.ceilDiv(selectByStatusAndStudentNoTotalCnt(ReviewStatusEnum.PENDING.getCode(), studentNo), MANAGE_PAGE_SIZE));
            result.setTotalCount(selectByStatusAndStudentNoTotalCnt(ReviewStatusEnum.PENDING.getCode(), studentNo));
            if (currentPage + 1 > result.getTotalPage() && currentPage != 0) {
                currentPage = result.getTotalPage() - 1;
            }
            informationList = selectByStatusAndStudentNo(ReviewStatusEnum.PENDING.getCode(), studentNo, currentPage, MANAGE_PAGE_SIZE);
            for (OrderInformation orderInformation : informationList) {
                System.out.println(orderInformation.getGoods().getGoodsName());
            }
        }
        result.setOrderInformationList(informationList);
        return result;
    }

    /**
     * 未售卖
     *
     * @param isSearching 正在搜索
     * @param goodsName   商品名称
     * @param studentNo   学生编号
     * @param currentPage 当前页面
     * @return {@link OrderInformationPageResult}
     */
    @Override
    public OrderInformationPageResult getNotSold(boolean isSearching, String goodsName, String studentNo, int currentPage) {
        OrderInformationPageResult result = new OrderInformationPageResult();
        List<OrderInformation> informationList = null;
        if (isSearching) {
            result.setTotalPage(Math.ceilDiv(selectByGoodsStatusAndStudentNoAndGoodsNameTotalCnt(GoodsStatusEnum.NOT_SOLD.getCode(), studentNo, goodsName), MANAGE_PAGE_SIZE));
            result.setTotalCount(selectByGoodsStatusAndStudentNoAndGoodsNameTotalCnt(GoodsStatusEnum.NOT_SOLD.getCode(), studentNo, goodsName));
            if (currentPage + 1 > result.getTotalPage() && currentPage != 0) {
                currentPage = result.getTotalPage() - 1;
            }
            informationList = selectByGoodsStatusAndStudentNoAndGoodsName(GoodsStatusEnum.NOT_SOLD.getCode(), studentNo, goodsName, currentPage, MANAGE_PAGE_SIZE);
        } else {
            result.setTotalPage(Math.ceilDiv(selectByGoodsStatusAndStudentNoTotalCnt(GoodsStatusEnum.NOT_SOLD.getCode(), studentNo), MANAGE_PAGE_SIZE));
            result.setTotalCount(selectByGoodsStatusAndStudentNoTotalCnt(GoodsStatusEnum.NOT_SOLD.getCode(), studentNo));
            if (currentPage + 1 > result.getTotalPage() && currentPage != 0) {
                currentPage = result.getTotalPage() - 1;
            }
            informationList = selectByGoodsStatusAndStudentNo(GoodsStatusEnum.NOT_SOLD.getCode(), studentNo, currentPage, MANAGE_PAGE_SIZE);
        }
        result.setOrderInformationList(informationList);
        return result;
    }

    /**
     * 获得已出售
     *
     * @param isSearching 正在搜索
     * @param goodsName   商品名称
     * @param studentNo   学生编号
     * @param currentPage 当前页面
     * @return {@link OrderInformationPageResult}
     */
    @Override
    public OrderInformationPageResult getSold(boolean isSearching, String goodsName, String studentNo, int currentPage) {
        OrderInformationPageResult result = new OrderInformationPageResult();
        List<OrderInformation> informationList = null;
        if (isSearching) {
            result.setTotalPage(Math.ceilDiv(selectByGoodsStatusAndStudentNoAndGoodsNameTotalCnt(GoodsStatusEnum.SOLD.getCode(), studentNo, goodsName), PAGE_SIZE));
            result.setTotalCount(selectByGoodsStatusAndStudentNoAndGoodsNameTotalCnt(GoodsStatusEnum.SOLD.getCode(), studentNo, goodsName));
            if (currentPage + 1 > result.getTotalPage() && currentPage != 0) {
                currentPage = result.getTotalPage() - 1;
            }
            informationList = selectByGoodsStatusAndStudentNoAndGoodsName(GoodsStatusEnum.SOLD.getCode(), studentNo, goodsName, currentPage, PAGE_SIZE);
            return result;
        } else {
            result.setTotalPage(Math.ceilDiv(selectByGoodsStatusAndStudentNoTotalCnt(GoodsStatusEnum.SOLD.getCode(), studentNo), PAGE_SIZE));
            result.setTotalCount(selectByGoodsStatusAndStudentNoTotalCnt(GoodsStatusEnum.SOLD.getCode(), studentNo));
            if (currentPage + 1 > result.getTotalPage() && currentPage != 0) {
                currentPage = result.getTotalPage() - 1;
            }
            informationList = selectByGoodsStatusAndStudentNo(GoodsStatusEnum.SOLD.getCode(), studentNo, currentPage, PAGE_SIZE);
            result.setOrderInformationList(informationList);
            return result;
        }
    }

    /**
     * 获取我的购买
     *
     * @param isSearching 正在搜索
     * @param goodsName   商品名称
     * @param studentNo   学生编号
     * @param currentPage 当前页面
     * @return {@link OrderInformationPageResult}
     */
    @Override
    public OrderInformationPageResult getMyPurchase(boolean isSearching, String goodsName, String studentNo, int currentPage) {
        OrderInformationPageResult result = new OrderInformationPageResult();
        List<OrderInformation> informationList = new ArrayList<>();
        List<Orders> ordersList = ordersDao.getByBuyerId(Integer.valueOf(studentNo));
        for (Orders orders : ordersList) {
            Goods goods = goodsDao.selectById(orders.getGoodsId());
            OrderInformation orderInformation = new OrderInformation();
            orderInformation.setGoods(goods);
            Student seller = studentDao.selectStudentByStudentNo(orders.getSellerId().toString());
            Student buyer = studentDao.selectStudentByStudentNo(orders.getBuyerId().toString());
            orderInformation.setSeller(seller);
            orderInformation.setBuyer(buyer);
            orderInformation.setOrderId(orders.getId());
            orderInformation.setSellerConfirm(orders.getSellerConfirm());
            orderInformation.setBuyerConfirm(orders.getBuyerConfirm());
            orderInformation.setIsCancel(orders.getIsCancel());

            informationList.add(orderInformation);
        }
        result.setOrderInformationList(informationList);
        result.setTotalCount(ordersList.size());
        return result;
    }

    /**
     * 进行中的商品
     *
     * @param isSearching 正在搜索
     * @param goodsName   商品名称
     * @param studentNo   学生编号
     * @param currentPage 当前页面
     * @return {@link OrderInformationPageResult}
     */
    @Override
    public OrderInformationPageResult getInProgress(boolean isSearching, String goodsName, String studentNo, int currentPage) {
        OrderInformationPageResult result = new OrderInformationPageResult();
        List<OrderInformation> informationList = new ArrayList<>();
        if (isSearching) {
            result.setTotalPage(Math.ceilDiv(selectByGoodsStatusAndStudentNoAndGoodsNameTotalCnt(GoodsStatusEnum.IN_PROGRESS.getCode(), studentNo, goodsName), PAGE_SIZE));
            result.setTotalCount(selectByGoodsStatusAndStudentNoAndGoodsNameTotalCnt(GoodsStatusEnum.IN_PROGRESS.getCode(), studentNo, goodsName));
            if (currentPage + 1 > result.getTotalPage() && currentPage != 0) {
                currentPage = result.getTotalPage() - 1;
            }
            informationList = selectByGoodsStatusAndStudentNoAndGoodsName(GoodsStatusEnum.IN_PROGRESS.getCode(), studentNo, goodsName, currentPage, PAGE_SIZE);
        } else {
            result.setTotalPage(Math.ceilDiv(selectByGoodsStatusAndStudentNoTotalCnt(GoodsStatusEnum.IN_PROGRESS.getCode(), studentNo), PAGE_SIZE));
            result.setTotalCount(selectByGoodsStatusAndStudentNoTotalCnt(GoodsStatusEnum.IN_PROGRESS.getCode(), studentNo));
            if (currentPage + 1 > result.getTotalPage() && currentPage != 0) {
                currentPage = result.getTotalPage() - 1;
            }
            informationList = selectByGoodsStatusAndStudentNo(GoodsStatusEnum.IN_PROGRESS.getCode(), studentNo, currentPage, PAGE_SIZE);
        }
        result.setOrderInformationList(informationList);
        return result;
    }

    /**
     * 审核失败
     *
     * @param isSearching 正在搜索
     * @param goodsName   商品名称
     * @param studentNo   学生编号
     * @param currentPage 当前页面
     * @return {@link OrderInformationPageResult}
     */
    @Override
    public OrderInformationPageResult getReviewedFail(boolean isSearching, String goodsName, String studentNo, int currentPage) {
        OrderInformationPageResult result = new OrderInformationPageResult();
        List<OrderInformation> informationList = null;
        if (isSearching) {
            result.setTotalPage(Math.ceilDiv(selectByStatusAndStudentNoAndGoodsNameTotalCnt(ReviewStatusEnum.REVIEW_FAIL.getCode(), studentNo, goodsName), PAGE_SIZE));
            result.setTotalCount(selectByStatusAndStudentNoAndGoodsNameTotalCnt(ReviewStatusEnum.REVIEW_FAIL.getCode(), studentNo, goodsName));
            if (currentPage + 1 > result.getTotalPage() && currentPage != 0) {
                currentPage = result.getTotalPage() - 1;
            }
            informationList = selectByStatusAndStudentNoAndGoodsName(ReviewStatusEnum.REVIEW_FAIL.getCode(), studentNo, goodsName, currentPage, PAGE_SIZE);
        } else {
            result.setTotalPage(Math.ceilDiv(selectByStatusAndStudentNoTotalCnt(ReviewStatusEnum.REVIEW_FAIL.getCode(), studentNo), PAGE_SIZE));
            result.setTotalCount(selectByStatusAndStudentNoTotalCnt(ReviewStatusEnum.REVIEW_FAIL.getCode(), studentNo));
            if (currentPage + 1 > result.getTotalPage() && currentPage != 0) {
                currentPage = result.getTotalPage() - 1;
            }
            informationList = selectByStatusAndStudentNo(ReviewStatusEnum.REVIEW_FAIL.getCode(), studentNo, currentPage, PAGE_SIZE);
            for (OrderInformation orderInformation : informationList) {
                System.out.println(orderInformation.getGoods().getGoodsName());
            }
        }
        result.setOrderInformationList(informationList);
        return result;
    }

    /**
     * 非法操作
     *
     * @param goodsId   商品编号
     * @param studentNo 学生编号
     */
    @Override
    public void offShelf(Integer goodsId, String studentNo) {
        Goods goods = goodsDao.selectById(goodsId);
        if (goods == null) {
            throw new BusinessException("商品不存在");
        }
        if (!goods.getStudentNo().equals(studentNo)) {
            throw new BusinessException("非法操作");
        }
        if (goods.getGoodsStatus() == GoodsStatusEnum.SOLD.getCode()) {
            throw new BusinessException("商品已售出，不能下架");
        }
        goodsDao.logicDeleteGoods(goodsId);
    }

    /**
     * 编辑商品
     *
     * @param goods 货物
     */
    @Override
    public void editGoods(Goods goods) {
        goodsDao.editGoods(goods);
        goodsDao.setStatus(goods.getId(), ReviewStatusEnum.PENDING.getCode());
    }

    /**
     * 获得销售
     *
     * @param cate 凯特
     * @return double
     */
    @Override
    public double getSales(int cate) {
        return goodsDao.getSales(String.valueOf(cate));
    }
}


