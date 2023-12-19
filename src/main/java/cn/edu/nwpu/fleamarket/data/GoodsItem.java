package cn.edu.nwpu.fleamarket.data;

import cn.edu.nwpu.fleamarket.pojo.Goods;
import cn.edu.nwpu.fleamarket.pojo.Student;
import lombok.Data;

@Data
public class GoodsItem {
    private Goods goods;

    private Student student;

    private Boolean inCart;

}
