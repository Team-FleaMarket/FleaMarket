package cn.edu.nwpu.fleamarket.data;

import lombok.Data;

import java.util.Date;

/**
 * 记录查询
 */
@Data
public class QueryRecord {
    int type; //1：购买者学号 0：出售者学号
    String query; //学号查询语句
    Date start;
    Date end;
}
