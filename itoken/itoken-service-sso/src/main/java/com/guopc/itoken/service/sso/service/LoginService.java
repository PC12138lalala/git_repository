package com.guopc.itoken.service.sso.service;


import com.guopc.itoken.common.domain.TbSysUser;

/**
 * login
 */
public interface LoginService {
    TbSysUser login(String loginCode, String password);
}
