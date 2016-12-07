<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
       
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
                    <td><input name="year" type="text" placeholder="请输入房间名称" type="text" class="easyui-validatebox" data-options="required:true" value=""></td>
                    <td>月份</td>
                    <td><input name="liver" type="text" placeholder="请输入住户姓名" type="text" class="easyui-validatebox" data-options="required:true" value=""></td>
                </tr>
                <tr>
                    <td>电费</td>
                    <td><input name="electricCharge" placeholder="点击选择时间" class="easyui-validatebox" data-options="required:true"></td>
                    <td>水费</td>
                    <td>
                       <input name="waterCharge" placeholder="点击选择时间"  type="text" class="easyui-validatebox" data-options="required:true">
                    </td>
                </tr>
                 <tr>
                    <td>电视费</td>
                    <td><input name="tvCharge" placeholder="点击选择时间"  type="text" class="easyui-validatebox" data-options="required:true"></td>
                    <td>网络费</td>
                    <td>
                       <input name="internetCharge" placeholder="点击选择时间"  type="text" class="easyui-validatebox" data-options="required:true">
                    </td>
                </tr>
                 <tr>
                    <td>煤气费</td>
                    <td><input name="gasCharge" placeholder="点击选择时间"   type="text" class="easyui-validatebox" data-options="required:true"></td>
                    <td>分摊费</td>
                    <td>
                       <input name=equallyCharge placeholder="点击选择时间"   class="easyui-validatebox" data-options="required:true">
                    </td>
                </tr>
                 <tr>
                    <td>其他费用</td>
                    <td><input name="otherCharge" placeholder="点击选择时间"  class="easyui-validatebox" data-options="required:true"></td>
                    <td><input name="roomId" type="hidden"  value="${roomId}"></td>
                </tr>
                <tr>
                    
                  <td>备注</td>
                  <td colspan="3"><textarea id="remark" name="remark" rows="" cols="" style="margin: 0px; width: 380px; height: 53px;" ></textarea></td>  
                    
                </tr>
            </table>
        </form>
    </div>
</div>