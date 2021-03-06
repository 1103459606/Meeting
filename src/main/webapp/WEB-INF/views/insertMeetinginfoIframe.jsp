<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/26
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>创建会议</title>
    <%pageContext.setAttribute("APP_PATH", request.getContextPath());%>
    <link rel="stylesheet" href="${APP_PATH}/static/css/layui/css/layui.css">
    <link rel="stylesheet" href="${APP_PATH}/static/css/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${APP_PATH}/static/css/bootstrap/css/bootstrap_tagsinput.css">
    <style>
        .box {
            width: 500px;
            margin: auto;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
        }
        .tagsinput-primary .bootstrap-tagsinput {
            min-height: 38px;
            border-color: #e6e6e6;
            margin-bottom: 15px;
        }
        .bootstrap-tagsinput{
            width: 100%;
        }
        .bootstrap-tagsinput .label-info {
            border-radius: 4px;
            background-color: #1abc9c;
            color: #fff;
            font-size: 13px;
            cursor: pointer;
            display: inline-block;
            position: relative;
            vertical-align: middle;
            overflow: hidden;
            margin: 0 5px 5px 0;
            padding: 6px 10px 6px 14px;
            transition: .25s linear;
        }
        .layui-form-label{
            width: 100px;
        }
        .box_div{
            background-color: #1abc9c;
            margin:5px;
            padding: 7px;
            float: left;
        }
        #big_box{
            width:450px;
            min-height: 10%;
            border-radius: 2px;
            display: none
        }
    </style>
</head>
<body>
<div class="layui-tab">
    <ul class="layui-tab-title">
        <li class="layui-this">会议信息</li>
        <li>人员管理</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <div style="width: 500px;margin-top:10px;margin: 0 auto;">
                <form class="layui-form" action="">
                    <div class="layui-form-item">
                        <label class="layui-form-label">会议名称：</label>
                        <div class="layui-input-block">
                            <input id="meetingName" type="text" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input" style="width: 450px">
                        </div>
                    </div>
                    <div  class="layui-form-item box">
                        <label class="layui-form-label">会议部门：</label>
                        <div class="layui-input-block tagsinput-primary" style="width: 450px">
                            <input name="tagsinput" id="tagsinputval" class=" layui-input" data-role="tagsinput" readonly="true"/>
                        </div>
                        <div style="margin-left: 110px;" id="meeting_box">
                            <div id="big_box">
                            </div>
                        </div>
                    </div>
<%--                    <div class="layui-form-item">--%>
<%--                        <label class="layui-form-label">会议部门：</label>--%>
<%--                        <div class="layui-input-block" style="width: 450px">--%>
<%--                            <select name="city" lay-verify="required" id="dept_select" multiple data-role="tagsinput">--%>
<%--                            </select>--%>
<%--                        </div>--%>
<%--                    </div>--%>

                    <div class="layui-form-item">
                        <label class="layui-form-label">会议地点：</label>
                        <div class="layui-input-block" style="width: 450px">
                            <select name="city" lay-verify="required" id="address_select">
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">开始时间：</label>
                        <div class="layui-input-block" style="">
                            <input type="text" name="date" id="date1" lay-verify="date" placeholder="yyyy-MM-dd HH-mm-ss" autocomplete="off" class="layui-input">
                        </div>
<%--                        <div class="layui-form-mid layui-word-aux">选择开始时间</div>--%>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">结束时间：</label>
                        <div class="layui-input-block">
                            <input type="text" name="date" id="date2" lay-verify="date" placeholder="yyyy-MM-dd HH-mm-ss" autocomplete="off" class="layui-input">
                        </div>
