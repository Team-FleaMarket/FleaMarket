package cn.edu.nwpu.fleamarket.service.impl;

import cn.edu.nwpu.fleamarket.dao.StudentDao;
import cn.edu.nwpu.fleamarket.pojo.Student;
import cn.edu.nwpu.fleamarket.service.StudentService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 学生服务实现
 *
 * @author lsy
 * @date 2023/12/15
 */
@Service
public class StudentServiceImpl implements StudentService {

    /**
     * 学生
     */
    @Autowired
    private StudentDao studentDao;

    /**
     * 注册学生
     *
     * @param student 学生
     * @return {@link Student}
     */
    @Override
    public Student registerStudent(Student student) {
        Student dataBaseStudent = studentDao.selectStudentByStudentNo(student.getStudentNo());
        // 若学号已被注册
        if (dataBaseStudent != null) {
            return new Student();
        }
        // 未被注册
        studentDao.addStudent(student);
        return null;
    }

    /**
     * 登录
     *
     * @param student 学生
     * @return {@link Student}
     */
    @Override
    public Student loginStudent(Student student) {
        Student dataBaseStudent = studentDao.selectStudentByStudentNo(student.getStudentNo());
        // 若根据学号获取到的学生未空，则学号不存在，需要先去注册 || 判断密码，如果密码不相等，则错误
        if (dataBaseStudent == null || !dataBaseStudent.getPassword().equals(student.getPassword())) {
            return null;
        }
        return dataBaseStudent;
    }

    /**
     * 更新
     *
     * @param student 学生
     * @return boolean
     */
    @Override
    public boolean updateName(Student student) {
        studentDao.updateName(student);
        return true;
    }

    /**
     * 更新手机
     *
     * @param student 学生
     * @return boolean
     */
    @Override
    public boolean updatePhone(Student student) {
        studentDao.updatePhone(student);
        return true;
    }

    /**
     * 更新电子邮件
     *
     * @param student 学生
     * @return boolean
     */
    @Override
    public boolean updateEmail(Student student) {
        studentDao.updateEmail(student);
        return false;
    }

    /**
     * 更新微信
     *
     * @param student 学生
     * @return boolean
     */
    @Override
    public boolean updateWechat(Student student) {
        studentDao.updateWechat(student);
        return false;
    }

    /**
     * 全部计算
     *
     * @return int
     */
    @Override
    public int countAll() {
        return studentDao.countAll();
    }

    /**
     * 按页面获取学生
     *
     * @param page 页
     * @return {@link List}<{@link Student}>
     */
    @Override
    public List<Student> getStudentsByPage(int page) {
        return studentDao.getStudentsByPage((page - 1) * 6);
    }

    /**
     * 更新学生
     *
     * @param student 学生
     * @return boolean
     */
    @Override
    public boolean updateStudent(Student student) {
        studentDao.update(student);
        return true;
    }

    /**
     * 按用户名查询
     *
     * @param query 查询
     * @return {@link List}<{@link Student}>
     */
    @Override
    public List<Student> queryByUserName(String query) {
        return studentDao.queryByUsername(query);
    }

    /**
     * 按学生查询
     *
     * @param query 查询
     * @return {@link List}<{@link Student}>
     */
    @Override
    public List<Student> queryByStudentNo(String query) {
        return studentDao.queryByStudentNo(query);
    }

    /**
     * 设置 img
     *
     * @param studentNo 学生编号
     */
    @Override
    public void setImg(String studentNo) {
        studentDao.setImg(studentNo);
    }

    /**
     * 重置
     *
     * @param id 编号
     * @return boolean
     */
    @Override
    public boolean resetPw(int id) {
        String studentNo = studentDao.getStudentNoById(id);
        if(studentNo == null) {
            return false;
        }
        studentDao.resetPw(id);
        return true;
    }

    /**
     * 逐个学生获取学生
     *
     * @param studentNo 学生编号
     * @return {@link Student}
     */
    @Override
    public Student getStudentByStudentNo(String studentNo) {
        return studentDao.selectStudentByStudentNo(studentNo);
    }

}
















