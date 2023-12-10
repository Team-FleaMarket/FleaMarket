package cn.edu.nwpu.fleamarket.dao;

import cn.edu.nwpu.fleamarket.pojo.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @Author: Hanwen
 * @Date: 2018/4/5 下午3:08
 */

public interface UserDao {

    User selectByStudentNo(@Param("studentNo") String studentNo);
    void updateStudent(User student);
    void updatePwd(User user);
    void deleteStudent(Integer integer);
    User findManager(User user);
    void updateUserInformation(User user);

    public List<User> findAllUser();      //获取所有用户信息
    public User findAllUser(int id);       //根据id获取用户信息
    public void addStudent(User student);   //添加并保存用户
    public boolean login(User student);     //进行登陆

    @Select("SELECT count(*) FROM users")
    int countAll();


    /**
     * 分页
     * @param start 起始id
     * @return
     */
    @Select("SELECT * from users LIMIT #{start}, 6")
    @Results({
            @Result(column = "user_name", property = "userName"),
            @Result(column = "student_no", property = "studentNo"),
    })
    List<User> getUsersByPage(int start);

    /**
     * 更新用户信息
     * @param user
     */
    @Update("UPDATE users set user_name = #{userName}, password = #{password}, email = #{email}, " +
            "phone = #{phone}, wechat = #{wechat} where id = #{id}")
    void update(User user);

    /**
     * 按用户名查找
     * @param query 查询语句
     */
    @Select("SELECT * from users where user_name like #{query}")
    @Results({
            @Result(column = "user_name", property = "userName"),
            @Result(column = "student_no", property = "studentNo"),
    })
    List<User> queryByUsername(String query);


    /**
     * 按学号查找
     * @param query
     * @return
     */
    @Select("SELECT * from users where student_no like #{query}")
    @Results({
            @Result(column = "user_name", property = "userName"),
            @Result(column = "student_no", property = "studentNo"),
    })
    List<User> queryByStudentNo(String query);
}










