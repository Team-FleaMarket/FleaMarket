package cn.edu.nwpu.fleamarket.service.impl;

import cn.edu.nwpu.fleamarket.dao.StudentDao;
import cn.edu.nwpu.fleamarket.pojo.Student;
import cn.edu.nwpu.fleamarket.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
/**
 * @Author: Hanwen
 * @Date: 2018/4/4 下午4:08
 */
@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentDao studentDao;

    @Override
    public Student registerStudent(Student student) {
        Student dataBaseStudent = studentDao.selectStudentByStudentNo(student.getStudentNo());
        // 若学号已被注册
        if (dataBaseStudent != null) {
            return dataBaseStudent;
        }
        studentDao.addStudent(student);
        return null;
    }

    @Override
    public Student loginStudent(Student student) {
        Student dataBaseStudent = studentDao.selectStudentByStudentNo(student.getStudentNo());
        // 若根据学号获取到的学生未空，则学号不存在，需要先去注册 || 判断密码，如果密码不相等，则错误
        if (dataBaseStudent == null || !dataBaseStudent.getPassword().equals(student.getPassword())) {
            return null;
        }
        return dataBaseStudent;
    }

    @Override
    public boolean updateName(Student student) {
        studentDao.updateName(student);
        return true;
    }

    @Override
    public boolean updatePhone(Student student) {
        studentDao.updatePhone(student);
        return true;
    }

    @Override
    public boolean updateEmail(Student student) {
        studentDao.updateEmail(student);
        return false;
    }

    @Override
    public boolean updateWechat(Student student) {
        studentDao.updateWechat(student);
        return false;
    }

    @Override
    public int countAll() {
        return studentDao.countAll();
    }

    @Override
    public List<Student> getStudentsByPage(int page) {
        return studentDao.getStudentsByPage((page - 1) * 6);
    }

    @Override
    public boolean updateStudent(Student student) {
        studentDao.update(student);
        return true;
    }

    @Override
    public List<Student> queryByUserName(String query) {
        return studentDao.queryByUsername(query);
    }

    @Override
    public List<Student> queryByStudentNo(String query) {
        return studentDao.queryByStudentNo(query);
    }

    @Override
    public void setImg(String studentNo) {
        studentDao.setImg(studentNo);
    }

    @Override
    public boolean resetPw(int id) {
        String studentNo = studentDao.getStudentNoById(id);
        if(studentNo == null) {
            return false;
        }
        studentDao.resetPw(id);
        return true;
    }
}
















