package com.zeiss.cms.service;

import com.baomidou.mybatisplus.service.IService;
import com.zeiss.cms.commons.utils.PageInfo;
import com.zeiss.cms.model.SysLog;

/**
 *
 * SysLog 表数据服务层接口
 *
 */
public interface ISysLogService extends IService<SysLog> {

    void selectDataGrid(PageInfo pageInfo);

}