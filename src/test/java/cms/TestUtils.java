package cms;

import java.math.BigDecimal;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.wangzhixuan.model.Building;
import com.wangzhixuan.service.IBuildingService;



public class TestUtils {

	private IBuildingService ibuildingService;
	
	
	@Before
	public void before(){
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext(new String[]{"classpath:spring-config.xml","classpath:spring/spring-mybatis.xml"});
	
		ibuildingService = (IBuildingService) context.getBean("BuildingServiceImpl");
	}
	
	@Test
	public void addBuilding(){
		
		Building bd = new Building();
		
		bd.setBuildingAddress("广东省佛山市顺德区");
		bd.setBuildingManager("张三");
		bd.setBuildingName("怡和中心");
		bd.setManagerPhone(new BigDecimal("1388888888"));
		bd.setBuildingOwn("李四");
		bd.setRoomCount(20);
		bd.setRemark("just a test!");
		
		
		ibuildingService.insert(bd);
		
	}
	
}
