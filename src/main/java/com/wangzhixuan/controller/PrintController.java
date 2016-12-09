package com.wangzhixuan.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wangzhixuan.commons.base.BaseController;
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
	public ModelAndView costPrint1(Model model){
		HashMap p = new HashMap();
		p.put("address", "佛山市北滘");
		p.put(JRParameter.IS_IGNORE_PAGINATION, true);
		
		List<HashMap> list = new ArrayList<HashMap>();
		list.add(p);
		// 报表数据源
		JRDataSource jrDataSource = new JRBeanCollectionDataSource(list);
		
		// 动态指定报表模板url
		model.addAttribute("url", "/WEB-INF/jasper/cost.jasper");
		model.addAttribute("format", "pdf"); // 报表格式
		
		
		model.addAttribute("costData", jrDataSource);
		return new ModelAndView("cost", p);
		//return "cost"; // 对应jasper-defs.xml中的bean id
	}
	
}
