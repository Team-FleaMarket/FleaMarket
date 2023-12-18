package cn.edu.nwpu.fleamarket.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.text.SimpleDateFormat;
import java.util.Date;



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
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date saleTime; //交易时间
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date addedTime; //上架时间
    String pattern = "yyyy年MM月dd日";
    // 创建 SimpleDateFormat 对象，并设置日期格式
    SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
    private Integer isDelete;
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
