package cn.edu.nwpu.fleamarket.data;

import lombok.Data;

/**
 * 用于审核商品传递数据
 *
 * @author lsy
 * @date 2023/12/15
 */
@Data
public class Review {
    /**
     * 编号
     */
    private int id;
    /**
     * 商品审核状态
     */
    private int status;
}
