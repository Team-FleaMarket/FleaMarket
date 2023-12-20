package cn.edu.nwpu.fleamarket.enums;

/**
 * 管理中心状态枚举
 *
 * @author lsy
 * @date 2023/12/15
 */
public enum ManageCenterStatusEnum {

    /**
     * 未审核
     */
    NOT_REVIEWED(0, "待审核"),

    /**
     * 未售出
     */
    NOT_SOLD(1, "待出售"),

    /**
     * 出售
     */
    SOLD(2, "已出售"),

    /**
     * 我的购买
     */
    MY_PURCHASE(3, "我的购买"),

    /**
     * 进行中
     */
    IN_PROGRESS(4, "出售中"),

    /**
     * 审核未通过
     */
    REVIEWED_FAIL(-1, "审核未通过");

    /**
     * 状态
     */
    private Integer code;
    /**
     * DESC
     */
    private String desc;

    /**
     * 设置状态
     *
     * @param code 法典
     * @param desc DESC
     */
    ManageCenterStatusEnum(Integer code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    /**
     * 通过状态获取
     *
     * @param code 状态
     * @return {@link ManageCenterStatusEnum}
     */
    public static ManageCenterStatusEnum getByCode(Integer code) {
        for (ManageCenterStatusEnum goodsStatusEnum : ManageCenterStatusEnum.values()) {
            if (goodsStatusEnum.getCode().equals(code)) {
                return goodsStatusEnum;
            }
        }
        return null;
    }

    /**
     * 获取状态
     *
     * @return {@link Integer}
     */
    public Integer getCode() {
        return code;
    }

    /**
     * 获取 DESC
     *
     * @return {@link String}
     */
    public String getDesc() {
        return desc;
    }

}
