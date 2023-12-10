package cn.edu.nwpu.fleamarket.pojo;

import lombok.Getter;
import lombok.Setter;

/**
 * @Author: Hanwen
 * @Date: 2018/6/7 下午4:28
 */

@Getter
@Setter
public class Goods {
    private int id;
    private String studentNo;
    private String purchaserStudentNo;
    private String goodsName;
    private String description;
    private double price;
    /**
     * 待审核 0
     * 已审核 1
     * 未通过 -1
     *
     */
    private int status;

    /**
     * 出售状态
     */
    private int goodsStatus;
    /**
     * 类别
     */
    private String cate;
    private String imagePath;

    private String degree;
    /**
     * 当前物品数量
     */
    private int quantity;
}
