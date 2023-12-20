package cn.edu.nwpu.fleamarket.service;

import cn.edu.nwpu.fleamarket.pojo.Admin;

import java.util.List;

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

    /**
     * 添加管理员
     * @param admin 新管理员
     */
    boolean addAdmin(Admin admin);

    /**
     * 删除管理员
     * @param username 待删管理员用户名
     */
    boolean delete(String username);
    /**
     * 获取所有管理员
     */
    List<Admin> getAll();
    /**
     * 查询管理员
     * @param query 查询语句
     */
    List<Admin> queryByUsername(String query);
}
