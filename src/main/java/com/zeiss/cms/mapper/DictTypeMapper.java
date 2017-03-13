package com.zeiss.cms.mapper;


import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.zeiss.cms.model.DictType;
import com.zeiss.cms.model.vo.DictTypeVo;


/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author zeiss
 * @since 2016-12-14
 */
public interface DictTypeMapper extends BaseMapper<DictType> {

	
	List<DictType> selectDictTypePage(Pagination page,Map<String,Object> params);

	DictTypeVo selectDictTypeVoPage(String dicttypeid);

	

}