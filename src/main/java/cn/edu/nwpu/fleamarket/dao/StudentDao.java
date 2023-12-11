package cn.edu.nwpu.fleamarket.dao;

import cn.edu.nwpu.fleamarket.pojo.Student;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
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
}










