package cn.edu.nwpu.fleamarket.service.impl;

import cn.edu.nwpu.fleamarket.dao.GoodsDao;
import cn.edu.nwpu.fleamarket.pojo.Goods;
import cn.edu.nwpu.fleamarket.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: Hanwen
 * @Date: 2018/6/7 下午4:36
 */
@Service
public class GoodsServiceImpl implements GoodsService{

    @Autowired
    private GoodsDao goodsDao;

    public List<Goods> selectAllGoods() {
        return goodsDao.selectAllGoods();
    }

    public int selectCountByCateList(List<Integer> cateList) {
        if (goodsDao.selectCountByCateList(cateList) == null) {
            return 0;
        }
        return goodsDao.selectCountByCateList(cateList);
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

    public List<Goods> selectByStatusAndStudentNo(int status, String studentNo) {
        Goods goods = new Goods();
        goods.setStatus(status);
        goods.setStudentNo(studentNo);
        return goodsDao.selectByStatusAndStudentNo(goods);
    }

    public void updateGoodsStatus(Goods goods) {
        goodsDao.updateGoodsStatus(goods);
    }

    public List<Goods> selectByStatusAndGoodsStatus() {
        return goodsDao.selectByStatusAndGoodsStatus();
    }

    @Override
    public List<Goods> getGoodsByCategory(int cate, int pageNum, int pageSize) {
        System.out.println("cate: " + cate + " pageNum: " + pageNum + " pageSize: " + pageSize);
        return goodsDao.getGoodsByCategoryPages(cate, pageNum*pageSize, pageSize);
    }
}
