package cn.edu.nwpu.fleamarket.service;

import cn.edu.nwpu.fleamarket.pojo.Student;

/**
 * @Author: Hanwen
 * @Date: 2018/4/4 下午3:08
 */
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
}






