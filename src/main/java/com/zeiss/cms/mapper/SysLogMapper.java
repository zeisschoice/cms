package com.zeiss.cms.mapper;

import java.util.List;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.zeiss.cms.model.SysLog;

/**
 *
 * SysLog 表数据库控制层接口
 *
 */
public interface SysLogMapper extends BaseMapper<SysLog> {

    List<SysLog> selectSysLogList(Pagination page);

}