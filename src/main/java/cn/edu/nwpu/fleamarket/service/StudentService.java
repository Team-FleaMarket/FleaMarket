package cn.edu.nwpu.fleamarket.service;

import cn.edu.nwpu.fleamarket.pojo.Student;
import jakarta.servlet.http.HttpServletRequest;

import java.util.List;

/**
 * 学生服务
 *
 * @author lsy
 * @date 2023/12/15
 */
public interface StudentService {
    /**
     * 注册学生
     *
     * @param student 学生
     * @return {@link Student}
     */// 注册
    Student registerStudent(Student student);

    /**
     * 登录学生
     *
     * @param student 学生
     * @return {@link Student}
     */// 登录
    Student loginStudent(Student student);

    /**
     * 更新名称
     *
     * @param student 学生
     * @return boolean
     */// 更新个人信息
    boolean updateName(Student student);

    /**
     * 更新手机
     *
     * @param student 学生
     * @return boolean
     */
    boolean updatePhone(Student student);

    /**
     * 更新电子邮件
     *
     * @param student 学生
     * @return boolean
     */
    boolean updateEmail(Student student);

    /**
     * 更新微信
     *
     * @param student 学生
     * @return boolean
     */
    boolean updateWechat(Student student);

    /**
     * 全部计算
     *
     * @return int
     */
    int countAll();

    /**
     * 按页面获取学生
     *
     * @param page 页
     * @return {@link List}<{@link Student}>
     */
    List<Student> getStudentsByPage(int page);

    /**
     * 更新学生
     *
     * @param student 学生
     * @return boolean
     */
    boolean updateStudent(Student student);

    /**
     * 按用户名查询
     *
     * @param query 查询
     * @return {@link List}<{@link Student}>
     */
    List<Student> queryByUserName(String query);

    /**
     * 按学生查询
     *
     * @param query 查询
     * @return {@link List}<{@link Student}>
     */
    List<Student> queryByStudentNo(String query);

    /**
     * 逐个学生获取学生
     *
     * @param studentNo 学生编号
     * @return {@link Student}
     */
    Student getStudentByStudentNo(String studentNo);

    /**
     * 设置 img
     * 设为有自定义头像
     *
     * @param studentNo 学生编号
     */
    void setImg(String studentNo);

    /**
     * 重置密码
     *
     * @param id 编号
     * @return boolean
     */
    boolean resetPw(int id);
}