<%--                        <div class="layui-form-mid layui-word-aux">选择结束时间</div>--%>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">会议简介：</label>
                        <div class="layui-input-block" style="width: 450px">
                            <textarea id="meetingIntro" name="desc" placeholder="请输入简介" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">二维码自动刷新</label>
                        <div class="layui-input-block">
                            <input type="checkbox" checked="" name="rqcode" lay-skin="switch" lay-filter="switchTest" lay-text="是|否" >
                        </div>
                        <input type="text" style="display: none;" id="qcode_refresh" value="true">
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">自定义人员</label>
                        <div class="layui-input-block">
                            <input type="radio" name="team" value="是" title="是" checked="">
                            <input type="radio" name="team" value="否" title="否">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="layui-tab-item" style="margin: 0 auto;">
            <div id="leftDiv" style="/*background-color: red;*/width:45%;float: left">
                <div style="width: 100%;height: 40px;padding-top: 5px">
                    <div style="float:left;margin-left: 10px"><input id="usernameIpt" class="layui-input" type="text" autocomplete="off" style="width: 120px;height: 38px" placeholder="工号"></div>
                    <div style="float:left;margin-left: 10px"><input id="nameIpt" class="layui-input" type="text" autocomplete="off" style="width: 120px;height: 38px" placeholder="姓名"></div>
                    <div style="float: left;margin-left: 10px">
                        <form class="layui-form" action="" style="width: 150px">
                            <select lay-verify="required" id="dept_select1">
                                <option value=""></option>
                            </select>
                        </form>
                    </div>
                    <div style="float: left">
                        <div class="layui-btn layui-inline" id="searchBtn" style="margin-left: 15px;">搜索</div>
                        <%--<button class="layui-btn layui-inline" id="searchBtn" style="margin-left: 15px;">搜索</button>--%>
                    </div>
                </div>
                <table id="leftTable" lay-filter="leftTable"></table>
            </div>
            <div id="midDiv" style="/*background-color: green;*/width: 10%;float: left">
                <div style="margin-left:30px;margin-top: 250px">
                    <button id="selectAddBtn" class="layui-btn"><i class="layui-icon">&#xe602;</i></button>
                    <br><br><br>
                    <button id="selectDelBtn" class="layui-btn"><i class="layui-icon">&#xe603;</i></button>
                </div>
            </div>
            <div id="rightDiv" style="/*background-color: blue;*/width: 45%;float: left">
                <div style="width: 100%;height: 40px;padding-top: 5px">
                    <input type="file" id="excel-file">
                </div>
                <table id="rightTable" lay-filter="rightTable"></table>
                <%--<button onclick="getUsernameIptVal()">testBtn</button>--%>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${APP_PATH}/static/css/layui/layui.js"></script>
