package com.liujiaming.authorization.common;

import com.liujiaming.core.common.ResultCode;
import org.springframework.security.access.AccessDeniedException;

/**
 * @author z
 * security权限认证异常处理
 */
public class AuthException extends AccessDeniedException {
    private ResultCode resultCode;

    public AuthException(ResultCode resultCode) {
        super(null);
        this.resultCode = resultCode;
    }

    public AuthException(String msg, Throwable t) {
        super(msg, t);
    }

    public AuthException(String msg) {
        super(msg);
    }

    public ResultCode getResultCode() {
        return this.resultCode;
    }
}
