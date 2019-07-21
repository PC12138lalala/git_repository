package com.guopc.itoken.service.admin.controller;

import com.github.pagehelper.PageInfo;
import com.guopc.itoken.common.BaseResult;
import com.guopc.itoken.common.domain.TbSysUser;
import com.guopc.itoken.service.admin.service.AdminService;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@Data
@RequestMapping("v1/admins")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping(value = "page/{pageNum}/{pageSize}", method = RequestMethod.GET)
    public BaseResult page(@PathVariable(required = true) int pageNum, @PathVariable(required = true) int pageSize, @RequestParam(required = false) TbSysUser tbSysUser) {
        PageInfo pageInfo = adminService.page(pageNum, pageSize, tbSysUser);
        List<TbSysUser> list = pageInfo.getList();
        BaseResult.Cursor cursor = new BaseResult.Cursor();
        cursor.setTotal(new Long(pageInfo.getTotal()).intValue());
        cursor.setOffset(pageInfo.getPageNum());
        cursor.setLimit(pageInfo.getPageSize());
        return BaseResult.ok(list, cursor);
    }

}
