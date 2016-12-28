package com.wangzhixuan.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.wangzhixuan.commons.base.BaseController;
import com.wangzhixuan.commons.utils.Trans2RMBUtils;
import com.wangzhixuan.model.Cost;
import com.wangzhixuan.model.CostPrint;
import com.wangzhixuan.model.JavaBeanPerson;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRParameter;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;


@Controller
@RequestMapping(value = "/print")
public class PrintController extends BaseController {

	
	
	@RequestMapping(value = "/cost")
	public String costPrint(Model model){
		// 报表数据源
		JRDataSource jrDataSource = new JRBeanCollectionDataSource(JavaBeanPerson.getList());
		
		// 动态指定报表模板url
		model.addAttribute("url", "/WEB-INF/jasper/MvcIReportExample.jasper");
		model.addAttribute("format", "pdf"); // 报表格式
		model.addAttribute("jrMainDataSource", jrDataSource);
		
		return "iReportView"; // 对应jasper-defs.xml中的bean id
	}
	
	@RequestMapping(value = "/cost1")
	//@ResponseBody
	public String costPrint1(Model model,@RequestParam("cost") String cost) throws JsonParseException, JsonMappingException, IOException{
		
		ObjectMapper mapper = new ObjectMapper();
		System.out.println(cost);
		System.out.println("URLEncoder.encode returns "
			      + URLEncoder.encode(cost, "UTF-8"));
		//String json = mapper.w
		cost = cost.replaceAll("&quot;", "\"");
		System.out.println(cost);
		Cost c = mapper.readValue(cost,Cost.class);
		
		
		CostPrint cp = new CostPrint();
		List<CostPrint> list = new ArrayList<CostPrint>();
		
		cp.setAddress("佛山市北滘");
		cp.setLastMon("2016-11-3");
		cp.setRoomNum("A105");
		
		
		cp.setCrMonWaterNum(c.getCurrentWaterNum().toString());
		cp.setLsMonWaterNum(c.getLastWaterNum().toString());
		cp.setWaterCount(c.getWaterCharge().toString());//水费
		cp.setWaterNum(new BigDecimal(c.getCurrentWaterNum().toString()).subtract(new BigDecimal(c.getLastWaterNum().toString())).toString());//水数量
		
		cp.setCrMonElecNum(c.getCurrentElectricNum().toString());
		cp.setLsMonElecNum(c.getLastElectricNum().toString());
		cp.setElecNum(new BigDecimal(c.getCurrentElectricNum().toString()).subtract(new BigDecimal(c.getLastWaterNum().toString())).toString());
		cp.setElecCount(c.getElectricCharge().toString());
		cp.setManagerCount(c.getManageCharge().toString());
		cp.setPerElecRMB(c.getElectricUnitPrice().toString());
		cp.setPerWaterRMB(c.getWaterUnitPrice().toString());
		cp.setSum(c.getTotal().toString());
		cp.setSumCN(Trans2RMBUtils.trans2RMB(c.getTotal().toString()));
		cp.setTvCount(c.getTvCharge().toString());
		
		cp.setOther(c.getOtherCharge().toString());
		cp.setWriteBiller(getCurrentUser().getName());
		cp.setInternetCount(c.getInternetCharge().toString());
		
		list.add(cp);
		// 报表数据源
		JRDataSource jrDataSource = new JRBeanCollectionDataSource(list);
		
		// 动态指定报表模板url
		model.addAttribute("url", "/WEB-INF/jasper/cost.jasper");
		model.addAttribute("format", "pdf"); // 报表格式
		
		
		model.addAttribute("costData", jrDataSource);
		//return new ModelAndView("cost", p);
		return "cost"; // 对应jasper-defs.xml中的bean id
	}
	
}
