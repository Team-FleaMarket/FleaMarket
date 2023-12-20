package cn.edu.nwpu.fleamarket.pojo;

import lombok.*;

import java.io.Serializable;
import java.util.Date;

/**
 * 学生
 *
 * @author lsy
 * @date 2023/12/15
 */
@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Student implements Serializable {
    /**
     * 编号
     */
    private Integer id;
    /**
     * 学生学号
     */
    private String studentNo;
    /**
     * 名字
     */
    private String name;
    /**
     * 密码
     */
    private String password;
    /**
     * 描述
     */
    private String description;
    /**
     * QQ
     */
    private String qq;
    /**
     * 学院
     */
    private String department;
    /**
     * 生日
     */
    private Date birthday;

    /**
     * 地址
     */
    private String address;
    /**
     * 电子邮件
     */
    private String email;

    /**
     * 图像路径
     */
    private String imagePath;
    /**
     * 图像名称
     */
    private String imageName;

    /**
     * 介绍
     */
    private String introduce;

    /**
     * 完成
     */
    private int finish;
    /**
     * 电话
     */
    private String phone;
    /**
     * 微信
     */
    private String wechat;
    /**
     * 图片
     */
    private int img;
}

