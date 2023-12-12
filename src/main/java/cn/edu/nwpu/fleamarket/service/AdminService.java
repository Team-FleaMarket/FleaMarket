package cn.edu.nwpu.fleamarket.service;

import cn.edu.nwpu.fleamarket.pojo.Admin;

/**
 * admin service接口
 */
public interface AdminService {
    /**
     * 登录
     * @param admin admin 用户名和密码
     * @return 结果
     */
    boolean login(Admin admin);

    /**
     * 根据username获取密码
     * @param username username
     * @return 密码
     */
    String getPwByUsername(String username);

    /**
     * 更新密码
     * @param username 用户名
     * @param newPw 新密码
     */
    void updatePw(String username, String newPw);
}
