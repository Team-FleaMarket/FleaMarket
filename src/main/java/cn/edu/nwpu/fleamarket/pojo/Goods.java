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
    private String goodsName;
    private String description;
    private double price;
    private int status;
    private String cate;
    private String imagePath;
    private int goodsStatus;
    private String degree;

}
