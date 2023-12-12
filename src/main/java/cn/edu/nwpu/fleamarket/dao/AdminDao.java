package cn.edu.nwpu.fleamarket.dao;

import cn.edu.nwpu.fleamarket.pojo.Admin;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface AdminDao {

    /**
     * 登录
     * @param admin admin对象
     * @return
     */
    @Select("SELECT * FROM admin where username = #{username} and password = #{password}")
    Admin login(Admin admin);

    /**
     * 根据用户名查询密码
     * @param username 用户名
     * @return 密码
     */
    @Select("SELECT password FROM admin where username = #{username}")
    String getPwByUsername(String username);

    /**
     * 修改密码
     * @param username 用户名
     * @param npw 新密码
     */
    @Update("UPDATE admin SET password = #{npw} where username = #{username}")
    void updatePw(@Param("username") String username, @Param("npw") String npw);

}
