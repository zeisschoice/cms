package com.wangzhixuan.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangzhixuan.commons.utils.PageInfo;
import com.wangzhixuan.model.DictType;
import com.wangzhixuan.model.vo.DictTypeVo;
import com.wangzhixuan.service.IDictTypeService;

/**
 * <p>
 *   前端控制器
 * </p>
 *
 * @author zeiss
 * @since 2016-12-16
 */
@Controller
@RequestMapping("/dictType")
public class DictTypeController {
	
	@Autowired
	private IDictTypeService iDictType;
	
	@RequestMapping(value="/dict", method = RequestMethod.GET)
	public String dictTypePage(){
		
		return "admin/dict";
	}
	
	@RequestMapping(value = "/dataGrid",method = RequestMethod.POST)
	@ResponseBody
	public Object dataGrid(DictType dictType,Integer page,Integer rows,String sort,String order){
		
		PageInfo pageInfo = new PageInfo(page, rows);
	    Map<String, Object> condition = new HashMap<String, Object>();
	        
		
		
		if(dictType!=null){
			
			if(null == dictType.getDicttypecode()){
				
				condition.put("dicttypecode", dictType.getDicttypecode());
			}
			
			if(null == dictType.getDicttypename()){
				
				condition.put("dicttypename", dictType.getDicttypename());
			}
			
		}
		
		iDictType.selectDataGrid(pageInfo);
		
		return pageInfo;
	}
	
	
	@RequestMapping(value = "/addPage",method = RequestMethod.GET)
	public String dictTypeAdd(){
		
		return "admin/dictAdd";
	}
	
	
	@RequestMapping(value = "/editPage",method = RequestMethod.GET)
	public String dictTypeEdit(){
		
		return "admin/dictEdit";
	}


	@RequestMapping(value = "/dictData",method = RequestMethod.POST)
	@ResponseBody 
    public Object dictData(String dictType){
    	
		dictType = "COST";
    	
		DictTypeVo v = iDictType.selectDictData(dictType);
	    
    	return v;
    }
	
}
