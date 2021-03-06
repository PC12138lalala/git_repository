package com.guopc.itoken.common;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class BaseResult implements Serializable {
    public static final String RESULT_OK = "ok";
    public static final String RESULT_NOT_OK = "not_ok";

    private String result;
    private Object data;
    private String success;
    private Cursor cursor;
    private List<Error> errors;

    public static BaseResult ok() {
        return createResult(RESULT_OK, null, "success", null, null);
    }

    public static BaseResult ok(Object data) {
        return createResult(RESULT_OK, data, "success", null, null);
    }

    public static BaseResult ok(Object data, Cursor cursor) {
        return createResult(RESULT_OK, data, "SUCCESS", cursor, null);
    }

    public static BaseResult not_ok(List<Error> errors) {
        return createResult(RESULT_NOT_OK, null, "", null, errors);
    }

    public static BaseResult not_ok() {
        return createResult(RESULT_NOT_OK, null, "", null, null);
    }

    private static BaseResult createResult(String result, Object data, String success, Cursor cursor, List<Error> errors) {
        BaseResult baseResult = new BaseResult();
        baseResult.setResult(result);
        baseResult.setData(data);
        baseResult.setSuccess(success);
        baseResult.setCursor(cursor);
        baseResult.setErrors(errors);

        return baseResult;
    }


    @Data
    public static class Cursor {
        private int total;
        private int offset;
        private int limit;
    }

    @Data
    public static class Error {
        private String field;
        private String message;

        public Error() {
        }

        public Error(String field, String message) {
            this.field = field;
            this.message = message;
        }

        public String getField() {
            return field;
        }

        public void setField(String field) {
            this.field = field;
        }

        public String getMessage() {
            return message;
        }

        public void setMessage(String message) {
            this.message = message;
        }


    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getSuccess() {
        return success;
    }

    public void setSuccess(String success) {
        this.success = success;
    }

    public Cursor getCursor() {
        return cursor;
    }

    public void setCursor(Cursor cursor) {
        this.cursor = cursor;
    }

    public List<Error> getErrors() {
        return errors;
    }

    public void setErrors(List<Error> errors) {
        this.errors = errors;
    }
}
