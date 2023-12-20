package cn.edu.nwpu.fleamarket.exception;

import lombok.Getter;

/**
 * 业务异常
 *
 * @author lsy
 * @date 2023/12/15
 */
@Getter
public class BusinessException extends RuntimeException {

    /**
     * 消息
     */
    private final String message;

    /**
     * 业务异常
     *
     * @param message 消息
     */
    public BusinessException(String message) {
        super(message);
        this.message = message;
    }

    /**
     * 获取消息
     *
     * @return {@link String}
     */
    public String getMessage() {
        return message;
    }

}

