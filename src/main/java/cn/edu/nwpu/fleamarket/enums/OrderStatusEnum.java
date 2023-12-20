package cn.edu.nwpu.fleamarket.enums;

import lombok.Getter;

/**
 * 订单状态枚举
 *
 * @author lsy
 * @date 2023/12/15
 */
@Getter
public enum OrderStatusEnum {

    /**
     * 卖家确认
     */
    SELLER_CONFIRM(0, "sellerconfirmed"),

    /**
     * 买家确认
     */
    BUYER_CONFIRM(1, "buyerconfirmed"),

    /**
     * 已取消
     */
    IS_CANCELED(2, "iscanceled");

    /**
     * 状态
     */
    private Integer code;
    /**
     * DESC
     */
    private String desc;

    /**
     * 设置订单状态
     *
     * @param code 法典
     * @param desc DESC
     */
    OrderStatusEnum(Integer code, String desc) {
            this.code = code;
            this.desc = desc;
        }

    /**
     * 通过代码获取
     *
     * @param code 状态
     * @return {@link OrderStatusEnum}
     */
    public static OrderStatusEnum getByCode(Integer code) {
            for (OrderStatusEnum orderStatusEnum : OrderStatusEnum.values()) {
                if (orderStatusEnum.getCode().equals(code)) {
                    return orderStatusEnum;
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
