package com.guopc.itoken.service.admin.service.impl;

import com.guopc.itoken.common.domain.TbSysUser;
import com.guopc.itoken.common.mapper.TbSysUserMapper;
import com.guopc.itoken.common.service.impl.BaseServiceImpl;
import com.guopc.itoken.service.admin.service.AdminService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional(readOnly = true)
public class AdminServiceImpl extends BaseServiceImpl<TbSysUser, TbSysUserMapper> implements AdminService<TbSysUser> {

}
