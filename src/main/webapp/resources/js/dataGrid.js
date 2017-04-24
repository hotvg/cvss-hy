/**
 * Created by yufeng.liu on 2017-04-21.
 */
$(function () {

    //新建
    $('.btn-create').click(function () {
        var gridContent = $(this).parent().parent().children('.grid-content');
        gridContent.children('table').prepend(
        '<tr>'+
            '<td class="text-center one-select"><input title="one-select" type="checkbox"></td>' +
            '<td class="col-md-1">新增</td>' +
            '<td class="col-md-2">新增</td>' +
            '<td class="col-md-6">新增</td>' +
            '<td class="col-md-1">新增</td>' +
            '<td class="col-md-2">新增</td>' +
        '</tr>'
        );
        //更新滚动条
        Ps.update(gridContent);
    });

    //全选
    $('.all-select input').click(function () {
        var oneSelect = $(this).closest('.grid-header').parent().children('.grid-content').find('.one-select').children();
        if($(this).is(":checked")){
            oneSelect.prop("checked",true);
        }else{
            oneSelect.prop("checked", false);
        }
    });

    //删除
    $('.btn-delete').click(function () {
        var gridContent = $(this).parent().parent().children('.grid-content').find('.one-select input:checked').parent().parent();
        gridContent.remove();
    });

    //滚动条
    $('.grid-content').perfectScrollbar();

    //滚动导航
    (function () {
        var $gridNav  = $('.grid-nav');
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
    }());

    $('.grid-input').click(function () {
       var tdInput = $(this).children('input');
       var tdSpan = $(this).children('span');
        inputBlur(tdInput,tdSpan);
        tdInput.show();
        tdSpan.hide();
    });

    var inputBlur = function (e1,e2) {
        e1.bind('blur',function () {
            var value = e1.val();
            e1.hide();
            e2.show();
            e2.text(value);
            console.log('我的移出事件发生了');
        });
    };

});
var toolBar = null;
var columns = null;
var dataSource = null;
var data = null;

var toolBarDiv =
    '<div class="grid-toolbar">'+
        '<button class="btn btn-default btn-create">新建</button>'+
        '<button class="btn btn-success btn-save">保存</button>'+
        '<button class="btn btn-danger btn-delete">删除</button>'+
    '</div>';

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

var createClearDiv = function (e) {
    e.append('<div style="clear: both"></div>');
    return e.children();
};

var createToolBar = function (e) {
    e.append(toolBarDiv);
    e.find('.btn-create').bind('click',function () {
        var gridContent = $(this).parent().parent().children('.grid-content');
        gridContent.children('table').prepend(
            '<tr>' +
            '<td class="text-center one-select"><input title="one-select" type="checkbox"></td>' +
            '<td class="col-md-1">新增</td>' +
            '<td class="col-md-2">新增</td>' +
            '<td class="col-md-6">新增</td>' +
            '<td class="col-md-1">新增</td>' +
            '<td class="col-md-2">新增</td>' +
            '</tr>'
        );
        //更新滚动条
        Ps.update(gridContent);
    });
};

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

var createGridHeader = function (e) {
    var headerTr = createGridHeaderDiv(e);
    for(var i=0;i<columns.length;i++){
        var title = columns[i].title;
        var attributes = columns[i].attributes;
        if('style' in attributes){
            var style = '';
            //用javascript的for/in循环遍历对象的属性
            for(var item in attributes.style){
                style = style + item+':'+attributes.style[item] + ';';
            }
            headerTr.append('<th style="'+style+'" class="text-center">'+title+'</th>');
        }
    }
};

var createGridContentDiv = function (e) {
    e.append(contentDiv);
    return e.find('.table-hover');
};

var createGridContent = function (e) {
    var contentTable = createGridContentDiv(e);
    for(var i=0;i<data.length;i++){
        contentTable.append('<tr><td style="width: 20px" class="one-select"><input title="one-select" type="checkbox"></td></tr>');
        var tableTr =  contentTable.find('tr:last-child');

        for(var j=0;j<columns.length;j++){
            tableTr.append('<td>test</td>');
        }


        // for(var item in data[i]){
        //     // td = td + item+':'+data[item] + ';';
        //     tableTr.append('<td>'+data[i][item]+'</td>');
        // }
    }
    contentTable.find('tr:first-child').remove();
};

$.fn.extend({
    dataGrid:function(args) {
        toolBar = args.toolBar;
        columns = args.columns;
        dataSource = args.dataSource;
        data = dataSource.data;
        var clearDiv = createClearDiv($(this));
        if(toolBar){
            createToolBar(clearDiv);
        }
        createGridHeader(clearDiv);
        createGridContent(clearDiv);

    }
});