<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {

        $('#buildingId').combotree({
            url : '${path }/room/tree',
            parentField : 'pid',
            lines : true,
            panelHeight : 'auto'
        });

        

        $('#roomAddForm').form({
            url : '${path }/room/add',
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
                console.log("------->>"+result);
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
        
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="roomAddForm" method="post">
            <table class="grid">
                <tr>
                    <td>房间名称</td>
                    <td><input name="roomName" type="text" placeholder="请输入房间名称" class="easyui-validatebox" data-options="required:true" value=""></td>
                    <td>住户姓名</td>
                    <td><input name="liver" type="text" placeholder="请输入住户姓名" class="easyui-validatebox" data-options="required:true" value=""></td>
                </tr>
                <tr>
                    <td>出租开始日期</td>
                    <td><input name="beginDate" type="text" placeholder="请输入参加日期" class="easyui-validatebox" data-options="required:true"></td>
                    <td>出租结束日期</td>
                    <td>
                       <input name="endDate" type="text" placeholder="请输入结束" class="easyui-validatebox" data-options="required:true">
                    </td>
                </tr>
                <tr>
                    
                    <td>类型</td>
                    <td>
                        <select name="userType" class="easyui-combobox" data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                            <option value="0">单间</option>
                            <option value="1" selected="selected">套间</option>
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
                    <td><select id="buildingId" name="buildingId" style="width: 140px; height: 29px;" class="easyui-validatebox" data-options="required:true"></select></td>
                    <td>月租</td>
                    <td><input name="menRent" type="text" placeholder="月租" class="easyui-validatebox" data-options="required:true"></td>
                </tr>
                <tr>
                    
                  <td>备注</td>
                  <td colspan="3"><textarea id="remark" name="remark" rows="" cols="" ></textarea></td>  
                    
                </tr>
            </table>
        </form>
    </div>
</div>