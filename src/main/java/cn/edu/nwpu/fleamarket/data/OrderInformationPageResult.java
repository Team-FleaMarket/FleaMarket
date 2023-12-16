package cn.edu.nwpu.fleamarket.data;

import cn.edu.nwpu.fleamarket.pojo.Goods;
import cn.edu.nwpu.fleamarket.pojo.Student;
import lombok.Data;

import java.util.List;

@Data
public class OrderInformationPageResult {
    private int totalPage;

    private int totalCount;

    private List<OrderInformation> orderInformationList;

}
