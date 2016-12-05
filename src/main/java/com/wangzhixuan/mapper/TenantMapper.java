package com.wangzhixuan.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.wangzhixuan.model.Room;
import com.wangzhixuan.model.Tenant;


/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
public interface TenantMapper extends AutoMapper<Tenant> {

	 List<Tenant> selectTenantPage(Pagination page, Map<String, Object> params);
	 
	 Tenant selectTenantByRoomId(@Param(value="roomId") Long roomId);
	
}