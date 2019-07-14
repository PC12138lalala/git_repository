package com.guopc.itoken.common.constants;

public enum HttpStatusConstants {
    BAD_GATEWAY(502,"从上游服务器收到无效响应");
    private int status;
    private String content;

    HttpStatusConstants(int status, String content) {
        this.status = status;
        this.content = content;
    }

    public int getStatus() {
        return status;
    }

    public String getContent() {
        return content;
    }
}
