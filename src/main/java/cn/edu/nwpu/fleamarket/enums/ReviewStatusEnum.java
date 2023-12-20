package cn.edu.nwpu.fleamarket.enums;

import lombok.Getter;

/**
 * 查看状态
 *
 * @author lsy
 * @date 2023/12/15
 */
@Getter
public enum ReviewStatusEnum {

    /**
     * 未审核
     */
    PENDING(0, "未审核"),

    /**
     * 已审核
     */
    REVIEWED(1, "已审核"),

    /**
     * 审核未通过
     */
    REVIEW_FAIL(-1, "审核未通过");

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
     * @param code 状态
     * @param desc DESC
     */
    ReviewStatusEnum(Integer code, String desc) {
            this.code = code;
            this.desc = desc;
        }

    /**
     * 通过状态获取
     *
     * @param code 状态
     * @return {@link ReviewStatusEnum}
     */
    public static ReviewStatusEnum getByCode(Integer code) {
            for (ReviewStatusEnum reviewStatusEnum : ReviewStatusEnum.values()) {
                if (reviewStatusEnum.getCode().equals(code)) {
                    return reviewStatusEnum;
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
