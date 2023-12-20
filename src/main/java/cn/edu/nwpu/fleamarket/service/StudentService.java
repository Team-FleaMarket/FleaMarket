package cn.edu.nwpu.fleamarket.service;

import cn.edu.nwpu.fleamarket.pojo.Student;
import jakarta.servlet.http.HttpServletRequest;

import java.util.List;

public interface StudentService {
    // 注册
    Student registerStudent(Student student);
    // 登录
    Student loginStudent(Student student);

    // 更新个人信息
    boolean updateName(Student student);
    boolean updatePhone(Student student);
    boolean updateEmail(Student student);
    boolean updateWechat(Student student);

    int countAll();
    List<Student> getStudentsByPage(int page);
    boolean updateStudent(Student student);
    List<Student> queryByUserName(String query);
    List<Student> queryByStudentNo(String query);
    Student getStudentByStudentNo(String studentNo);

    /**
     * 设为有自定义头像
     */
    void setImg(String studentNo);

    boolean resetPw(int id);
}






