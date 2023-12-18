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



@Service
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private GoodsDao goodsDao;

    @Autowired
    private StudentDao studentDao;

    @Autowired
    private OrdersDao ordersDao;

    private static final int PAGE_SIZE = 24;
    private static final int MANAGE_PAGE_SIZE = 5;


    public List<Goods> selectAllGoods() {
        return goodsDao.selectAllGoods();
    }

    public Integer selectCountByCateList(List<Integer> cateList) {
        Integer count = goodsDao.selectCountByCateList(cateList);
        if (count == null) {
            return 0;
        }
        return count;
    }

    public List<Goods> selectByStatus(int status) {
        return goodsDao.selectByStatus(status);
    }

    public List<Goods> selectByStudentNo(String studentNo) {
        return goodsDao.selectByStudentNo(studentNo);
    }

    public Goods selectById(int id) {
        return goodsDao.selectById(id);
    }

    public void insertGoods(Goods goods) {
        goodsDao.insertGoods(goods);
    }

    public void deleteGoods(int id) {
        goodsDao.deleteGoods(id);
    }

    public void updateGoods(Goods goods) {
        goodsDao.updateGoods(goods);
    }

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

//    public List<Goods> selectByGoodsStatusAndStudentNo(int goodsStatus, String studentNo) {
//        Goods goods = new Goods();
//        goods.setGoodsStatus(goodsStatus);
//        goods.setStudentNo(studentNo);
//        System.out.println("select");
//        return goodsDao.selectByGoodsStatusAndStudentNo(goods,offset,pagesize);
//    }

    public void updateGoodsStatus(Goods goods) {
        goodsDao.updateGoodsStatus(goods);
    }

    public List<Goods> selectByStatusAndGoodsStatus() {
        return goodsDao.selectByStatusAndGoodsStatus();
    }

    @Override
    public Goods getNextToBeReviewed() {
        return goodsDao.getNextToBeReviewed();
    }

    @Override
    public void setAttributed(int id) {
        goodsDao.setAttributed(id);
    }

    @Override
    public void setUnAttributed(int id) {
        goodsDao.setUnAttributed(id);
    }

    @Override
    public List<Goods> getAllAttributedGoodsNotReviewed() {
        return goodsDao.getAllAttributedGoodsNotReviewed();
    }

    @Override
    public boolean review(int id, int status) {
        try {
            goodsDao.review(id, status);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    public List<Goods> getGoodsByCategory(int cate, int pageNum, int pageSize) {
        return goodsDao.getGoodsByCategoryPages(cate, (pageNum - 1) * pageSize, pageSize);
    }

    @Override
    public int selectByStatusAndStudentNoTotalCnt(int status, String studentNo) {
        return goodsDao.selectByStatusAndStudentNoTotalCnt(status, studentNo);
    }

    @Override
    public int selectByGoodsStatusAndStudentNoTotalCnt(int goodsStatus, String studentNo) {
        return goodsDao.selectByGoodsStatusAndStudentNoTotalCnt(goodsStatus, studentNo);
    }

    @Override
    public int getSoldTotalCnt() {
        return goodsDao.getSoldNumber();
    }

    @Override
    public List<Goods> getSoldByPage(int page) {
        return goodsDao.getSoldGoodsByPage((page - 1) * 6);
    }

    @Override
    public List<Goods> getAllSoldGoods() {
        return goodsDao.getAllSoldGoods();
    }

    @Override
    public List<Goods> getSoldGoodsByDate(Date start, Date end) {
        return goodsDao.getSoldGoodsByDate(start, end);
    }

    @Override
    public List<Goods> querySoldBySno(String query) {
        return goodsDao.querySoldBySno(query);
    }

    @Override
    public List<Goods> querySoldByBno(String query) {
        return goodsDao.querySoldByBno(query);
    }
    public int selectByStatusAndStudentNoAndGoodsNameTotalCnt(Integer status, String studentNo, String goodsName) {
        return goodsDao.selectByStatusAndStudentNoAndGoodsNameTotalCnt(status, studentNo, goodsName);
    }

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

    @Override
    public int selectByGoodsStatusAndStudentNoAndGoodsNameTotalCnt(Integer goodsStatus, String studentNo, String goodsName) {
        return goodsDao.selectByGoodsStatusAndStudentNoAndGoodsNameTotalCnt(goodsStatus, studentNo, goodsName);
    }

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

    @Override
    public Student getStudentByStudentNo(String studentNo) {

        return studentDao.selectStudentByStudentNo(studentNo);
    }

    @Override
    public List<Goods> selectByGoodsName(String query, int page, int pageSize) {
        System.out.println("query: " + query + "page: " + page + "pageSize: " + pageSize);
        return goodsDao.selectByGoodsName(query, (page - 1) * pageSize, pageSize);
    }

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

    @Override
    public OrderInformationPageResult getInProgress(boolean isSearching, String goodsName, String studentNo, int currentPage) {
        OrderInformationPageResult result = new OrderInformationPageResult();
        List<OrderInformation> informationList = new ArrayList<>();
        if (isSearching) {
            result.setTotalPage(Math.ceilDiv(selectByGoodsStatusAndStudentNoAndGoodsNameTotalCnt(GoodsStatusEnum.IN_PROGRESS.getCode(), studentNo, goodsName),PAGE_SIZE));
            result.setTotalCount(selectByGoodsStatusAndStudentNoAndGoodsNameTotalCnt(GoodsStatusEnum.IN_PROGRESS.getCode(), studentNo, goodsName));
            if (currentPage + 1 > result.getTotalPage() && currentPage != 0) {
                currentPage = result.getTotalPage() - 1;
            }
            informationList = selectByGoodsStatusAndStudentNoAndGoodsName(GoodsStatusEnum.IN_PROGRESS.getCode(), studentNo, goodsName, currentPage, PAGE_SIZE);
        } else {
            result.setTotalPage(Math.ceilDiv(selectByGoodsStatusAndStudentNoTotalCnt(GoodsStatusEnum.IN_PROGRESS.getCode(), studentNo),PAGE_SIZE));
            result.setTotalCount(selectByGoodsStatusAndStudentNoTotalCnt(GoodsStatusEnum.IN_PROGRESS.getCode(), studentNo));
            if (currentPage + 1 > result.getTotalPage() && currentPage != 0) {
                currentPage = result.getTotalPage() - 1;
            }
            informationList = selectByGoodsStatusAndStudentNo(GoodsStatusEnum.IN_PROGRESS.getCode(), studentNo, currentPage, PAGE_SIZE);
        }
        result.setOrderInformationList(informationList);
        return result;
    }

    @Override
    public OrderInformationPageResult getReviewedFail(boolean isSearching, String goodsName, String studentNo, int currentPage) {
        OrderInformationPageResult result = new OrderInformationPageResult();
        List<OrderInformation> informationList = null;
        if (isSearching) {
            result.setTotalPage(Math.ceilDiv(selectByStatusAndStudentNoAndGoodsNameTotalCnt(ReviewStatusEnum.REVIEW_FAIL.getCode(), studentNo, goodsName),PAGE_SIZE)) ;
            result.setTotalCount(selectByStatusAndStudentNoAndGoodsNameTotalCnt(ReviewStatusEnum.REVIEW_FAIL.getCode(), studentNo, goodsName));
            if (currentPage + 1 > result.getTotalPage() && currentPage != 0) {
                currentPage = result.getTotalPage() - 1;
            }
            informationList = selectByStatusAndStudentNoAndGoodsName(ReviewStatusEnum.REVIEW_FAIL.getCode(), studentNo, goodsName, currentPage, PAGE_SIZE);
        } else {
            result.setTotalPage(Math.ceilDiv(selectByStatusAndStudentNoTotalCnt(ReviewStatusEnum.REVIEW_FAIL.getCode(),studentNo),PAGE_SIZE));
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

    @Override
    public void editGoods(Goods goods) {
        goodsDao.editGoods(goods);
        goodsDao.setStatus(goods.getId(), ReviewStatusEnum.PENDING.getCode());
    }

    @Override
    public double getSales(int cate) {
        return goodsDao.getSales(String.valueOf(cate));
    }
}


