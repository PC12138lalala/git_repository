package com.guopc.itoken.service.admin.service;

import com.guopc.itoken.service.admin.ServiceAdminApplication;
import com.guopc.itoken.service.admin.domain.TbSysUser;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.UUID;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = ServiceAdminApplication.class)
@ActiveProfiles(value = "dev")
@Transactional
@Rollback
public class AdminServiceTest {
    @Autowired
    private AdminService adminService;

    @Test
    public void register() {
        TbSysUser tbSysUser = new TbSysUser();
        tbSysUser.setUserCode(UUID.randomUUID().toString());
        tbSysUser.setUserName("guopc");
        tbSysUser.setUserType("M");
        tbSysUser.setMgrType("1");
        tbSysUser.setStatus("0");
        tbSysUser.setCreateDate(new Date());
        tbSysUser.setCreateBy(tbSysUser.getUserCode());
        tbSysUser.setUpdateDate(new Date());
        tbSysUser.setUpdateBy(tbSysUser.getUserCode());
        tbSysUser.setCorpCode("0");
        tbSysUser.setCorpName("itoken");
        tbSysUser.setLoginCode("guopc");
        tbSysUser.setPassword("123456");
        adminService.register(tbSysUser);
    }

    @Test
    public void login() {
        TbSysUser tbSysUser = adminService.login("guopc", "123456");
        Assert.assertNotNull(tbSysUser);
    }

}
