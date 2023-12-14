package cn.edu.nwpu.fleamarket.pojo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * @Author: Hanwen
 * @Date: 2018/6/7 下午4:28
 */

@Getter
@Setter
@NoArgsConstructor
public class Goods {
    private int id;
    private String studentNo;
    private String goodsName;
    private String description;
    private double price;
    private int status;
    /*
        商品分类
            <option value="1">教材</option>
            <option value="2">考试</option>
            <option value="3">文学</option>
            <option value="4">运动</option>
            <option value="5">文具</option>
            <option value="6">生活</option>
            <option value="7">美妆</option>
            <option value="8">电子产品</option>
     */
    private String cate;
    private String imagePath;
    private int goodsStatus;
    private String degree;
    private int attributed; //商品是否已被分配给管理员
    private String buyerNo; //买家学号
}
