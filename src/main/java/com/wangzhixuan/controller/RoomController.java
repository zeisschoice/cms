package com.wangzhixuan.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangzhixuan.commons.base.BaseController;
import com.wangzhixuan.commons.utils.DigestUtils;
import com.wangzhixuan.commons.utils.PageInfo;
import com.wangzhixuan.commons.utils.StringUtils;
import com.wangzhixuan.model.Building;
import com.wangzhixuan.model.Room;
import com.wangzhixuan.model.User;
import com.wangzhixuan.model.vo.UserVo;
import com.wangzhixuan.service.IBuildingService;
import com.wangzhixuan.service.IRoomService;

/**
 * <p>
 *   前端控制器
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
@Controller
@RequestMapping("/room")
public class RoomController extends BaseController{
	
	@Autowired
	private IBuildingService iBuildingService;
	
	@Autowired
	private IRoomService iRoomService;
	
	@RequestMapping(value = "/roomPage", method = RequestMethod.GET)
	public String building() {	
		return "tenement/room";
	}
	
	@RequestMapping(value = "/addPage", method = RequestMethod.GET)
	public String addRoom() {	
		return "tenement/roomAdd";
	}
	
	 @RequestMapping(value = "/tree", method = RequestMethod.POST)
	 @ResponseBody
	 public Object tree() {
	      return iBuildingService.selectTree();
	 }
	
	 
	 @RequestMapping(value = "/dataGrid", method = RequestMethod.POST)
	    @ResponseBody
	    public Object dataGrid(Room room, Integer page, Integer rows, String sort, String order) {
	        PageInfo pageInfo = new PageInfo(page, rows);
	        Map<String, Object> condition = new HashMap<String, Object>();

	        if (room.getBuildingId()!=null) {
	            condition.put("buildingId", room.getBuildingId());
	        }
	        
	        pageInfo.setCondition(condition);
	        iRoomService.selectDataGrid(pageInfo);
	        return pageInfo;
	    }
	 
	    @RequestMapping(value = "/add", method = RequestMethod.POST)
	    @ResponseBody
	    public Object add(Room room) {
//	        User u = userService.selectByLoginName(userVo.getLoginName());
//	        if (u != null) {
//	            return renderError("用户名已存在!");
//	        }
	    //    userVo.setPassword(DigestUtils.md5Hex(userVo.getPassword()));
	    	iRoomService.insert(room);
	        return renderSuccess("添加成功");
	    }
	 
	 
	 
}
