package cn.edu.nwpu.fleamarket.service.impl;


import cn.edu.nwpu.fleamarket.dao.AdminDao;
import cn.edu.nwpu.fleamarket.pojo.Admin;
import cn.edu.nwpu.fleamarket.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminDao adminDao;

    @Override
    public boolean login(Admin admin) {
        Admin admin1 = adminDao.login(admin);
        return (admin1 != null);
    }
}
