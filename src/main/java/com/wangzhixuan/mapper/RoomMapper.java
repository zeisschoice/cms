package com.wangzhixuan.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.wangzhixuan.model.Room;
import com.wangzhixuan.model.vo.UserVo;


/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
public interface RoomMapper extends AutoMapper<Room> {

	// List<Room> selectRoomList(Pagination page, @Param("sort") String sort, @Param("order") String order);
	 List<Room> selectRoomPage(Pagination page, Map<String, Object> params);
	
}