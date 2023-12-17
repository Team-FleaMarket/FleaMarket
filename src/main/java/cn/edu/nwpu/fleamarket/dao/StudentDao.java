package cn.edu.nwpu.fleamarket.dao;

import cn.edu.nwpu.fleamarket.pojo.Student;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * student mapper
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
    @Results(id = "studentResultMap" ,value = {
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
    @ResultMap("studentResultMap")
    List<Student> queryByUsername(String query);


    /**
     * 按学号查找
     * @param query 查找信息
     * @return 查找结果
     */
    @Select("SELECT * from students where student_no like #{query}")
    @ResultMap("studentResultMap")
    List<Student> queryByStudentNo(String query);

    @Update("UPDATE students set img = 1 where student_no = #{studentNo}")
    void setImg(String studentNo);

    /**
     * 重置密码
     * @param id 待重置学生id
     */
    @Update("UPDATE students set password = 'fleamarket' WHERE id = #{id}")
    void resetPw(int id);

    @Select("SELECT student_no FROM students WHERE id = #{id}")
    String getStudentNoById(int id);
}










