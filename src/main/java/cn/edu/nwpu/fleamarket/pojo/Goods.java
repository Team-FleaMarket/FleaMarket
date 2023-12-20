package cn.edu.nwpu.fleamarket.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * 商品
 *
 * @author lsy
 * @date 2023/12/15
 */
@Getter
@Setter
@NoArgsConstructor
public class Goods {
    /**
     * 编号
     */
    private int id;
    /**
     * 发布者编号
     */
    private String studentNo;
    /**
     * 商品名称
     */
    private String goodsName;
    /**
     * 描述
     */
    private String description;
    /**
     * 价格
     */
    private double price;
    /**
     *审核状态
     *0待审核 1已审核
     *
     */
    private int status;
    /**
     *
     *商品分类
     *<option value="1">教材</option>
     *<option value="2">考试</option>
     *<option value="3">文学</option>
     *<option value="4">运动</option>
     *<option value="5">文具</option>
     *<option value="6">生活</option>
     *<option value="7">美妆</option>
     *<option value="8">电子产品</option>
     *
     */
    private String cate;
    /**
     * 图像路径
     */
    private String imagePath;
    /**
     *商品状态
     *0待出售 1已出售 2交易中
     *
     */
    private int goodsStatus;
    /**
     * 新旧度
     */
    private String degree;
    /**
     * 商品是否已被分配给管理员
     */
    private int attributed;
    /**
     * 买家学号
     */
    private String buyerNo;
    /**
     * 交易时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date saleTime;
    /**
     * 上架时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date addedTime;
    /**
     * 模式
     */
    String pattern = "yyyy年MM月dd日";
    /**
     * 创建 SimpleDateFormat 对象，并设置日期格式
     */
    SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
    /**
     * 是否被删除
     */
    private Integer isDelete;

    /**
     * 字符串
     *
     * @return {@link String}
     */
    @Override
    public String toString() {
        return "Goods{" +
                "id=" + id +
                ", studentNo='" + studentNo + '\'' +
                ", goodsName='" + goodsName + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", status=" + status +
                ", cate='" + cate + '\'' +
                ", imagePath='" + imagePath + '\'' +
                ", goodsStatus=" + goodsStatus +
                ", degree='" + degree + '\'' +
                ", attributed=" + attributed +
                ", buyerNo='" + buyerNo + '\'' +
                ", saleTime=" + saleTime +
                ", addedTime=" + addedTime +
                '}';
    }
}
