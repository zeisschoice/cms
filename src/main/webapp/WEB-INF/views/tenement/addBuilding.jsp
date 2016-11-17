<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/commons/basejs.jsp" %>
<meta http-equiv="X-UA-Compatible" content="edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
  $("#b01").click(function(){

	  var a = {"buildingName":'测试',"buildingAddress":"佛山北滘"}
	  
	  $.ajax({
		  url:"/shiro/building/addBuilding",
		//  contentType:"application/json",
		  type:"POST",
		  data:a,
		  success:function(result){
			 
			  console.log(result);
		  },
		  error:function(error){
			  
		  }
		  
		  
		  
	  });
	  
	  
  });
});
</script>

</head>
<body>
<button id="b01" type="button">改变内容</button>
</body>
</html>