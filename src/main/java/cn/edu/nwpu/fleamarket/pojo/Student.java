package cn.edu.nwpu.fleamarket.pojo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;
/**
 * @Author: Hanwen
 * @Date: 2018/4/4 下午3:08
 */

@Setter
@Getter
public class Student implements Serializable {
    private Integer id;
    private String studentNo;
    private String name;
    private String password;
    private Date birthday;
    private String sex;
    private String address;
    private String email;
    private String grade;
    private String imagePath;
    private String imageName;
    private String position;
    private String education;
    private String introduce;
    private String researchResult;
    private String skills;
    private int finish;
    private String phone;
    private String wechat;
}

