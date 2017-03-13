package com.zeiss.cms.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.zeiss.cms.commons.utils.PageInfo;
import com.zeiss.cms.mapper.DictTypeMapper;
import com.zeiss.cms.model.DictType;
import com.zeiss.cms.model.vo.DictTypeVo;
import com.zeiss.cms.model.vo.UserVo;
import com.zeiss.cms.service.IDictTypeService;

/**
 * <p>
 *   服务实现类
 * </p>
 *
 * @author zeiss
 * @since 2016-12-14
 */
@Service
public class DictTypeServiceImpl extends ServiceImpl<DictTypeMapper, DictType> implements IDictTypeService {

	@Autowired
	private DictTypeMapper dictTypeMapper;
	
	@Override
	public void selectDataGrid(PageInfo pageInfo) {
		
		Page<DictType> page = new Page<DictType>(pageInfo.getNowpage(), pageInfo.getSize());
		
		List<DictType> list = dictTypeMapper.selectDictTypePage(page, pageInfo.getCondition());
		
	    pageInfo.setRows(list);
	    pageInfo.setTotal(page.getTotal());
	
		
	}
	
	@Override
	public DictTypeVo selectDictData(String id) {
		
		DictTypeVo d = dictTypeMapper.selectDictTypeVoPage(id);
	   
	    //pageInfo.setRows(list);
	    //pageInfo.setTotal(page.getTotal());
	    
	     return d;
		
	}
}
