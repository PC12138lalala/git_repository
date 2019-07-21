package com.guopc.itoken.common.hystrix;


import com.google.common.collect.Lists;
import com.guopc.itoken.common.BaseResult;
import com.guopc.itoken.common.constants.HttpStatusConstants;
import com.guopc.itoken.common.utils.MapperUtils;

public class FallBack {
    public static String badGateway(){
        BaseResult baseResult = BaseResult.not_ok(Lists.newArrayList(new BaseResult.Error(String.valueOf(HttpStatusConstants.BAD_GATEWAY.getStatus()), HttpStatusConstants.BAD_GATEWAY.getContent())));
        try {
            return MapperUtils.obj2json(baseResult);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
