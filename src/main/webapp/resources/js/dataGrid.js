/**
 * Created by yufeng.liu on 2017-04-21.
 */
var toolBar = null;//工具栏
var columns = null;//栏目
var dataSource = null;//数据源
var data = null;//数据
var styleMap = {};//样式集合
var templateMap = {};//模板集合
var editable = false;//是否可以编辑
var transport = null;//数据传输
var dataId = null;//数据ID

//工具栏DIV模板
var toolBarDiv =
    '<div class="grid-toolbar">'+
        '<button class="btn btn-default btn-create">新建</button>'+
        '<button class="btn btn-success btn-save">保存</button>'+
        '<button class="btn btn-danger btn-delete">删除</button>'+
    '</div>';
//grid头部DIV模板
var headerDiv =
    '<div class="grid-header grid-header-toolbar">' +
        '<table class="table table-bordered table-condensed">' +
            '<tr class="active">' +
                '<th style="width: 20px" class="all-select">' +
                    '<input title="all-select" type="checkbox">' +
                '</th>' +
            '</tr>' +
    '</table>' +
    '</div>';
//grid头部DIV模板，TR中是为了建立bootstrap的样式模板，后会删除该TR
var contentDiv =
    '<div class="grid-content grid-content-toolbar">'+
        '<table class="table table-bordered table-condensed table-hover">' +
            '<tr>' +
                '<td style="width: 20px" class="one-select">' +
                    '<input title="one-select" type="checkbox">' +
                '</td>' +
            '</tr>'+
        '</table>' +
    '</div>';
//grid尾部DIV模板
var footerDiv = ' <div class="grid-footer"></div>';
//grid尾部pageSize选择DIV模板
var footerSize =
    '<div class="input-group col-lg-1 page-size">'+
        '<select title="page-size" class="form-control">'+
            '<option>10</option>'+
            '<option>15</option>'+
            '<option>20</option>'+
            '<option>25</option>'+
            '<option>30</option>'+
            '<option>35</option>'+
        '</select>'+
    '</div>';
//grid尾部导航列表DIV模板
var footerNav =
    '<div class="btn-group grid-nav-container">'+
        '<div class="btn-group btn-grid-left">'+
            '<button type="button" class="btn btn-grid-nav prevPage">'+
                '<i class="fa fa-angle-double-left" aria-hidden="true"></i>'+
            '</button>'+
            '<button type="button" class="btn btn-grid-nav btn-grid-angle prev">'+
                '<i class="fa fa-angle-left" aria-hidden="true"></i>'+
            '</button>'+
        '</div>'+
        '<div class="btn-group grid-nav">'+
            '<ul class="grid-nav-ul">'+
                '<li class="active">1</li>'+
            '</ul>'+
        '</div>'+
        '<div class="btn-group btn-grid-right">'+
            '<button type="button" class="btn btn-grid-nav btn-grid-angle next">'+
                '<i class="fa fa-angle-right" aria-hidden="true"></i>'+
            '</button>'+
            '<button type="button" class="btn btn-grid-nav nextPage">'+
                '<i class="fa fa-angle-double-right" aria-hidden="true"></i>'+
            '</button>'+
        '</div>'+
    '</div>'+
    '<div class="input-group col-lg-1 page-go">'+
        '<input title="page-num" type="text" class="form-control page-num">'+
        '<span class="input-group-btn">'+
            '<button class="btn btn-default page-btn-go" type="button">Go</button>'+
        '</span>'+
    '</div>';
//grid页面提示ID DIV模板
var footPage =
    '<div class="input-group grid-page">'+
        '<span class="current-page"></span>'+
        '/'+
        '<span class="total-page"></span>'+
    '</div>';
//grid刷新按钮DIV模板
var footRefresh =
    '<div class="input-group refresh-grid btn">'+
        '<i class="fa fa-refresh" aria-hidden="true"></i>'+
    '</div>';
//默认新增DIV模板
var createTrTemplate =
    '<div class="input-group grid-input">'+
        '<input type="text" class="form-control" placeholder="" value="">'+
        '<span style="display: none;">test</span>'+
    '</div>';
