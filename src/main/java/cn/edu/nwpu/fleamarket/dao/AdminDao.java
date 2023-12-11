package cn.edu.nwpu.fleamarket.dao;

import cn.edu.nwpu.fleamarket.pojo.Admin;
import org.apache.ibatis.annotations.Select;

public interface AdminDao {

    /**
     * 登录
     * @param admin admin对象
     * @return
     */
    @Select("SELECT * FROM admin where username = #{username} and password = #{password}")
    Admin login(Admin admin);
}
