package cn.edu.nwpu.fleamarket.pojo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;
/**
 * @Author: Hanwen
 * @Date: 2018/4/4 下午3:08
 */

@Setter
@Getter
public class User {
    private Integer id;
    private String studentNo;
    private String userName;
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
    private String manager;
    private String phone;
    private String wechat;

    public void setUsername(String username) {
        this.userName = username == null ? null : username.trim();
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }
}

