package cn.edu.nwpu.fleamarket.service.impl;


import cn.edu.nwpu.fleamarket.dao.AdminDao;
import cn.edu.nwpu.fleamarket.pojo.Admin;
import cn.edu.nwpu.fleamarket.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 管理服务实现
 *
 * @author lsy
 * @date 2023/12/15
 */
@Service
public class AdminServiceImpl implements AdminService {
    /**
     * 管理员
     */
    @Autowired
    AdminDao adminDao;

    /**
     * 登录
     *
     * @param admin 管理
     * @return boolean
     */
    @Override
    public boolean login(Admin admin) {
        Admin admin1 = adminDao.login(admin);
        return (admin1 != null);
    }

    /**
     * 通过用户名获取
     *
     * @param username 用户名
     * @return {@link String}
     */
    @Override
    public String getPwByUsername(String username) {
        return adminDao.getPwByUsername(username);
    }

    /**
     * 更新
     *
     * @param username 用户名
     * @param newPw    新名字
     */
    @Override
    public void updatePw(String username, String newPw) {
        adminDao.updatePw(username, newPw);
    }

    /**
     * 添加管理员
     *
     * @param admin 管理员
     * @return boolean
     */
    @Override
    public boolean addAdmin(Admin admin) {
        Admin admin1 = adminDao.getByUsername(admin.getUsername());
        if(admin1 != null) {
            return false;
        }
        adminDao.addAdmin(admin);
        return true;
    }

    /**
     * 删除
     *
     * @param username 用户名
     * @return boolean
     */
    @Override
    public boolean delete(String username) {
        int num = adminDao.delete(username);
        return (num == 1);
    }

    /**
     * 获取全部管理
     *
     * @return {@link List}<{@link Admin}>
     */
    @Override
    public List<Admin> getAll() {
        return adminDao.getAll();
    }

    /**
     * 按用户名查询
     *
     * @param query 查询
     * @return {@link List}<{@link Admin}>
     */
    @Override
    public List<Admin> queryByUsername(String query) {
        return adminDao.queryByUsername(query);
    }
}
