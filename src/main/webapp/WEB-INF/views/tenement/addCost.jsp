<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
       
    	var dateObj = new Date();
    	var month = dateObj.getUTCMonth() + 1; //months from 1-12
    	var day = dateObj.getUTCDate();
    	var year = dateObj.getUTCFullYear();
    	var roomId = <%= request.getParameter("id") %>;
        var tenantName = '<%= request.getParameter("tenantName") %>';
    	$('#year').val(year);
    	$('#month').val(month);
    	$('#tenantName').val(tenantName);
  
    	var data = {};
    	if(month==0)
        {
            month=12;
            year=year-1;
        }else{
        	
        	month = month -1;
        	
        }
    	
    	data.month = month;
    	data.year = year;
    	data.roomId = roomId ;
    	
    	$.ajax({
 		   type: "POST",
 		   url: "${path }/cost/getLastMon",
 		   data:data,
 		   success: function(msg){
 		//	 var  result =  JSON.pare(msg);
 	    	console.log(msg);
 	    	console.log(typeof(msg));
 			   if(msg){
 				  
 				  var msg = JSON.parse(msg);
 				 
 				  $('#lastElectricNum').val(msg.currentElectricNum);
 				  $('#lastWaterNum').val(msg.currentWaterNum);
 				  $('#lastGasNum').val(msg.currentGasNum);
 				  
 				 console.log(msg.currentGasNum);
 			   }
 			   
 			  
 			//   $.messager.progress('close');
 			   
 			   
 		   },
 		   error:function(){
 			  
 			  $.messager.progress('close');
 			  $.messager.alert('发送失败！', msg.msg, 'error');
 		   }
 	});
    	
  	
    	
        $('#costAddForm').form({
            url:'${path}/cost/add',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                return isValid;
            },
            success : function(result) {
                progressClose();
              
                result = updateStr(result);
                result = $.parseJSON(result);
                if (result.success) {
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    parent.$.messager.alert('提示', result.msg, 'warning');
                }
            }
        });
        
        
       /*  $('#buildingId').combotree({
            url : '${path}/room/tree',
            parentField : 'pid',
            lines : true,
            panelHeight : 'auto'
        }); */
        
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="costAddForm" method="post">
            <table class="grid">
                <tr>
                    <td>年份</td>
                    <td><input name="year" id="year" type="text" placeholder="请输入房间名称" type="text" class="easyui-validatebox" data-options="required:true" value=""></td>
                    <td>月份</td>
                    <td><input name="month" id="month" type="text" placeholder="请输入住户姓名" type="text" class="easyui-validatebox" data-options="required:true" value=""></td>
                    <td>住户</td>
                    <td><input name="tenantName" id="tenantName" type="text" placeholder="请输入住户姓名" type="text" class="easyui-validatebox" data-options="required:true" value=""></td>
                </tr>
                <tr>
                    <td>本月电表数</td>
                    <td><input name="currentElectricNum" placeholder="点击选择时间" class="easyui-validatebox" data-options="required:true"></td>
                    <td>上月电表数</td>
                    <td>
                       <input name="lastElectricNum" id="lastElectricNum" placeholder="点击选择时间"  type="text" class="easyui-validatebox" data-options="required:true">
                    </td>
                    <td>电费</td>
                    <td>
                       <input name="electricCharge" placeholder="点击选择时间"  type="text" class="easyui-validatebox" data-options="required:true">
                    </td>
                </tr>
                 <tr>
                    <td>本月水表数</td>
                    <td><input name="currentWaterNum" placeholder="点击选择时间"  type="text" class="easyui-validatebox" data-options="required:true"></td>
                    <td>上月水表数</td>
                    <td>
                       <input name="lastWaterNum" id="lastWaterNum" placeholder="点击选择时间"  type="text" class="easyui-validatebox" data-options="required:true">
                    </td>
                    <td>水费</td>
                    <td>
                       <input name="waterCharge"  placeholder="点击选择时间"  type="text" class="easyui-validatebox" data-options="required:true">
                    </td>
                </tr>
                 <tr>
                    <td>本月煤气数</td>
                    <td><input name="currentGasNum" placeholder="点击选择时间"   type="text" class="easyui-validatebox" data-options="required:true"></td>
                    <td>上月煤气数</td>
                    <td>
                       <input name=lastGasNum id="lastGasNum" placeholder="点击选择时间"   class="easyui-validatebox" data-options="required:true">
                    </td>
                     <td>煤气费</td>
                    <td>
                       <input name="gasCharge" placeholder="点击选择时间"  type="text" class="easyui-validatebox" data-options="required:true">
                    </td>
                </tr>
                 <tr>
                    <td>其他费用</td>
                    <td><input name="otherCharge" placeholder="点击选择时间"  class="easyui-validatebox" data-options="required:true"></td>
                    <td><input name="roomId" type="hidden"  value="${roomId}"></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    
                  <td>备注</td>
                  <td colspan="6"><textarea id="remark" name="remark" rows="" cols="" style="margin: 0px; width: 380px; height: 53px;" ></textarea></td>  
                    
                </tr>
            </table>
        </form>
    </div>
</div>