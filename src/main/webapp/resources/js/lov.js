/**
 * lov 值列表 List of Values
 * Created by yufeng.liu on 2017-05-04.
 */
(function ($) {

    var $lov;

    var htmlElement = {
        lovContainer: '<div class="container lov"></div>',
        lovForm:
        '<form class="form-horizontal lov-form" role="form">'+
            '<div class="form-group">'+
                '<label class="col-sm-2 control-label"></label>'+
                '<div class="col-sm-5 input-group">'+
                    '<input type="text" class="form-control" placeholder="">'+
                '</div>'+
            '</div>'+
            '<div class="form-group">'+
                '<label class="col-sm-2 control-label"></label>'+
                '<div class="col-sm-5 input-group">'+
                    '<input type="text" class="form-control" placeholder="">'+
                '</div>'+
                '<button type="button" class="btn btn-default lov-btn-search">搜索</button>'+
            '</div>'+
        '</form>',
        lovHeader:
        '<div class="lov-header">' +
            '<table class="table table-bordered table-condensed">' +
                '<tr class="active">' +

                '</tr>' +
            '</table>' +
        '</div>',
        lovContent:
        '<div class="lov-content">'+
            '<table class="table table-bordered table-condensed table-hover">'+
                '<tr>' +
                    '<td>测试</td>'+
                    '<td>测试</td>'+
                '</tr>'+
            '</table>'+
        '</div>',
        lovFooter:
        '<div class="lov-footer">'+
            '<div class="lov-footer-border">'+
                '<div class="btn-group">'+
                    '<div class="btn-group lov-btn">'+
                    '<button type="button" class="btn prevPage">'+
                        '<i class="fa fa-angle-double-left" aria-hidden="true"></i>'+
                    '</button>'+
                    '<button type="button" class="btn prev lov-angle-btn">'+
                        '<i class="fa fa-angle-left" aria-hidden="true"></i>'+
                    '</button>'+
                '</div>'+
                '<div class="btn-group lov-sly">'+
                    '<ul class="lov-footer-nav">'+

                    '</ul>'+
                '</div>'+
                '<div class="btn-group lov-btn">'+
                    '<button type="button" class="btn next lov-angle-btn">'+
                        '<i class="fa fa-angle-right" aria-hidden="true"></i>'+
                    '</button>'+
                    '<button type="button" class="btn nextPage">'+
                        '<i class="fa fa-angle-double-right" aria-hidden="true"></i>'+
                    '</button>'+
                '</div>'+
            '</div>'+
        '</div>'
    };

    var methods = {
        createLovDiv: function (ele) {
            ele.append('<div class="lov-div"></div>');
            return ele.find('.lov-div');
        },
        createForm:function (ele,$lov) {
            ele.append(htmlElement.lovForm);
            var label = ele.children('.lov-form').find('label');
            var input = ele.children('.lov-form').find('input');
            label.eq(0).text($lov.options.columns[0].name);
            input.eq(0).attr('name',$lov.options.columns[0].field);
            label.eq(1).text($lov.options.columns[1].name);
            input.eq(1).attr('name',$lov.options.columns[1].field);
        },
        createHeader:function (ele,$lov) {
            ele.append(htmlElement.lovHeader);
            ele.children('.lov-header').find('tr').append('<th>'+$lov.options.columns[0].name+'</th>'+'<th>'+$lov.options.columns[1].name+'</th>');
        },
        createContentDiv:function (ele) {
            ele.append(htmlElement.lovContent);
            //滚动条
            ele.find('.lov-content').perfectScrollbar();
        },
        createContent:function (ele,$lov,data,isInit) {
            var lovContent = ele.children('.lov-content');
            var dataSource = methods.read(data,$lov.options);
            $lov.options['dataSource'] = dataSource;
            methods.changeSly(ele,$lov);
            for(var j = 0;j < dataSource.data.length;j++){
                lovContent.find('table').append('<tr><td>'+dataSource.data[j][$lov.options.columns[0].field]+'</td><td>'+dataSource.data[j][$lov.options.columns[1].field]+'</td></tr>');
            }
            if(isInit){
                lovContent.find('tr:first-child').remove();
            }
            methods.closeLov(lovContent.find('tr'),$lov);
            //滚动条
            lovContent.perfectScrollbar('update');
        },
        changeSly:function (ele,$lov) {
            var $navUl = ele.find('.lov-footer-nav');
            var $frame = $navUl.parent();
            var totalPage = $lov.options.dataSource.totalPage;
            var length = $navUl.children().length;
            if(totalPage>length){
                var number = totalPage-length;
                for(var i = 0; i < number; i++){
                    $frame.sly('add', '<li>' + Number(length +1) + '</li>');
                }
                $navUl.children().on('click',function () {
                    methods.navBtnEvent($(this),true,$lov);
                });
                $frame.sly('activate', 0);
            }else if(totalPage<length){
                if(totalPage===0){
                    for(var j=length-1;j>=0;j--){
                        $frame.sly('remove', j);
                    }
                }else {
                    for(var k=length - totalPage;k>0;k--){
                        $frame.sly('remove', k);
                    }
                    $frame.sly('activate', 0);
                }
            }

        },
        createFooter:function (ele,$lov) {
            ele.append(htmlElement.lovFooter);
            var navUl = ele.find('.lov-footer-nav');
            for(var i = 0;i<$lov.options.dataSource.totalPage;i++){
                navUl.append('<li>'+(i+1)+'</li>');
            }
            methods.navSly(ele);
            navUl.removeAttr('style');
            var $prev = ele.find('.prev');
            var $next = ele.find('.next');
            $prev.on('click',$lov,function (event) {
                methods.navBtnEvent($(this),false,event.data);
            });
            $next.on('click',$lov,function (event) {
                methods.navBtnEvent($(this),false,event.data);
            });
            navUl.children().on('click',$lov,function (event) {
                methods.navBtnEvent($(this),true,event.data);
            });
            ele.find('.lov-btn-search').on('click',$lov,function (event) {
                methods.navBtnEvent($(this),false,event.data,true);
            });
        },
        initLov: function (ele,opt) {
            var $lov = ele.kendoWindow(opt).data('kendoWindow');
            $lov.center();
            methods.createForm(ele,$lov);
            methods.createHeader(ele,$lov);
            methods.createContentDiv(ele);
            return $lov;
        },
        openLov: function (ele,$lovDiv,$lov) {
            ele.on('click',$lov,function (event){
                if($lov.options.dataSource===undefined){
                    methods.createContent($lovDiv,$lov,{},true);
                    methods.createFooter($lovDiv,$lov);
                }
                event.data.open();
            });
        },
        closeLov: function (ele,$lov) {
            ele.on('dblclick',$lov,function (event) {
                var input = event.data.options.input;
                var lovName = event.data.options.lovName;
                var td = $(this).children('td');
                input.val(td.eq(0).text());
                lovName.text(td.eq(1).text());
                event.data.close();
            });
        },
        clearInput:function ($lov) {
            var clearBtn = $lov.options.clearBtn;
            var input = $lov.options.input;
            var lovName = $lov.options.lovName;
            lovName.parent().hover(function () {
                clearBtn.fadeIn(300);
            },function () {
                clearBtn.fadeOut(300);
            });
            clearBtn.bind({
                click:function(){
                    input.val('');
                    lovName.text('');
                },
                mouseover:function(){
                    $(this).children().rotate({
                        angle: 0,
                        animateTo:90,
                        duration: 1000
                    });
                },
                mouseout:function(){
                    $(this).children().rotate({
                        angle: 90,
                        animateTo:0,
                        duration: 1000
                    });
                }
            });
        },
        getInputData:function (ele) {
            var data = {};
            var input = ele.children('.lov-form').find('input');
            data[input.eq(0).attr('name')] = input.eq(0).val();
            data[input.eq(1).attr('name')] = input.eq(1).val();
            return data;
        },
        navBtnEvent : function (ele,isLi,$lov,isSearch) {
            var lovDiv = ele.closest('.lov-div');
            lovDiv.children('.lov-content').find('tr').remove();
            if(isLi){
                $lov.options.page = Number(ele.text());
            }else {
                var activeLi = lovDiv.find('.lov-footer-nav').find('.active');
                $lov.options.page = Number(activeLi.text());
            }
            if(isSearch){
                $lov.options.page = 1;
            }
            methods.createContent(lovDiv,$lov,methods.getInputData(lovDiv),false);
        },
        navSly : function (ele) {
            var $lovNav  = ele.find('.lov-sly');
            var $container  = $lovNav.parent();
            $lovNav.sly({
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
        },
        read:function (data,opt) {
            var result = {};
            data['page'] = opt.page;
            data['pageSize'] = opt.pageSize;
            data = $.extend({}, data, opt.param);
            $.ajax({
                url: opt.url,
                type:'post',
                dataType:opt.dataType,
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

    var Lov = function (ele,opt) {
        this.$element = ele;
        var $lovDiv = this.$element.closest('.lov-div');
        this.defaults = {
            width: '25%',
            height: '60%',
            modal: true,//最上面不能点其他地方
            draggable: false,//不能拖动
            resizable: false,
            title:'<strong>Lov</strong>',
            pinned: true,
            visible: false,
            scrollable: false,
            dataType:'json',
            page:1,
            pageSize:10,
            input:$lovDiv.children('input'),
            lovName:$lovDiv.find('.lov-name'),
            clearBtn:$lovDiv.find('.btn-clear-input')
        };
        this.options = opt;
        this.options = $.extend({}, this.defaults, opt);
    };

    Lov.prototype = {
        init : function () {
            var $lovDiv = methods.createLovDiv(this.$element);
            var $lov = methods.initLov($lovDiv,this.options);
            methods.openLov(this.$element,$lovDiv,$lov);
            methods.clearInput($lov);
            return $lov;
        }
    };

    $.fn.lov = function (options) {
        //创建DataGrid的实体
        var lov = new Lov(this, options);
        //调用其方法
        return lov.init();
    }
})(jQuery);
