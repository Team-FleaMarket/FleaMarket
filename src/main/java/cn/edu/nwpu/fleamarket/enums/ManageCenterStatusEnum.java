package cn.edu.nwpu.fleamarket.enums;

public enum ManageCenterStatusEnum {

    NOT_REVIEWED(0, "待审核"),

    NOT_SOLD(1, "待出售"),

    SOLD(2, "已出售"),

    MY_PURCHASE(3, "我的购买"),

    IN_PROGRESS(4, "出售中"),

    REVIEWED_FAIL(-1, "审核未通过");

    private Integer code;
    private String desc;

    ManageCenterStatusEnum(Integer code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public static ManageCenterStatusEnum getByCode(Integer code) {
        for (ManageCenterStatusEnum goodsStatusEnum : ManageCenterStatusEnum.values()) {
            if (goodsStatusEnum.getCode().equals(code)) {
                return goodsStatusEnum;
            }
        }
        return null;
    }

    public Integer getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }

}
