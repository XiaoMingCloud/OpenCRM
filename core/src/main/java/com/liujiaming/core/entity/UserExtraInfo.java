package com.liujiaming.core.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serializable;

/**
 * @author liujiaming
 * 用户的一些额外信息参数
 */
@Data
@AllArgsConstructor
public class UserExtraInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 是否
     */
    public Integer extra = -1;

    public String extraTime;
}
