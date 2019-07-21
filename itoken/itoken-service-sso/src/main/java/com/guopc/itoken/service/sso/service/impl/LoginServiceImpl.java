package com.guopc.itoken.service.sso.service.impl;

import com.guopc.itoken.common.domain.TbSysUser;
import com.guopc.itoken.common.utils.MapperUtils;
import com.guopc.itoken.service.sso.mapper.TbSysUserMapper;
import com.guopc.itoken.service.sso.service.LoginService;
import com.guopc.itoken.service.sso.service.consumer.RedisService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;
import tk.mybatis.mapper.entity.Example;

@Service
public class LoginServiceImpl implements LoginService {
    private static final Logger logger = LoggerFactory.getLogger(LoginServiceImpl.class);
    @Autowired
    private TbSysUserMapper tbSysUserMapper;

    @Autowired
    private RedisService redisService;

    public TbSysUser login(String loginCode, String plantPassword) {
        TbSysUser tbSysUser = null;
        String json = redisService.get(loginCode);
        if (json == null) {
            Example example = new Example(TbSysUser.class);
            example.createCriteria().andEqualTo("loginCode", loginCode);

            tbSysUser = (TbSysUser) tbSysUserMapper.selectOneByExample(example);
            String password = DigestUtils.md5DigestAsHex(plantPassword.getBytes());
            if (tbSysUser != null && password.equals(tbSysUser.getPassword())) {
                try {
                    redisService.put(loginCode, MapperUtils.obj2json(tbSysUser), 60 * 60 * 24L);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return tbSysUser;
            }
            return null;
        } else {
            try {
                tbSysUser = MapperUtils.json2pojo(json, TbSysUser.class);
            } catch (Exception e) {
                logger.warn("触发熔断:{}", e.getMessage());
                e.printStackTrace();
            }
        }
        return tbSysUser;
    }
}
