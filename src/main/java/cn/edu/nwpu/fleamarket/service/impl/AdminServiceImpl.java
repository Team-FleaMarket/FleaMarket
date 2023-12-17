package cn.edu.nwpu.fleamarket.service.impl;


import cn.edu.nwpu.fleamarket.dao.AdminDao;
import cn.edu.nwpu.fleamarket.pojo.Admin;
import cn.edu.nwpu.fleamarket.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminDao adminDao;

    @Override
    public boolean login(Admin admin) {
        Admin admin1 = adminDao.login(admin);
        return (admin1 != null);
    }

    @Override
    public String getPwByUsername(String username) {
        return adminDao.getPwByUsername(username);
    }

    @Override
    public void updatePw(String username, String newPw) {
        adminDao.updatePw(username, newPw);
    }

    @Override
    public boolean addAdmin(Admin admin) {
        Admin admin1 = adminDao.getByUsername(admin.getUsername());
        if(admin1 != null) {
            return false;
        }
        adminDao.addAdmin(admin);
        return true;
    }

    @Override
    public boolean delete(String username) {
        int num = adminDao.delete(username);
        return (num == 1);
    }

    @Override
    public List<Admin> getAll() {
        return adminDao.getAll();
    }

    @Override
    public List<Admin> queryByUsername(String query) {
        return adminDao.queryByUsername(query);
    }
}