//新增或更改后的标记DIV
var tdNewTag = '<div class="grid-new-tag"></div>';
//可编辑事件绑定，失去焦点时判断内容是否更改或添加，如果有，则给TD添加标记
var inputBlur = function (e1,e2,val) {
    e1.bind('blur',function () {
        var value = e1.val();
        e1.hide();
        e2.show();
        if(val!==value){
            e2.text(value);
            e1.closest('td').append(tdNewTag);
        }else{
            e2.text(val);
            e1.closest('td').children('.grid-new-tag').remove();
        }
    });
};
//初始化TD编辑
var initEdit = function (e,status) {
    var tdInput = e.find('input');
    var tdInputVal = tdInput.val();
    var tdSpan = e.find('span');
    if(status){
        tdInput.show();
        tdSpan.hide();
    }
    e.click(function () {
        $(this).find('input').show();
        $(this).find('span').hide();
    });
    inputBlur(tdInput,tdSpan,tdInputVal);

};
//创建grid最初始的div
var createClearDiv = function (e) {
    e.append('<div style="clear: both"></div>');
    return e.children();
};
//创建工具栏，并重新绑定事件
var createToolBar = function (e) {
    e.append(toolBarDiv);
    e.find('.btn-create').bind('click',function () {
        var gridContent = $(this).parent().parent().children('.grid-content');
        gridContent.children('table').prepend('<tr class="create-tr"><td style="width: 20px" class="one-select"><input title="one-select" type="checkbox"></td></tr>');
        var firstTr = gridContent.children('table').find('tr:first-child');
        for(var j=0;j<columns.length;j++){
            var field = columns[j].field;
            //判断是否有模板
            if(templateMap.hasOwnProperty(field)){
                //判断是否有样式
                if(styleMap.hasOwnProperty(field)){
                    firstTr.append('<td style="'+ styleMap[field] +'">'+templateMap[field]+'</td>');
                }else {
                    firstTr.append('<td>'+templateMap[field]+'</td>');
                }
                //选择td最后一个
                var lastTd = firstTr.children('td:last-child');
                initEdit(lastTd,true);
            }else {
                firstTr.append('<td>'+createTrTemplate+'</td>');
            }
        }
    });
    //删除
    e.find('.btn-delete').bind('click',function () {
        var checkedTr = $(this).parent().parent().children('.grid-content').find('.one-select input:checked').parent().parent();
        if(checkedTr.length>1){
            for(var i = 0 ;i < checkedTr.length;i++){

            }
        }else{
            var id = checkedTr.attr('id');
            if(id!==undefined){
                id = id.split('-')[1];
                console.log(id);
                ajax.destroy(transport.destroy,{id:Number(id)})
            }
            checkedTr.remove();
        }
    });
    //更新或新增
    e.find('.btn-save').bind('click',function () {
        var gridContent = $(this).parent().parent().children('.grid-content');
        var createTr = gridContent.find('.create-tr');
        var createTrLength = createTr.length;
        console.log(createTrLength);
        if(createTrLength === 0){
            var gridNewLength = gridContent.find('.grid-new-tag').length;
            console.log(gridNewLength);
            if(gridNewLength !== 0){
                ajax.update(transport.update);
            }
        }else if(createTrLength===1){
            var trInput = createTr.find('input');
            var inputData = {};
            for(var i = 1;i<trInput.length;i++){
                var input = trInput.eq(i);
                inputData[input.attr('name')] = input.val();
            }
            console.log(inputData);
           ajax.create(transport.create,inputData);
        }else{
            // var data = {};
            // for(var i = 0; i<createTrLength ;i++){
            //
            // }
            // ajax.create(transport.create);
        }
    });
};
//创建grid的头部DIV
var createGridHeaderDiv = function (e) {
    e.append(headerDiv);
    e.find('.all-select input').bind('click',function () {
        var oneSelect = $(this).closest('.grid-header').parent().children('.grid-content').find('.one-select').children();
        if($(this).is(":checked")){
            oneSelect.prop("checked",true);
        }else{
            oneSelect.prop("checked", false);
        }
    });
    return e.find('.active');
};
//创建grid的头部，需要根据参数中的栏目进行，并保存样式和模板
var createGridHeader = function (e) {
    var headerTr = createGridHeaderDiv(e);
    for(var i=0;i<columns.length;i++){
        var title = columns[i].title;
        var attributes = columns[i].attributes;
        var field = columns[i].field;
        if('style' in attributes){
            //用javascript的for/in循环遍历对象的属性
            var style = '';
            for(var item in attributes.style){
                style = style + item+':'+attributes.style[item] + ';';
            }
            styleMap[field] = style;
            headerTr.append('<th style="'+style+'" class="text-center">'+title+'</th>');
        }
        if('template' in columns[i]){
            templateMap[field] = columns[i].template;
        }
    }
};
//创建grid内容DIV
var createGridContentDiv = function (e) {
    e.append(contentDiv);
    return e.find('.table-hover');
};
//创建grid内容，需要根据data和columns
var createGridContent = function (e) {
    var contentTable = createGridContentDiv(e);
    for(var i=0;i<data.length;i++){
        contentTable.append('<tr id="'+dataId+'-'+data[i][dataId]+'"><td style="width: 20px" class="one-select"><input title="one-select" type="checkbox"></td></tr>');
        var tableTr =  contentTable.find('tr:last-child');
        for(var j=0;j<columns.length;j++){
            var field = columns[j].field;
            var contentTd = data[i][field];
            //判断data中是否有相应的字段，有字段追加内容
            if( data[i].hasOwnProperty(field)){
                //判断是否有模板
                if(templateMap.hasOwnProperty(field)){
                    //判断是否有样式
                    if(styleMap.hasOwnProperty(field)){
                        tableTr.append('<td style="'+ styleMap[field] +'">'+templateMap[field]+'</td>');
                    }else {
                        tableTr.append('<td>'+templateMap[field]+'</td>');
                    }
                    //选择td最后一个
                    var lastTd = tableTr.children('td:last-child');
                    //判断是否是时间，如果是时间就进行转换
                    var regExp=new RegExp('Time');
                    if(regExp.test(field)){
                        contentTd = dateFormat(contentTd);
                        lastTd.find('input').kendoDateTimePicker({
                            value:new Date()
                        });
                        var firstSpan = lastTd.find('span:first-child');
                        var lastSpan = lastTd.find('span:last-child');
                        lastTd.find('input').val(contentTd);
                        lastTd.find('span:last-child').text(contentTd);
                        lastSpan.click(function () {
                            $(this).find('span:last-child').hide();
                            firstSpan.find('span:first-child').show();
                        });
                        inputBlur(lastTd.find('span:first-child'),lastTd.find('span:last-child'),lastTd.find('input').val());
                    }else {
                        lastTd.find('input').val(contentTd);
                        lastTd.find('span').text(contentTd);
                        if(editable){
                            initEdit(lastTd);
                        }
                    }
                }else {
                    tableTr.append('<td>'+contentTd+'</td>');
                }
            }else {
                tableTr.append('<td></td>');
            }
        }
    }
    //滚动条
    e.find('.grid-content').perfectScrollbar();
    //删除第一个模板
    contentTable.find('tr:first-child').remove();
};
//创建尾部DIV
var createFooterDiv = function (e) {
    e.append(footerDiv);
    return e.find('.grid-footer');
};
//创建尾部导航
var createFooterNav =function (e) {
    e.append(footerNav);
    var navUl = e.find('.grid-nav-ul');
    for(var i = 1;i<dataSource.totalPage;i++){
        navUl.append('<li>'+(i+1)+'</li>');
    }
    navSly(e);
};
//添加导航动态样式
var navSly = function (e) {
    var $gridNav  = e.find('.grid-nav');
    var $container  = $gridNav.parent();
    $gridNav.sly({
        horizontal: 1,
        itemNav: 'centered',
        smart: 1,
        activateOn: 'click',
        mouseDragging: 1,
        touchDragging: 1,
        releaseSwing: 1,
        startAt: 0,
        scrollBy: 1,
        activatePageOn: 'click',
        speed: 300,
        elasticBounds: 1,
        easing: 'easeOutExpo',
        dragHandle: 1,
        dynamicHandle: 1,
        clickBar: 1,

        // Buttons
        prev: $container.find('.prev'),
        next: $container.find('.next'),
        prevPage: $container.find('.prevPage'),
        nextPage: $container.find('.nextPage')
    });

    $container.parent().find('.page-btn-go').on('click', function () {
        var item = $(this).parent().parent().children('input').val();
        $gridNav.sly('activate', item-1);
    });
};
//创建grid的page提示
var createGridPage = function (e) {
    e.append(footPage);
    e.find('.current-page').text(dataSource.page);
};
//创建grid的刷新按钮
var createGridRefresh = function (e) {
    e.append(footRefresh);
    e.find('.total-page').text(dataSource.totalPage);
};
//创建grid的尾部
var createGridFooter = function (e) {
    var footer = createFooterDiv(e);
    footer.append(footerSize);
    createFooterNav(footer);
    createGridPage(footer);
    createGridRefresh(footer);
};
//将dataGrid添加到jQuery的对象库
$.fn.extend({
    dataGrid:function(args) {
        toolBar = args.toolBar;
        columns = args.columns;
        dataSource = args.dataSource;
        data = dataSource.data;
        editable = args.editable;
        dataId = args.dataId;
        var clearDiv = createClearDiv($(this));
        if(toolBar){
            createToolBar(clearDiv);
        }
        createGridHeader(clearDiv);
        createGridContent(clearDiv);
        createGridFooter(clearDiv);
    }
});

