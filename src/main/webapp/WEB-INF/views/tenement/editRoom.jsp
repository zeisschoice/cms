<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#roomEditForm').form({
            url:'${path}/room/edit',
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
                    parent.$.messager.alert('错误', result.msg, 'error');
                }
            }
        });
        
        
     $("#remark").val('${room.remark}');
     $("#beginDate").val('${room.beginDate}'==null||'${room.beginDate}'==''?"":myformatter(new Date('${room.beginDate}')));
     $("#endDate").val('${room.endDate }'==null || '${room.endDate }'== ''?"":myformatter(new Date('${room.endDate }')));
       
     
  // $('#status').combobox('select', '${room.status}');
 //     $('#type').combobox('setValue', $('#type')['${room.type}'].value);
     
    });
    
   
    
    
    function myformatter(date){
        var y = date.getFullYear();
        var m = date.getMonth()+1;
        var d = date.getDate();
        var h = date.getHours();
        var mm = date.getMinutes();
        var s = date.getSeconds();
        return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d)+' '+(h<10?('0'+h):h)+':'+(mm<10?('0'+mm):mm)+':'+(s<10?('0'+s):s);
    }
    
    
 //   $('#status').combobox('select', '${room.status}');
 //   $('#type').combobox('select', '${room.type}');
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="roomEditForm" method="post">
          <table class="grid">
                <tr>
                    <td>房间名称</td>
                    <td><input name="id" type="hidden"  value="${room.id}">
                    <input name="roomName" type="text" placeholder="请输入房间名称" class="easyui-validatebox" data-options="required:true" value="${room.roomName}"></td>
                    <td>住户姓名</td>
                    <td><input name="liver" type="text" placeholder="请输入住户姓名" class="easyui-validatebox" data-options="required:true" value="${room.liver}"></td>
                </tr>
                <tr>
                    <td>出租开始日期</td>
                    <td><input name="beginDate" id="beginDate" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" class="easyui-validatebox" data-options="required:true" value=""></td>
                    <td>出租结束日期</td>
                    <td>
                       <input name="endDate" id="endDate" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" class="easyui-validatebox" data-options="required:true" value="">
                    </td>
                </tr>
                <tr>
                    
                    <td>类型</td>
                    <td>
                        <select name="type" id="type" class="easyui-combobox" data-options="width:140,height:29,editable:false,panelHeight:'auto'" value="${room.type }">
                            <option value="0">单间</option>
                            <option value="1">套间</option>
                        </select>
                    </td>
                    <td>状态</td>
                    <td>
                        <select id="status" name="status" class="easyui-combobox" data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                                <option value="0">空置</option>
                                <option value="1">已租</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>所属楼房</td>
                    <td><select id="buildingId" name="buildingId" style="width: 140px; height: 29px;" class="easyui-validatebox" data-options="required:true" value="${room.buildingId }"></select></td>
                    <td>月租</td>
                    <td><input name="monRent" type="text" placeholder="月租" class="easyui-validatebox" data-options="required:true" value="${room.monRent }"></td>
                </tr>
                <tr>
                    
                  <td>备注</td>
                  <td colspan="3"><textarea id="remark" name="remark" rows="" cols="" style="margin: 0px; width: 380px; height: 53px;" ></textarea></td>  
                    
                </tr>
            </table>
        </form>
    </div>
</div>