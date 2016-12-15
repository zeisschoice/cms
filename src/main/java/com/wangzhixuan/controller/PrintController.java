package com.wangzhixuan.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wangzhixuan.commons.base.BaseController;
import com.wangzhixuan.commons.utils.Trans2RMBUtils;
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
	public String costPrint1(Model model){
		
		
		CostPrint cp = new CostPrint();
		List<CostPrint> list = new ArrayList<CostPrint>();
		
		cp.setAddress("佛山市北滘");
		
		cp.setCrMonWaterNum("11234");
		cp.setLsMonWaterNum("12124");
		cp.setWaterCount("231.05");//水费
		cp.setWaterNum("20");//水数量
		
		cp.setCrMonElecNum("5232");
		cp.setLsMonElecNum("6224");
		cp.setElecNum("6666");
		cp.setElecCount("4223");
		cp.setManagerCount("30");
		cp.setPerElecRMB("4.5");
		cp.setPerWaterRMB("5.6");
		cp.setSum("1931.01");
		cp.setSumCN(Trans2RMBUtils.trans2RMB("1931.01"));
		cp.setTvCount("59");
		
		cp.setOther("923");
		cp.setWriteBiller(getCurrentUser().getName());
		cp.setInternetCount("50");
		
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
