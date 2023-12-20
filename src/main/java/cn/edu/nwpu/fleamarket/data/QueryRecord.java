package cn.edu.nwpu.fleamarket.data;

import lombok.Data;

import java.util.Date;

/**
 * 记录查询
 *
 * @author lsy
 * @date 2023/12/15
 */
@Data
public class QueryRecord {
    /**
     * 类型
     * 1：购买者学号 0：出售者学号
     */
    int type;
    /**
     * 查询
     */
    String query;
    /**
     * 开始
     */
    Date start;
    /**
     * 结束
     */
    Date end;
}
