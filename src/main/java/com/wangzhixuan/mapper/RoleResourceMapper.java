package com.wangzhixuan.mapper;

import com.wangzhixuan.model.RoleResource;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.AutoMapper;

/**
 *
 * RoleResource 表数据库控制层接口
 *
 */
public interface RoleResourceMapper extends AutoMapper<RoleResource> {

    Long selectIdListByRoleId(@Param("id") Long id);

}