package cn.edu.nwpu.fleamarket.data;

import cn.edu.nwpu.fleamarket.pojo.Goods;
import cn.edu.nwpu.fleamarket.pojo.Student;
import lombok.Data;

/**
 * 商品项
 *
 * @author lsy
 * @date 2023/12/15
 */
@Data
public class GoodsItem {
    /**
     * 商品
     */
    private Goods goods;

    /**
     * 学生
     */
    private Student student;

    /**
     * 购物车
     */
    private Boolean inCart;

}
