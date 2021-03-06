package com.wangzhixuan.mapper;


import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.AutoMapper;

import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.wangzhixuan.model.DictType;
import com.wangzhixuan.model.vo.DictTypeVo;


/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author zeiss
 * @since 2016-12-14
 */
public interface DictTypeMapper extends AutoMapper<DictType> {

	
	List<DictType> selectDictTypePage(Pagination page,Map<String,Object> params);

	DictTypeVo selectDictTypeVoPage(String dicttypeid);

	

}