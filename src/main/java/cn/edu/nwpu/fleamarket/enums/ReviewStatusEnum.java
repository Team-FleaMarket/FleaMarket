package cn.edu.nwpu.fleamarket.enums;

import lombok.Getter;

@Getter
public enum ReviewStatusEnum {

        PENDING(0, "未审核"),

        REVIEWED(1, "已审核"),

        REVIEW_FAIL(-1, "审核未通过");

        private Integer code;
        private String desc;

        ReviewStatusEnum(Integer code, String desc) {
            this.code = code;
            this.desc = desc;
        }

        public static ReviewStatusEnum getByCode(Integer code) {
            for (ReviewStatusEnum reviewStatusEnum : ReviewStatusEnum.values()) {
                if (reviewStatusEnum.getCode().equals(code)) {
                    return reviewStatusEnum;
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
