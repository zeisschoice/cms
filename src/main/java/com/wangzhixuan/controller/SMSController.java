package com.wangzhixuan.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;
import com.wangzhixuan.commons.base.BaseController;
import com.wangzhixuan.commons.result.Result;
import com.wangzhixuan.commons.utils.SMSUtils;
import com.wangzhixuan.mapper.SmsLogMapper;
import com.wangzhixuan.model.Cost;
import com.wangzhixuan.model.SMSConfig;
import com.wangzhixuan.model.SmsLog;
import com.wangzhixuan.service.ICostService;

@Controller
@RequestMapping("/sms")
public class SMSController extends BaseController {

	@Autowired
	private SMSConfig smsCfg;
	
	@Autowired
	private SmsLogMapper smsLogmapper;
	
	@Autowired
	private ICostService iCostService;
	
	@RequestMapping(value = "/send", method = RequestMethod.POST)
    @ResponseBody
	public Object smsCurrentMonCost(@RequestParam("total") String total,@RequestParam("phone") String phone,@RequestParam("tenantName") String tenantName,@RequestParam("roomName") String roomName,@RequestParam("id") Integer id,@RequestParam("sendCount") Integer sendCount,@RequestParam("mon") String mon) throws IOException{
		
		
		Result rs  = new Result();
		SmsLog smslog = new SmsLog();
		ObjectMapper mapper = new ObjectMapper();
		
		if(total==null || phone==null || tenantName==null ||roomName== null){
			
			rs.setMsg("短信参数不全！");
			rs.setSuccess(false);
			return rs;
		}
		
		
		Long start = System.currentTimeMillis();
		 
		HashMap<String, Object> map = new HashMap();
		
		map.put("name", tenantName);
		map.put("room", roomName);
		map.put("cost", total);
		map.put("mon", mon);
		
		
		String params = mapper.writeValueAsString(map);
		
		
        rs = SMSUtils.sendMsg(smsCfg.getUrl(), smsCfg.getAppKey(), smsCfg.getSecret(), smsCfg.getTemplate(), params, phone, smsCfg.getTemplateCode());
		
	
		
		 
			
		 if(rs.isSuccess()){
			 
			 AlibabaAliqinFcSmsNumSendResponse rsp  = (AlibabaAliqinFcSmsNumSendResponse) rs.getObj();
			 
			 ObjectMapper m = new ObjectMapper();
			
			 JsonNode actualObj = m.readTree(rsp.getBody());
			 
			 if(actualObj.has("error_response")){
				 
				 JsonNode errMsg =  actualObj.get("error_response");
				 
				 smslog.setIsSuccess("失败");
				 Long end = System.currentTimeMillis(); 
				 smslog.setTimeConsuming(end - start);
				 smslog.setLoginName(getCurrentUser().getLoginName());
				 smslog.setLoginRole(getCurrentUser().getUserType().toString());
				 smslog.setCreateDate(new Date());
				 smslog.setParams(rsp.getParams().toString());
				 smslog.setRespBody(rsp.getBody());
				 int i = smsLogmapper.insert(smslog) ;
				 rs.setMsg(errMsg.get("sub_msg").asText());
			     rs.setSuccess(false);
				 return rs;
			 }
			 
			 smslog.setIsSuccess("成功");	
			 smslog.setParams(rsp.getParams().toString());
			 smslog.setRespBody(rsp.getBody());
			 
			 Cost cost = new Cost();
			 cost.setId(id);
			 cost.setSendCount(sendCount + 1);
			 iCostService.updateSelectiveById(cost);
			 
		 }else{
			 smslog.setIsSuccess("失败");	
			// smslog.setParams(rs.getObj().toString());
			 smslog.setRespBody(rs.getObj().toString());
		 }
		 
		 Long end = System.currentTimeMillis(); 
		 smslog.setTimeConsuming(end - start);
		 smslog.setLoginName(getCurrentUser().getLoginName());
		 smslog.setLoginRole(getCurrentUser().getUserType().toString());
		 smslog.setCreateDate(new Date());
		 int i = smsLogmapper.insert(smslog) ;
		 
		 rs.setObj(null);
		 return rs;
	}
	
	
}
