package cn.edu.nwpu.fleamarket.dao;

import cn.edu.nwpu.fleamarket.pojo.Student;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Author: Hanwen
 * @Date: 2018/4/5 下午3:08
 */

public interface StudentDao {
    // ADD
    void addStudent(Student student);
    // UPDATE
    void updateName(Student student);
    void updatePhone(Student student);
    void updateEmail(Student student);
    void updateWechat(Student student);
    // SELECT
    Student selectStudentByStudentNo(String studentNo);


    @Select("SELECT count(*) FROM students")
    int countAll();


    /**
     * 分页
     * @param start 起始id
     * @return
     */
    @Select("SELECT * from students LIMIT #{start}, 6")
    @Results({
            @Result(column = "student_no", property = "studentNo"),
    })
    List<Student> getStudentsByPage(int start);

    /**
     * 更新用户信息
     * @param student 更新的内容
     */
    @Update("UPDATE students set name = #{name}, password = #{password}, email = #{email}, " +
            "phone = #{phone}, wechat = #{wechat} where id = #{id}")
    void update(Student student);

    /**
     * 按用户名查找
     * @param query 查询语句
     */
    @Select("SELECT * from students where name like #{query}")
    @Results({
            @Result(column = "student_no", property = "studentNo"),
    })
    List<Student> queryByUsername(String query);


    /**
     * 按学号查找
     * @param query
     * @return
     */
    @Select("SELECT * from students where student_no like #{query}")
    @Results({
            @Result(column = "student_no", property = "studentNo"),
    })
    List<Student> queryByStudentNo(String query);
}










