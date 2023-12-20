package cn.edu.nwpu.fleamarket.dao;

import cn.edu.nwpu.fleamarket.pojo.Student;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 学生
 *
 * @author lsy
 * @date 2023/12/15
 */

public interface StudentDao {
    /**
     * 添加学生
     *
     * @param student 学生
     */// ADD
    void addStudent(Student student);

    /**
     * 更新名称
     *
     * @param student 学生
     */// UPDATE
    void updateName(Student student);

    /**
     * 更新手机
     *
     * @param student 学生
     */
    void updatePhone(Student student);

    /**
     * 更新电子邮件
     *
     * @param student 学生
     */
    void updateEmail(Student student);

    /**
     * 更新微信
     *
     * @param student 学生
     */
    void updateWechat(Student student);

    /**
     * 按学生编号选择学生
     *
     * @param studentNo 学生编号
     * @return {@link Student}
     */// SELECT
    Student selectStudentByStudentNo(String studentNo);


    /**
     * 学生总数
     *
     * @return int
     */
    @Select("SELECT count(*) FROM students")
    int countAll();

    /**
     * 分页
     *
     * @param start 起始id
     * @return {@link List}<{@link Student}>
     */
    @Select("SELECT * from students LIMIT #{start}, 6")
    @Results(id = "studentResultMap" ,value = {
            @Result(column = "student_no", property = "studentNo"),
    })
    List<Student> getStudentsByPage(int start);

    /**
     * 更新用户信息
     *
     * @param student 更新的内容
     */
    @Update("UPDATE students set name = #{name}, password = #{password}, email = #{email}, " +
            "phone = #{phone}, wechat = #{wechat}, qq = #{qq}, department = #{department} where id = #{id}")
    void update(Student student);

    /**
     * 按用户名查找
     *
     * @param query 查询语句
     * @return {@link List}<{@link Student}>
     */
    @Select("SELECT * from students where name like #{query}")
    @ResultMap("studentResultMap")
    List<Student> queryByUsername(String query);


    /**
     * 按学号查找
     *
     * @param query 查找信息
     * @return 查找结果
     */
    @Select("SELECT * from students where student_no like #{query}")
    @ResultMap("studentResultMap")
    List<Student> queryByStudentNo(String query);

    /**
     * 设置 img
     *
     * @param studentNo 学生编号
     */
    @Update("UPDATE students set img = 1 where student_no = #{studentNo}")
    void setImg(String studentNo);

    /**
     * 重置密码
     *
     * @param id 待重置学生id
     */
    @Update("UPDATE students set password = 'fleamarket' WHERE id = #{id}")
    void resetPw(int id);

    /**
     * 通过ID获取学生编号
     *
     * @param id 编号
     * @return {@link String}
     */
    @Select("SELECT student_no FROM students WHERE id = #{id}")
    String getStudentNoById(int id);
}










