/**
 * Created by yufeng.liu on 2017-04-21.
 */
(function ($) {

    //html模板元素
    var htmlElement = {
        //工具栏DIV模板
        toolBarDiv:
        '<div class="grid-toolbar">' +
            '<button class="btn btn-default btn-create">新建</button>' +
            '<button class="btn btn-success btn-save">保存</button>' +
            '<button class="btn btn-danger btn-delete">删除</button>' +
        '</div>',
        //grid头部DIV模板
        headerDiv:
        '<div class="grid-header grid-header-toolbar">' +
            '<table class="table table-bordered table-condensed">' +
                '<tr class="active">' +
                    '<th style="width: 20px" class="all-select">' +
                    '<input title="all-select" type="checkbox">' +
                    '</th>' +
                '</tr>' +
            '</table>' +
        '</div>',
        //grid头部DIV模板，TR中是为了建立bootstrap的样式模板，后会删除该TR
        contentDiv:
        '<div class="grid-content grid-content-toolbar">' +
            '<table class="table table-bordered table-condensed table-hover">' +
                '<tr>' +
                    '<td style="width: 20px" class="one-select">' +
                    '<input title="one-select" type="checkbox">' +
                    '</td>' +
                '</tr>' +
            '</table>' +
        '</div>',
        //grid尾部DIV模板
        footerDiv: ' <div class="grid-footer"></div>',
        //grid尾部pageSize选择DIV模板
        footerSize:
        '<div class="input-group col-lg-1 page-size">' +
            '<select title="page-size" class="form-control">' +
                '<option>10</option>' +
                '<option>15</option>' +
                '<option>20</option>' +
                '<option>25</option>' +
                '<option>30</option>' +
                '<option>35</option>' +
            '</select>' +
        '</div>',
        //grid尾部导航列表DIV模板
        footerNav:
        '<div class="btn-group grid-nav-container">' +
            '<div class="btn-group btn-grid-left">' +
                '<button type="button" class="btn btn-grid-nav prevPage">' +
                    '<i class="fa fa-angle-double-left" aria-hidden="true"></i>' +
                '</button>' +
                '<button type="button" class="btn btn-grid-nav btn-grid-angle prev">' +
                    '<i class="fa fa-angle-left" aria-hidden="true"></i>' +
                '</button>' +
            '</div>' +
            '<div class="btn-group grid-nav">' +
                '<ul class="grid-nav-ul">' +
                    '<li class="active">1</li>' +
                '</ul>' +
            '</div>' +
            '<div class="btn-group btn-grid-right">' +
                '<button type="button" class="btn btn-grid-nav btn-grid-angle next">' +
                    '<i class="fa fa-angle-right" aria-hidden="true"></i>' +
                '</button>' +
                '<button type="button" class="btn btn-grid-nav nextPage">' +
                '   <i class="fa fa-angle-double-right" aria-hidden="true"></i>' +
                '</button>' +
            '</div>' +
        '</div>' +
        '<div class="input-group col-lg-1 page-go">' +
            '<input title="page-num" type="text" class="form-control page-num">' +
            '<span class="input-group-btn">' +
            '<button class="btn btn-default page-btn-go" type="button">Go</button>' +
            '</span>' +
        '</div>',
        //grid页面提示ID DIV模板
        footPage:
        '<div class="input-group grid-page">' +
            '<span class="current-page"></span>' +
            '/' +
            '<span class="total-page"></span>' +
        '</div>',
        //grid刷新按钮DIV模板
        footRefresh :
        '<div class="input-group refresh-grid btn">' +
            '<i class="fa fa-refresh" aria-hidden="true"></i>' +
        '</div>',
        //默认新增DIV模板
        createTrTemplate:
        '<div class="input-group grid-input">' +
            '<input type="text" class="form-control" placeholder="" value="">' +
            '<span style="display: none;">test</span>' +
        '</div>',
        //新增或更改后的标记DIV
        tdNewTag: '<div class="grid-new-tag"></div>'
    };
    //插件方法
    var methods = {
        createClearDiv : function (ele) {
            ele.append('<div style="clear: both"></div>');
            return ele.children();
        },
        createToolBar : function (ele,opt) {
            ele.append(htmlElement.toolBarDiv);
            ele.find('.btn-create').bind('click',function () {
                var gridContent = $(this).parent().parent().children('.grid-content');
                gridContent.children('table').prepend('<tr class="create-tr"><td style="width: 20px" class="one-select"><input title="one-select" type="checkbox"></td></tr>');
                var firstTr = gridContent.children('table').find('tr:first-child');
                for(var j=0;j<opt.columns.length;j++){
                    var field = opt.columns[j].field;
                    //判断是否有模板
                    if(opt.templateMap.hasOwnProperty(field)){
                        //判断是否有样式
                        if(opt.styleMap.hasOwnProperty(field)){
                            firstTr.append('<td style="'+ opt.styleMap[field] +'">'+opt.templateMap[field]+'</td>');
                        }else {
                            firstTr.append('<td>'+opt.templateMap[field]+'</td>');
                        }
                        //选择td最后一个
                        var lastTd = firstTr.children('td:last-child');
                        var regExp=new RegExp('Time');
                        if(regExp.test(field)){
                            util.initKendoTime(lastTd,'',true)
                        }else {
                            if(opt.columns[j].type!=='lov'){
                                util.initEdit(lastTd,true);
                            }else{
                                lastTd.find('.lov-btn').lov(opt.columns[j].lovOptions);
                                lastTd.find('span').bind("DOMNodeInserted",function(){
                                    $(this).closest('td').append(htmlElement.tdNewTag);
                                });
                            }
                        }
                    }else {
                        firstTr.append('<td>'+htmlElement.createTrTemplate+'</td>');
                    }
                }
            });
            //删除
            ele.find('.btn-delete').bind('click',function () {
                var checkedTr = $(this).parent().parent().children('.grid-content').find('.one-select input:checked').parent().parent();
                if(checkedTr.length>1){
                    var data = [];
                    for(var i = 0 ;i < checkedTr.length;i++){
                        var bId = checkedTr.eq(i).attr('id');
                        if(bId!==undefined){
                            bId = bId.split('-')[1];
                            data.push(Number(bId));
                        }
                    }
                    if(data.length>0){
                        ajax.destroy(opt.dataSource.transport.destroy,JSON.stringify(data),'/batch');
                    }
                    checkedTr.remove();
                }else{
                    var id = checkedTr.attr('id');
                    if(id!==undefined){
                        id = id.split('-')[1];
                        ajax.destroy(opt.dataSource.transport.destroy,JSON.stringify(id),'')
                    }
                    checkedTr.remove();
                }
            });
            //更新或新增
            ele.find('.btn-save').bind('click',opt,function (event) {
                var gridContent = $(this).parent().parent().children('.grid-content');
                var createTr = gridContent.find('.create-tr');
                var createTrLength = createTr.length;

                var changeTr = gridContent.find('.grid-new-tag').parent().parent().not('.create-tr');
                var changeTrLength = changeTr.length;
                if(createTrLength>0){
                    util.createEvent(createTr,createTrLength,event.data);
                }
                if(changeTrLength>0){
                    util.updateEvent(changeTr,changeTrLength,event.data);
                }
            });
        },
        createGridHeaderDiv : function (ele) {
            ele.append(htmlElement.headerDiv);
            ele.find('.all-select input').bind('click',function () {
                var oneSelect = $(this).closest('.grid-header').parent().children('.grid-content').find('.one-select').children();
                if($(this).is(":checked")){
                    oneSelect.prop("checked",true);
                }else{
                    oneSelect.prop("checked", false);
                }
            });
            return ele.find('.active');
        },
        createGridHeader : function (ele,opt) {
            var headerTr = methods.createGridHeaderDiv(ele);
            for(var i=0;i<opt.columns.length;i++){
                var title = opt.columns[i].title;
                var attributes = opt.columns[i].attributes;
                var field = opt.columns[i].field;
                if('style' in attributes){
                    //用javascript的for/in循环遍历对象的属性
                    var style = '';
                    for(var item in attributes.style){
                        style = style + item+':'+attributes.style[item] + ';';
                    }
                    opt.styleMap[field] = style;
                    headerTr.append('<th style="'+style+'" class="text-center">'+title+'</th>');
                }
                if('template' in opt.columns[i]){
                    opt.templateMap[field] = opt.columns[i].template;
                }
            }
        },
        createGridContentDiv : function (ele) {
            ele.append(htmlElement.contentDiv);
            ele.find('.grid-content').perfectScrollbar();
            return ele.find('.table-hover');
        },
        createGridContent : function (contentTable,opt,isNew) {
            var data = opt.dataSource.data;
            for(var i=0;i<data.length;i++){
                contentTable.append('<tr id="'+opt.dataId+'-'+data[i][opt.dataId]+'"><td style="width: 20px" class="one-select"><input title="one-select" type="checkbox"></td></tr>');
                var tableTr =  contentTable.find('tr:last-child');
                for(var j=0;j<opt.columns.length;j++){
                    var field = opt.columns[j].field;
                    var contentTd = data[i][field];
                    //判断data中是否有相应的字段，有字段追加内容
                    if( data[i].hasOwnProperty(field)){
                        //判断是否有模板
                        if(opt.templateMap.hasOwnProperty(field)){
                            //判断是否有样式
                            if(opt.styleMap.hasOwnProperty(field)){
                                tableTr.append('<td style="'+ opt.styleMap[field] +'">'+opt.templateMap[field]+'</td>');
                            }else {
                                tableTr.append('<td>'+opt.templateMap[field]+'</td>');
                            }
                            //选择td最后一个
                            var lastTd = tableTr.children('td:last-child');
                            //判断是否是时间，如果是时间就进行转换
                            var regExp=new RegExp('Time');
                            if(regExp.test(field)){
                                contentTd = util.dateFormat(contentTd);
                                util.initKendoTime(lastTd,contentTd,false);
                            }else {
                                if(opt.editable&&opt.columns[j].type!=='lov'){
                                    lastTd.find('input').val(contentTd);
                                    lastTd.find('span').text(contentTd);
                                    util.initEdit(lastTd);
                                }else if(opt.editable&&opt.columns[j].type==='lov'){
                                    var lovOptions = opt.columns[j].lovOptions;
                                    lastTd.find('input').val(contentTd[lovOptions.columns[0].field]);
                                    lastTd.find('span').text(contentTd[lovOptions.columns[1].field]);
                                    lastTd.find('.lov-btn').lov(lovOptions);
                                    lastTd.find('span').bind("DOMNodeInserted",function(){
                                        $(this).closest('td').append(htmlElement.tdNewTag);
                                    });
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
            if(isNew){
                //删除第一个模板
                contentTable.find('tr:first-child').remove();
            }
            methods.changeSly(contentTable.closest('.grid-content').parent(),opt);
            //滚动条
            contentTable.closest('.grid-content').perfectScrollbar('update');

        },
        //创建尾部DIV
        createFooterDiv : function (ele) {
            ele.append(htmlElement.footerDiv);
            return ele.find('.grid-footer');
        },
        createFooterSize : function (ele,opt){
            ele.append(htmlElement.footerSize);
            ele.find('.page-size').children().on('change',opt,function (event) {
                var $navUl = ele.find('.grid-nav-ul');
                var $frame = $navUl.parent();
                $frame.sly('activate', 0);
                methods.navBtnEvent($(this),false,event.data);
            });
        },
        //创建尾部导航
        createFooterNav : function (ele,opt) {
            ele.append(htmlElement.footerNav);
            var navUl = ele.find('.grid-nav-ul');
            for(var i = 1;i<opt.dataSource.totalPage;i++){
                navUl.append('<li>'+(i+1)+'</li>');
            }
            methods.navSly(ele,opt);
            navUl.removeAttr('style');
            var $prev = ele.find('.prev');
            var $next = ele.find('.next');
            $prev.on('click',opt,function (event) {
                methods.navBtnEvent($(this),false,event.data);
            });
            $next.on('click',opt,function (event) {
                methods.navBtnEvent($(this),false,event.data);
            });
            navUl.children().on('click',opt,function (event) {
                methods.navBtnEvent($(this),true,event.data);
            });
        },
        changeSly:function (ele,opt) {
            var $navUl = ele.find('.grid-nav-ul');
            var $frame = $navUl.parent();
            if(opt.dataSource.totalPage>$navUl.children().length){
                //console.log('total:'+opt.dataSource.totalPage+' nuvUl:'+$navUl.children().length);
                var number = opt.dataSource.totalPage-$navUl.children().length;
                //console.log('opt.dataSource.totalPage - $navUl.children().length:'+test);
                for(var i = 0; i < number; i++){
                    $frame.sly('add', '<li>' + Number($navUl.children().length +1) + '</li>');
                }
                $navUl.children().on('click',function () {
                    methods.navBtnEvent($(this),true,opt);
                });
                $frame.sly('activate', 0);
            }else if(opt.dataSource.totalPage<$navUl.children().length){
                if(opt.dataSource.totalPage===0){
                    for(var j=Number($navUl.children().length)-1;j>=0;j--){
                        $frame.sly('remove', j);
                    }
                }else {
                    console.log('length : '+$navUl.children().length);
                    console.log('totalPage : '+opt.dataSource.totalPage);
                    for(var k=$navUl.children().length-1;k>opt.dataSource.totalPage-1;k--){
                        console.log(k);
                        $frame.sly('remove', k);
                    }
                    $frame.sly('activate', 0);
                }
            }
        },
        navBtnEvent : function (ele,isLi,opt) {
            var transport = opt.dataSource.transport;
            var clearDiv = ele.closest('.grid-footer').parent();
            clearDiv.children('.grid-content').find('tr').remove();
            var pageSize = clearDiv.find('.page-size').children().val();
            var page;
            if(isLi){
                page = Number(ele.text());
            }else {
                var activeLi = clearDiv.find('.grid-nav-ul').find('.active');
                page = Number(activeLi.text());
            }
            opt.dataSource = ajax.read(transport.read,transport.param,page,pageSize);
            opt.dataSource['transport'] = transport;
            methods.createGridContent(clearDiv.find('.table-hover'),opt,false);
            clearDiv.find('.current-page').text(opt.dataSource.page);
            clearDiv.find('.total-page').text(opt.dataSource.totalPage);
        },
        //添加导航动态样式
        navSly : function (ele,opt) {
            var $gridNav  = ele.find('.grid-nav');
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
                methods.navBtnEvent($(this),false,opt);
            });
        },
        createGridPage : function (ele,opt) {
            ele.append(htmlElement.footPage);
            ele.find('.current-page').text(opt.dataSource.page);
            ele.find('.total-page').text(opt.dataSource.totalPage);
        },
        //创建grid的刷新按钮
        createGridRefresh : function (ele,opt) {
            ele.append(htmlElement.footRefresh);
            ele.find('.refresh-grid').on('click',function () {
                methods.navBtnEvent($(this),false,opt);
            });
        },
        createGridFooter : function (ele,opt) {
            var footer = methods.createFooterDiv(ele);
            methods.createFooterSize(footer,opt);
            methods.createFooterNav(footer,opt);
            methods.createGridPage(footer,opt);
            methods.createGridRefresh(footer,opt);
        }

    };

    var DataGrid = function (ele,opt) {
        this.$element = ele;
        this.defaults = {
            toolBar: true,
            editable: false,
            columns: [],
            dataSource: {},
            dataId: '',
            styleMap : {},//样式集合
            templateMap : {}//模板集合
        };
        this.options = opt;
        this.options = $.extend({}, this.defaults, opt);
    };

    DataGrid.prototype = {
        init : function () {
            var clearDiv = methods.createClearDiv(this.$element);
            if(this.options.toolBar){
                methods.createToolBar(clearDiv,this.options);
            }
            methods.createGridHeader(clearDiv,this.options);
            var contentDiv = methods.createGridContentDiv(clearDiv);
            methods.createGridContent(contentDiv,this.options,true);
            methods.createGridFooter(clearDiv,this.options);
        }
    };

    $.fn.dataGrid = function (options) {
        //创建DataGrid的实体
        var dataGrid = new DataGrid(this, options);
        //调用其方法
        dataGrid.init();
    };

    var util = {
        //时间格式转换
        dateFormat: function (date) {
            var dateValue = new Date(date);
            var year = dateValue.getFullYear();
            var month = dateValue.getMonth();
            var day = dateValue.getDate();
            var hour = dateValue.getHours();
            var minute = dateValue.getMinutes();
            var second = dateValue.getSeconds();
            return  util.changeZero(Number(year))+'-'+
                util.changeZero(Number(month)+1)+'-'+
                util.changeZero(Number(day))+' '+
                util.changeZero(Number(hour))+':'+
                util.changeZero(Number(minute))+':'+
                util.changeZero(Number(second));
        },
        //给时间中小于10的前面添加一个0
        changeZero : function (arg) {
            var result = '';
            if(arg<10){
                result = '0' + String(arg);
                return result;
            }else {
                return arg;
            }
        },
        //解析参数
        parseParam : function (array,param) {
            for(var item in param){
                var name = ''+item;
                array[name] = param[name];
            }
            return array;
        },
        //有kendo ui Time的编辑初始化
        initKendoTime : function (lastTd,contentTd,status) {
            lastTd.find('input').kendoDateTimePicker({
                value:new Date(),
                format: "yyyy-MM-dd HH:mm:ss",
                timeFormat: "HH:mm",
                interval: 10
            });
            var firstSpan = lastTd.find('.k-header');
            var lastSpan = lastTd.find('.grid-input').children('span:last-child');
            firstSpan.find('input').show();

            if(status){
                firstSpan.show();
                lastSpan.hide();
            }else{
                firstSpan.find('input').val(contentTd);
                firstSpan.hide();
                lastSpan.show();
                lastSpan.text(contentTd);
            }
            var val = firstSpan.find('input').val();
            lastSpan.click(function () {
                lastSpan.hide();
                firstSpan.show();
            });

            firstSpan.find('input').bind('blur',function () {
                var value = $(this).val();
                firstSpan.hide();
                lastSpan.show();
                if(status){
                    lastSpan.text(value);
                    firstSpan.closest('td').append(htmlElement.tdNewTag);
                }else {
                    if(val!==value){
                        lastSpan.text(value);
                        firstSpan.closest('td').append(htmlElement.tdNewTag);
                    }else{
                        lastSpan.text(val);
                        firstSpan.closest('td').children('.grid-new-tag').remove();
                    }
                }
            });
        },
        //可编辑事件绑定，失去焦点时判断内容是否更改或添加，如果有，则给TD添加标记
        inputBlur : function (e1,e2,val) {
            e1.bind('blur',function () {
                var value = e1.val();
                e1.hide();
                e2.show();
                if(val!==value){
                    e2.text(value);
                    e1.closest('td').append(htmlElement.tdNewTag);
                }else{
                    e2.text(val);
                    e1.closest('td').children('.grid-new-tag').remove();
                }
            });
        },
        //初始化TD编辑
        initEdit : function (e,status) {
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
            util.inputBlur(tdInput,tdSpan,tdInputVal);

        },
        createEvent : function (createTr,createTrLength,opt) {
            if(createTrLength===1){
                var inputData = {};
                inputData = util.parseInput(1,createTr,inputData,opt.dataSource.transport.param);
                ajax.create(opt.dataSource.transport.create,JSON.stringify(inputData),'');
            }else{
                var batchTrData = [];
                for(var index = createTrLength-1;index>=0;index--){
                    var bInputData = {};
                    bInputData = util.parseInput(1,createTr.eq(index),bInputData,opt.dataSource.transport.param);
                    batchTrData.push(bInputData);
                }
                ajax.create(opt.dataSource.transport.create,JSON.stringify(batchTrData),'/batch');
            }
            createTr.closest('.grid-content').parent().find('.refresh-grid').trigger('click');
        },
        updateEvent : function (changeTr,changeTrLength,opt) {
            if(changeTrLength===1){
                var inputData = {};
                var id = changeTr.attr('id');
                if(id!==undefined){
                    inputData[id.split('-')[0]] = id.split('-')[1];
                }
                inputData = util.parseInput(0,changeTr.find('.grid-new-tag').parent(),inputData,opt.dataSource.transport.param);
                ajax.update(opt.dataSource.transport.update,JSON.stringify(inputData),'');
            }else{
                var batchTrData = [];
                for(var index = changeTrLength-1;index>=0;index--){
                    var bChangeTr = changeTr.eq(index);
                    var bInputData = {};
                    var bId = bChangeTr.attr('id');
                    if(bId!==undefined){
                        bInputData[bId.split('-')[0]] = bId.split('-')[1];
                    }
                    bInputData = util.parseInput(0,bChangeTr.find('.grid-new-tag').parent(),bInputData,opt.dataSource.transport.param);
                    batchTrData.push(bInputData);
                }
                ajax.update(opt.dataSource.transport.update,JSON.stringify(batchTrData),'/batch');
            }
            changeTr.closest('.grid-content').parent().find('.refresh-grid').trigger('click');
        },
        parseInput : function (index,saveTr,inputData,param) {
            var trInput = saveTr.find('input');
            inputData = util.parseParam(inputData,param);
            for(var i = index;i<trInput.length;i++){
                var input = trInput.eq(i);
                var name = input.attr('name');
                var regExp=new RegExp('Time');
                if(regExp.test(input.attr('name'))){
                    inputData[name] = new Date(input.val());
                }else {
                    inputData[name] = input.val();
                }
            }
            return inputData;
        }

    };

})(jQuery);


//创建ajax请求
var ajax = {
    create:function (args,data,batch) {
        $.ajax({
            url: args.url+batch,
            type:'post',
            dataType:args.dataType,
            contentType: "application/json;charset=utf-8",
            data:data,
            async:false,
            success:function (data) {
                return data;
            },
            error:function () {
                alert('发生未知错误，请稍后再试');
            }
        });
    },
    destroy:function(args,data,batch){
        $.ajax({
            url: args.url+batch,
            type:'post',
            dataType:args.dataType,
            contentType: "application/json;charset=utf-8",
            data:data,
            async:false,
            success:function (data) {
                return data;
            },
            error:function () {
                alert('发生未知错误，请稍后再试');
            }
        });
    },
    update:function (args,data,batch) {
        $.ajax({
            url: args.url+batch,
            type:'post',
            dataType:args.dataType,
            contentType: "application/json;charset=utf-8",
            data:data,
            async:false,
            success:function (data) {
                return data;
            },
            error:function () {
                alert('发生未知错误，请稍后再试');
            }
        });
    },
    read:function (args,data,page,pageSize) {
        var result = {};
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

var grid = {
    dataSource:function (args) {
        if(args.transport.hasOwnProperty('read')){
            return $.extend({}, ajax.read(args.transport.read,args.transport.param,args.page,args.pageSize), args);
        }
    }
};