<script src="${APP_PATH}/static/js/jquery-3.0.0.min.js"></script>
<script src="${APP_PATH}/static/js/xlsx.core.min.js"></script>
<script src="${APP_PATH}/static/css/bootstrap/js/bootstrap-tagsinput.js"></script>
<script src="${APP_PATH}/static/css/bootstrap/js/bootstrap.js"></script>
<%--<script type="text/html" id="leftTable_barDemo" lay-fi>--%>
<%--<a class="layui-btn layui-btn-xs" lay-event="add">添加</a>--%>
<%--</script>--%>
<%--<script type="text/html" id="rightTable_barDemo">--%>
<%--<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>--%>
<%--</script>--%>
<script>
    $(".box").mouseover(function(){
        $("#big_box").show();
    });
    $(".box").mouseleave(function(){
        $("#big_box").hide();
    });

    //会议地点下拉框加载
    $.ajax({
        url:"${APP_PATH}/meetingRoom/findAllMeetingRoom",
        type:"GET",
        async:false,
        success:function (res) {
            var address = res.extend.meetingroom;
            for(var i=0 ; i<address.length ; i++){
                $("<option></option>").attr("value",address[i].id).text(address[i].address).appendTo("#address_select");
            }
        }
    })

    //会议人员（加载部门列表）
    $.ajax({
        url:"${APP_PATH}/department/findAllDept",
        type:"GET",
        async:false,
        success:function (res) {
            var depts = res.extend.depts;
            var context="";
            for(var i=0 ; i<depts.length ; i++){
                // $("<div></div>").attr("value",)
                context+="<div class=\"box_div tag label label-info\"><span style='cursor: pointer;' class='click_span'>"+depts[i].name+"</span></div>"
            }
            $("#big_box").html(context);
        }
    })
    $(".click_span").click(function () {
        $("#tagsinputval").tagsinput('add',$(this).html());
    })
    //excel导入
    $('#excel-file').change(function(e) {
        var files = e.target.files;
        var fileReader = new FileReader();
        fileReader.onload = function(ev) {
            try {
                var data = ev.target.result
                var workbook = XLSX.read(data, {
                    type: 'binary'
                }) // 以二进制流方式读取得到整份excel表格对象
                var persons = []; // 存储获取到的数据
            } catch (e) {
                // console.log('文件类型不正确');
                layer.msg("文件类型不正确",{icon:5});
                return;
            }
            // 表格的表格范围，可用于判断表头是否数量是否正确
            var fromTo = '';
            // 遍历每张表读取
            for (var sheet in workbook.Sheets) {
                if (workbook.Sheets.hasOwnProperty(sheet)) {
                    fromTo = workbook.Sheets[sheet]['!ref'];
                    // console.log(fromTo);
                    persons = persons.concat(XLSX.utils.sheet_to_json(workbook.Sheets[sheet]));
                    break; // 如果只取第一张表，就取消注释这行
                }
            }
            // console.log(persons);
            //在控制台打印出来表格中的数据
            var usernames = [];
            for(var index in persons)
                usernames.push(persons[index]['工号']);
            // console.log(usernames);
            $.ajax({
                url:"${APP_PATH}/userInfo/findUserInfoReturnByUsernames",
                type:"POST",
                data:{usernames:usernames},
                success:function (res) {
                    // console.log("success:");
                    console.log(res);
                    if(res.code == 100){
                        // var datas = res.extend.userInfoReturns
                        layui.table.reload("rightTable", {
                            data :res.extend.userInfoReturns
                        });
                        layui.table.reload("leftTable");
                        if (res.extend.userInfoReturns.length == usernames.length)
                            layer.msg("全部导入成功",{icon:1});
                        else
                            layer.msg("部分导入成功，不成功的工号有问题",{icon:3});
                    }else if(res.code == 200){
                        layer.msg("导入失败,请重新导入",{icon:5});
                    }
                }
                ,error:function (res) {
                    // console.log("error");
                    // console.log(res);
                }
            })
        };
        // 以二进制方式打开文件
        fileReader.readAsBinaryString(files[0]);
    });

    layui.use(['form','element','laydate','table','layer','transfer'], function(){
        var element = layui.element;
        var laydate = layui.laydate;
        var form = layui.form;
        var table = layui.table;
        var transfer = layui.transfer
        var layer = layui.layer

        //日期
        laydate.render({
            type:'datetime'
            ,elem: '#date2'
        });
        laydate.render({
            type:'datetime'
            ,elem: '#date1'
        });
        form.on('switch(switchTest)', function(data){
            $("#qcode_refresh").val(this.checked)
        });


        var data1 =[{"id":1210,"username":"1716143221","name":"王贵","departName":"电子信息工程学院"}
        ,{"id":1209,"username":"1716143221","name":"王贵","departName":"电子信息工程学院"}]

        table.render({//因为leftTable需要用到rightTable中的数据所以需要先创建rightTable
            elem: '#rightTable'
            ,id:"rightTable"
            ,height: 450 //容器高度
            ,width:540
            ,cols: [[{type: 'checkbox', fixed: 'left'}
                ,{field: 'id', title: 'ID',style:'display:none'}
                ,{field: 'username', title: '工号', width: 122}
                ,{field: 'name', title: '姓名',width:120}
                ,{field: 'departName', title: '部门名称',width:245}
                // ,{field: 'leftTable_barDemo', title: '操作',toolbar: '#rightTable_barDemo', align:'center'}]
            ]]
            // ,parseData:function(res){
            //     return {
            //         "code": res.code == 100 ? 0: 1, //解析接口状态
            //         "msg": res.msg, //解析提示文本
            //         "count": res.extend.userInfoReturn.total, //解析数据长度
            //         "data": data1/*res.extend.userInfoReturn.list*///解析数据列表
            //     };
            // }
        });

        table.reload("rightTable", {
            data : []
        })

        table.render({
            elem: '#leftTable'
            ,id: 'leftTable'//表格名命名
            ,url:"${APP_PATH}/userInfo/findAllByExample"
            ,height: 472 //容器高度
            ,width:540
            ,limit:10
            ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
            }
            ,cols: [[{type: 'checkbox', fixed: 'left'},
                ,{field: 'id', title: 'ID',style:'display:none'}
                ,{field: 'username', title: '工号', width: 122}
                ,{field: 'name', title: '姓名',width:120}
                ,{field: 'departName', title: '部门名称',width:245}
                // ,{field: 'leftTable_barDemo', title: '操作',toolbar: '#leftTable_barDemo', align:'center'}]
            ]]
            ,parseData:function(res){
                var leftTableData = res.extend.userInfoReturn.list;
                var rightTableData = layui.table.cache.rightTable;
                for (var i =0 ; i<leftTableData.length ; i++){
                    for(var j = 0 ; j<rightTableData.length; j++){
                        if(leftTableData[i].id==rightTableData[j].id){//rightTableData中已有数据
                            leftTableData[i].LAY_CHECKED=true;//将复选框置为选中状态
                            leftTableData[i].flag = 1;//并标记为1，表示是因为rightTableData中已有数据而选中
                        }
                    }
                }
                // console.log(rightTableData);
                return {
                    "code": res.code == 100 ? 0: 1, //解析接口状态
                    "msg": res.msg, //解析提示文本
                    "count": res.extend.userInfoReturn.total, //解析数据长度
                    "data": leftTableData //数据列表
                };
            }
        });

        //监听行工具事件
        // table.on('tool(leftTable)', function(obj){
        //     var data = obj.data;
        //     switch (obj.event) {
        //         case 'add':
        //             var rightTableData = layui.table.cache.rightTable;//获取右表数据
        //             var flag = false;//用来记录右表是否存在这条记录
        //             for(var i=0 ;i<rightTableData.length ; i++){
        //                 if(data.id == rightTableData[i].id){
        //                     flag = true;//存在
        //                     break;
        //                 }
        //             }
        //             if(flag == true){
        //                 layer.msg("添加失败，已存在",{icon:5});
        //             }else{
        //                 rightTableData.unshift(data);
        //                 table.reload("rightTable", {
        //                     data : rightTableData
        //                 });
        //                 obj.tr.find("div div:eq(0)").addClass("layui-form-checked");
        //                 layer.msg("添加成功",{icon:1});
        //             }
        //     }
        // });

        var $ = layui.$,active = {
            reload: function(){
                //执行重载
                table.reload('leftTable', {
                    page: {curr: 1} //重新从第 1 页开始
                    ,where: {
                        username:$('#usernameIpt').val(),
                        name:$("#nameIpt").val(),
                        departName:$("#dept_select1").val()
                    }
                }, 'data');
                $("[data-field='id']").css('display','none');
            }
        };

        $('#searchBtn').on('click', function(){
            var type = $(this).data('type');
            type='reload';
            active[type] ? active[type].call(this) : '';
        });

        $('#selectAddBtn').on('click', function(){
            var leftTableData = layui.table.cache.leftTable;//获取左表数据
            var rightTableData = layui.table.cache.rightTable;//获取右表数据
            // console.log(leftTableData)
            // console.log(rightTableData)
            for(var i = 0 ;i<leftTableData.length ; i++){
                // console.log(leftTableData[i].LAY_CHECKED==true && leftTableData[i].flag != 1);
                // console.log(leftTableData[i].LAY_CHECKED!=true && leftTableData[i].flag == 1)
                if(leftTableData[i].LAY_CHECKED==true && leftTableData[i].flag != 1){//将左表新选中的数据添加至右表
                    // console.log("选中的id："+leftTableData[i].name);
                    rightTableData.push(leftTableData[i]);//将数据添加至右表
                    leftTableData[i].flag=1;//标记为右表已有数据
                    rightTableData[rightTableData.length-1].LAY_CHECKED=false;//添加时的数据为选中状态所以重置
                }else if(leftTableData[i].LAY_CHECKED!=true && leftTableData[i].flag == 1){//右表已有但是左表复选框未选择，则除掉右表的数据
                    for(var j = 0 ; j<rightTableData.length ;j++){
                        if(rightTableData[j].id == leftTableData[i].id){
                            rightTableData.splice(j,1);//删除
                            leftTableData[i].flag=0;//去除标记
                            break;
                        }
                    }
                }
            }
            // console.log(leftTableData)
            // console.log(rightTableData)

            table.reload("leftTable", {
                data : leftTableData
            })

            table.reload("rightTable", {
                data : rightTableData
            })
            $("[data-field='id']").css('display','none');
            // console.log("-------------------分割线-------------------")
        });

        $('#selectDelBtn').on('click',function () {
            var leftTableData = layui.table.cache.leftTable;//获取左表数据
            var rightTableData = layui.table.cache.rightTable;//获取右表数据
            // console.log(leftTableData);
            // console.log(rightTableData);
            for(var i = rightTableData.length-1 ; i>=0 ; i--){
                if(rightTableData[i].LAY_CHECKED == true){//复选框选中
                    // console.log("选中的id："+rightTableData[i].name);
                    for(var j = 0 ; j<leftTableData.length ;j++){
                        if(leftTableData[j].id == rightTableData[i].id){
                            //重置右表数据
                            leftTableData[j].flag=0;
                            leftTableData[j].LAY_CHECKED=false;
                        }
                    }
                    rightTableData.splice(i,1);//删除左表数据
                }
            }
            table.reload("leftTable", {
                data : leftTableData
            })
            table.reload("rightTable", {
                data : rightTableData
            })
            $("[data-field='id']").css('display','none');
        });
        $("[data-field='id']").css('display','none');
    });
</script>
</html>
