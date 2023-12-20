package cn.edu.nwpu.fleamarket.dao;

import cn.edu.nwpu.fleamarket.pojo.Admin;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * 管理员
 *
 * @author lsy
 * @date 2023/12/15
 */
public interface AdminDao {

    /**
     * 登录
     *
     * @param admin admin对象
     * @return {@link Admin}
     */
    @Select("SELECT * FROM admin where username = #{username} and password = #{password}")
    Admin login(Admin admin);

    /**
     * 根据用户名查询密码
     *
     * @param username 用户名
     * @return 密码
     */
    @Select("SELECT password FROM admin where username = #{username}")
    String getPwByUsername(String username);

    /**
     * 修改密码
     *
     * @param username 用户名
     * @param npw      新密码
     */
    @Update("UPDATE admin SET password = #{npw} where username = #{username}")
    void updatePw(@Param("username") String username, @Param("npw") String npw);


    /**
     * 添加管理员
     *
     * @param admin 管理
     */
    @Insert("INSERT INTO admin values(null, #{username}, #{password})")
    void addAdmin(Admin admin);

    /**
     * 通过用户名查找管理员
     *
     * @param username 用户名
     * @return {@link Admin}
     */
    @Select("SELECT * FROM admin WHERE username = #{username}")
    Admin getByUsername(String username);

    /**
     * 删除管理员根据用户名
     *
     * @param username 用户名
     * @return int
     */
    @Delete("DELETE FROM admin WHERE username = #{username}")
    int delete(String username);

    /**
     * 获取所有的管理员
     *
     * @return {@link List}<{@link Admin}>
     */
    @Select("SELECT * FROM admin")
    List<Admin> getAll();

    /**
     * 按用户名查询
     *
     * @param query 查询
     * @return {@link List}<{@link Admin}>
     */
    @Select("SELECT * FROM admin WHERE username LIKE #{query}")
    List<Admin> queryByUsername(String query);
}