$.extend({
   grid:function () {
           console.log('洞彻');

   }
});
//创建dataSource，用于在后台取数据，保存传输方式的内存中
var grid = {
    dataSource:function (args) {
        transport = args.transport;
        // if(transport.hasOwnProperty('create')){
        //     return ajax.create(transport.create);
        // }
        // if(transport.hasOwnProperty('destroy')){
        //     return ajax.create(transport.destroy);
        // }
        // if(transport.hasOwnProperty('update')){
        //     return ajax.create(transport.update);
        // }
        if(transport.hasOwnProperty('read')){
            return ajax.read(transport.read,args.page,args.pageSize);
        }
    }
};
//创建ajax请求
var ajax = {
    create:function (args,data) {
        $.ajax({
            url: args.url,
            type:'post',
            dataType:args.dataType,
            data:data,
            success:function (data) {
                return data;
            },
            error:function () {
                alert('发生未知错误，请稍后再试');
            }
        });
    },
    destroy:function(args,data){
        $.ajax({
            url: args.url,
            type:'post',
            dataType:args.dataType,
            data:data,
            success:function (data) {
                return data;
            },
            error:function () {
                alert('发生未知错误，请稍后再试');
            }
        });
    },
    update:function (args,data) {
        $.ajax({
            url: args.url,
            type:'post',
            dataType:args.dataType,
            data:data,
            success:function (data) {
                return data;
            },
            error:function () {
                alert('发生未知错误，请稍后再试');
            }
        });
    },
    read:function (args,page,pageSize) {
        var result = {};
        var data = args.data;
        data['page'] = page;
        data['pageSize'] = pageSize;
        $.ajax({
            url: args.url,
            type:'post',
            dataType:args.dataType,
            data:data,
            async:false,
            success:function (data) {
                result = data;
            },
            error:function () {
                alert('发生未知错误，请稍后再试');
            }
        });
        return result;
    }
};
//时间格式转换
var dateFormat = function (date) {
    var dateValue = new Date(date);
    var year = dateValue.getFullYear();
    var month = dateValue.getMonth();
    var day = dateValue.getDate();
    var hour = dateValue.getHours();
    var minute = dateValue.getMinutes();
    var second = dateValue.getSeconds();
    return  changeZero(Number(year))+'-'+
        changeZero(Number(month)+1)+'-'+
        changeZero(Number(day))+' '+
        changeZero(Number(hour))+':'+
        changeZero(Number(minute))+':'+
        changeZero(Number(second));
};
//给时间中小于10的前面添加一个0
var changeZero = function (arg) {
    var result = '';
    if(arg<10){
        result = '0' + String(arg);
        return result;
    }else {
        return arg;
    }

};