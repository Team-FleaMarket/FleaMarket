package cn.edu.nwpu.fleamarket.pojo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;

@Setter
@Getter
@ToString
public class Student implements Serializable {
    private Integer id;
    private String studentNo;
    private String name;
    private String password;
    private String description;
    private String qq;
    private String department;
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
    private int img;
}

