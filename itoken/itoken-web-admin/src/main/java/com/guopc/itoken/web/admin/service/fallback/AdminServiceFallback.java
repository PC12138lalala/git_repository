package com.guopc.itoken.web.admin.service.fallback;

import com.google.common.collect.Lists;
import com.guopc.itoken.common.BaseResult;
import com.guopc.itoken.common.constants.HttpStatusConstants;
import com.guopc.itoken.common.utils.MapperUtils;
import com.guopc.itoken.web.admin.service.WebAdminService;
import org.springframework.stereotype.Component;

@Component
public class AdminServiceFallback implements WebAdminService {

    @Override
    public String login(String loginCode, String password) {

        BaseResult baseResult = BaseResult.not_ok(Lists.newArrayList(new BaseResult.Error(String.valueOf(HttpStatusConstants.BAD_GATEWAY.getStatus()), HttpStatusConstants.BAD_GATEWAY.getContent())));
        try {
            return MapperUtils.obj2json(baseResult);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
