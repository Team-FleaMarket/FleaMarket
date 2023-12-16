package cn.edu.nwpu.fleamarket.enums;

import lombok.Getter;

@Getter
public enum OrderStatusEnum {

        SELLER_CONFIRM(0, "sellerconfirmed"),

        BUYER_CONFIRM(1, "buyercanceled"),

        IS_CANCELED(2, "iscanceled");

        private Integer code;
        private String desc;

        OrderStatusEnum(Integer code, String desc) {
            this.code = code;
            this.desc = desc;
        }

        public static OrderStatusEnum getByCode(Integer code) {
            for (OrderStatusEnum orderStatusEnum : OrderStatusEnum.values()) {
                if (orderStatusEnum.getCode().equals(code)) {
                    return orderStatusEnum;
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
