package com.guopc.itoken.service.admin.service;

import com.guopc.itoken.service.admin.domain.TbSysUser;

public interface AdminService {
    /**
     * 注册
     *
     * @param tbSysUser
     */
    public void register(TbSysUser tbSysUser);

    /**
     * 登陆
     *
     * @param loginCode     用户名
     * @param plantPassword 明文密码
     */
    public TbSysUser login(String loginCode, String plantPassword);
}
