package cn.edu.nwpu.fleamarket.enums;

import lombok.Getter;

/**
 * 货物状态枚举
 *
 * @author lsy
 * @date 2023/12/15
 */
@Getter
public enum GoodsStatusEnum {

    /**
     * 未售出
     */
    NOT_SOLD(0, "未售出"),

    /**
     * 出售
     */
    SOLD(1, "已售出"),

    /**
     * 进行中
     */
    IN_PROGRESS(2, "交易中");

    /**
     * 状态
     */
    private Integer code;
    /**
     * DESC
     */
    private String desc;

    /**
     * 货物状态枚举
     *
     * @param code 法典
     * @param desc DESC
     */
    GoodsStatusEnum(Integer code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    /**
     * 通过状态获取
     *
     * @param code 状态
     * @return {@link GoodsStatusEnum}
     */
    public static GoodsStatusEnum getByCode(Integer code) {
        for (GoodsStatusEnum goodsStatusEnum : GoodsStatusEnum.values()) {
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
