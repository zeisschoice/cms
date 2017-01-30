package com.zeiss.cms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.zeiss.cms.model.Room;
import com.zeiss.cms.model.vo.UserVo;


/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
public interface RoomMapper extends BaseMapper<Room> {

	// List<Room> selectRoomList(Pagination page, @Param("sort") String sort, @Param("order") String order);
	 List<Room> selectRoomPage(Pagination page, Map<String, Object> params);
	 
	 List<Room> selectRoombyBuildId(@Param("buildingId") Long id);
	 
	 List<Room> selectRoombyBuildId4Tree(@Param("buildingId") Long id);
	
}