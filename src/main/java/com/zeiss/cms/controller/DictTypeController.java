package com.zeiss.cms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zeiss.cms.commons.base.BaseController;
import com.zeiss.cms.commons.utils.PageInfo;
import com.zeiss.cms.model.Cost;
import com.zeiss.cms.model.DictEntry;
import com.zeiss.cms.model.DictType;
import com.zeiss.cms.model.vo.DictTypeVo;
import com.zeiss.cms.service.IDictEntryService;
import com.zeiss.cms.service.IDictTypeService;

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
public class DictTypeController extends BaseController{
	
	@Autowired
	private IDictTypeService iDictType;
	
	@Autowired
	private IDictEntryService iDictEntryService;
	
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
	public String dictTypeEdit(Model model ,String dicttypeId) throws JsonProcessingException{
		
		
		 DictTypeVo dict = iDictType.selectDictData(dicttypeId);
		 
		 ObjectMapper mapper = new ObjectMapper();
		 
	     model.addAttribute("dict", dict);
	     model.addAttribute("dictEntry", mapper.writeValueAsString(dict.getDictEntry()));
	     
		 
		
		return "admin/dictEdit";
	}


	@RequestMapping(value = "/dictData",method = RequestMethod.POST)
	@ResponseBody 
    public Object dictData(String dictType){
    	
		//dictType = "COST";
    	
		DictTypeVo v = iDictType.selectDictData(dictType);
	    
    	return v;
    }
	
	
	@RequestMapping(value = "/add",method = RequestMethod.POST,consumes = {"application/json"})
	@ResponseBody
    public Object add(@RequestBody DictTypeVo dict){
    	
		
		
		DictType dictType = new DictType();
		
		dictType.setDicttypeid(dict.getDicttypeid());	
		dictType.setDicttypecode(dict.getDicttypecode());
		dictType.setDicttypename(dict.getDicttypename());
		dictType.setRank(dict.getRank());
		dictType.setSeqno(dict.getSeqno());
		dictType.setDictcat(dict.getDictcat());
		dictType.setDictlevel(dict.getDictlevel());
		
		
		
	    List<DictEntry> list = new ArrayList<DictEntry>();
		
	    list = dict.getDictEntry();
			
	    iDictType.insert(dictType);
	  
	    if(list!=null && list.size()>0){
	    	
	    	for(int i = 0;i<list.size();i++){
	    		
	    		list.get(i).setDicttypeid(dict.getDicttypeid());
	    		
	    	}
	    	
	    	 iDictEntryService.insertBatch(list);
	    }
	   
	    
    	return renderSuccess("添加成功");
    }
	
	@RequestMapping("/delete")
    @ResponseBody
    public Object delete(String id) {
		iDictType.deleteById(id);
		
	//	DictEntry entity = new DictEntry();
	//	entity.setDicttypeid(id);
		
	//	iDictEntryService.deleteSelective(entity);
		HashMap map = new HashMap();
		map.put("dicttypeid", id);
		iDictEntryService.deleteByMap(map);
        return renderSuccess("删除成功！");
    }
	
	
	@RequestMapping(value= "/edit",method = RequestMethod.POST,consumes = {"application/json"})
    @ResponseBody
    public Object edit(@RequestBody DictTypeVo dict) {
    DictType dictType = new DictType();
		
		dictType.setDicttypeid(dict.getDicttypeid());	
		dictType.setDicttypecode(dict.getDicttypecode());
		dictType.setDicttypename(dict.getDicttypename());
		dictType.setRank(dict.getRank());
		dictType.setSeqno(dict.getSeqno());
		dictType.setDictlevel(dict.getDictlevel());
		dictType.setDictcat(dict.getDictcat());
		
		
	    List<DictEntry> list = new ArrayList<DictEntry>();
		
	    list = dict.getDictEntry();
			
	    iDictType.updateById(dictType);
	  
	    if(list!=null && list.size()>0){
	    	
	    	for(int i = 0;i<list.size();i++){
	    		
	    		list.get(i).setDicttypeid(dict.getDicttypeid());
	    		iDictEntryService.insertOrUpdate(list.get(i));
	    	}
	    	
	    	
	    }
        return renderSuccess("编辑成功！");
    }
	
}
