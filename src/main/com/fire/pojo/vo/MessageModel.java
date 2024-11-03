package com.fire.pojo.vo;


import lombok.Data;

@Data
public class MessageModel {
    private Integer code; // 状态码 1:成功 2:失败
    private String msg; // 提示信息
    private Object object; // 回显对象
}
