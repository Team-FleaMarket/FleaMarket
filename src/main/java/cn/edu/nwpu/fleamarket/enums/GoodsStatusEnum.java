package cn.edu.nwpu.fleamarket.enums;

import lombok.Getter;

@Getter
public enum GoodsStatusEnum {

    NOT_SOLD(0, "未售出"),

    SOLD(1, "已售出"),

    IN_PROGRESS(2, "交易中");

    private Integer code;
    private String desc;

    GoodsStatusEnum(Integer code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public static GoodsStatusEnum getByCode(Integer code) {
        for (GoodsStatusEnum goodsStatusEnum : GoodsStatusEnum.values()) {
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
