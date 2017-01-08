package com.wangzhixuan.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangzhixuan.commons.base.BaseController;
import com.wangzhixuan.commons.utils.PageInfo;
import com.wangzhixuan.model.Building;
import com.wangzhixuan.model.Room;
import com.wangzhixuan.model.Tenant;
import com.wangzhixuan.service.IBuildingService;
import com.wangzhixuan.service.IRoomService;
import com.wangzhixuan.service.ITenantService;

/**
 * <p>
 * tenant  前端控制器
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
@Controller
@RequestMapping("/tenant")
public class TenantController extends BaseController{
	
	
	@Autowired
	private ITenantService iTenantService;
	
	@Autowired
	private IBuildingService iBuildingService;
	
	@Autowired
	private IRoomService iRoomService;
	
	@RequestMapping(value = "/tenantPage", method = RequestMethod.GET)
	public String building() {
		return "tenement/tenant";
	}
	
	@RequestMapping(value = "/addPage", method = RequestMethod.GET)
	public String addRoomPage() {
		return "tenement/addRoom";
	}

	@RequestMapping(value = "/tree", method = RequestMethod.POST)
	@ResponseBody
	public Object tree() {
		
		return iBuildingService.selectBuildRoomTree();
		
	}

	@RequestMapping(value = "/dataGrid", method = RequestMethod.POST)
	@ResponseBody
	public Object dataGrid(String roomId,String tenantId, Integer page, Integer rows, String sort, String order,Model model) {
		PageInfo pageInfo = new PageInfo(page, rows);
		Map<String, Object> condition = new HashMap<String, Object>();

		if (roomId != null && tenantId !=null) {
			//condition.put("roomId", 31);
			//condition.put("tenantId", 17);
			
		}

		pageInfo.setCondition(condition);
		iTenantService.selectDataGrid(pageInfo);
		
		
		return pageInfo;
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public Object add(Tenant tenant) throws ParseException {
		// User u = userService.selectByLoginName(userVo.getLoginName());
		// if (u != null) {
		// return renderError("用户名已存在!");
		// }
		// userVo.setPassword(DigestUtils.md5Hex(userVo.getPassword()));
		System.out.println(tenant);
		Room room = iRoomService.selectById(tenant.getRoomId());
		
		if(room==null){
			
			return renderError("不存在该房间，请检查是否在房间节点上添加租户！");
		}
		
		room.setStatus(1);
		room.setLiver(tenant.getIdentityCard());
		
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
		
		
		room.setBeginDate(sdf.parse(tenant.getStartDate()));
		room.setEndDate(sdf.parse(tenant.getEndDate()));
		boolean isUpdate = iRoomService.updateById(room);
		System.out.println("isUpdate:"+isUpdate);
		tenant.setIsDel(0);
		iTenantService.insert(tenant);
		return renderSuccess("添加成功");
	}

	 @RequestMapping(value = "/edit",method = RequestMethod.POST)
	 @ResponseBody
	 public Object edit(Tenant tenant) throws ParseException {
		 iTenantService.updateSelectiveById(tenant);
		 Room room = iRoomService.selectById(tenant.getRoomId());
		 if(!room.getLiver().equalsIgnoreCase(tenant.getIdentityCard())){
			 room.setLiver(tenant.getIdentityCard());
			
		 }
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
		 room.setBeginDate(sdf.parse(tenant.getStartDate()));
		 room.setEndDate(sdf.parse(tenant.getEndDate()));
		 iRoomService.updateById(room);
		 
	    return renderSuccess("编辑成功！");
	 }
	
	 @RequestMapping("/delete")
	 @ResponseBody
	 public Object delete(Long id,Long roomId) {
		// iTenantService.deleteById(id);
		 
		 Tenant tenant = new Tenant();
		 tenant.setId(id.intValue());
		 tenant.setIsDel(1);
		 
		 Room room = iRoomService.selectById(roomId);
	     room.setStatus(0);
		 room.setLiver(null);
		 boolean isUpdate = iRoomService.updateById(room);
		 
		 
		 
		 iTenantService.updateSelectiveById(tenant);
		
		 return renderSuccess("删除成功！");
	 }
	 
	   @RequestMapping(value = "/editPage", method = RequestMethod.GET)
		public String roomEdit(Model model,Long id) {	
			
		     Tenant tenant = iTenantService.selectById(id);
		     model.addAttribute("tenant", tenant);
		      
			
			return "tenement/editTenant";
	 }
	 
	    @RequestMapping(value = "/getTenant", method = RequestMethod.GET)
	    @ResponseBody
	    public Object getTenant(Model model,Long id) {	
			
	    	
	         
	    	
		     Tenant tenant = iTenantService.selectTenantByRoomId(id);
		     model.addAttribute("tenant", tenant);
		      
		    
			 return tenant;
		    // return renderSuccess("查询成功！");
	 }
	 
	 
	
}
