package com.wangzhixuan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.wangzhixuan.model.Building;
import com.wangzhixuan.model.Role;


/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
public interface BuildingMapper extends AutoMapper<Building> {
	
	
	  List<Building> selectBuildingList(Pagination page, @Param("sort") String sort, @Param("order") String order);

}