package com.zeiss.cms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.zeiss.cms.model.Room;
import com.zeiss.cms.model.Tenant;


/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
public interface TenantMapper extends BaseMapper<Tenant> {

	 List<Tenant> selectTenantPage(Pagination page, Map<String, Object> params);
	 
	 Tenant selectTenantByRoomId(@Param(value="roomId") Long roomId);
	
}