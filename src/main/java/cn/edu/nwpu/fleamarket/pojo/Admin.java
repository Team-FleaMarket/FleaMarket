package cn.edu.nwpu.fleamarket.pojo;

import lombok.Data;

/**
 * 管理
 *
 * @author lsy
 * @date 2023/12/15
 */
@Data
public class Admin {
    /**
     * 编号
     */
    private int id;
    /**
     * 管理员名
     */
    private String username;
    /**
     * 密码
     */
    private String password;
}
