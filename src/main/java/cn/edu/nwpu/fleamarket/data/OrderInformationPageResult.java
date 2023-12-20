package cn.edu.nwpu.fleamarket.data;

import cn.edu.nwpu.fleamarket.pojo.Goods;
import cn.edu.nwpu.fleamarket.pojo.Student;
import lombok.Data;

import java.util.List;

/**
 * 订单信息页面结果
 *
 * @author lsy
 * @date 2023/12/15
 */
@Data
public class OrderInformationPageResult {
    /**
     * 总页数
     */
    private int totalPage;

    /**
     * 总数
     */
    private int totalCount;

    /**
     * 订单信息列表
     */
    private List<OrderInformation> orderInformationList;

}
