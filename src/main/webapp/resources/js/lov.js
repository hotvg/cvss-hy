/**
 * lov 值列表 List of Values
 * Created by yufeng.liu on 2017-05-04.
 */
(function ($) {

    var htmlElement = {
        lovFooter:
        '<div class="btn-group grid-nav-container">' +
        '<div class="btn-group btn-grid-left">' +
        '<button type="button" class="btn btn-grid-nav prevPage">' +
        '<i class="fa fa-angle-double-left" aria-hidden="true"></i>' +
        '</button>' +
        '<button type="button" class="btn btn-grid-nav btn-grid-angle prev">' +
        '<i class="fa fa-angle-left" aria-hidden="true"></i>' +
        '</button>' +
        '</div>' +
        '<div class="btn-group">' +
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
        '</div>'
    };

    var methods = {
        createLovDiv: function (ele) {
            ele.parent().append('<div class="lov-div"></div>');
            return ele.parent().children('.lov-div');
        },
        initLov: function (ele,opt) {
            var $lov = ele.kendoWindow(opt).data('kendoWindow');
            $lov.center();
            $lov.content(htmlElement.lovFooter);
            return $lov;
        },
        clickOpen: function (ele,lov) {
            ele.on('click',function (){
                lov.open();
            });
        }
    };

    var Lov = function (ele,opt) {
        this.$element = ele;
        this.defaults = {
            width: '25%',
            height: '60%',
            modal: true,//最上面不能点其他地方
            draggable: false,//不能拖动
            resizable: false,
            title:'<strong>Lov</strong>',
            pinned: true,
            visible: false
        };
        this.options = opt;
        this.options = $.extend({}, this.defaults, opt);
    };

    Lov.prototype = {
        init : function () {
            var $lovDiv = methods.createLovDiv(this.$element);
            var $lov = methods.initLov($lovDiv,this.options);
            methods.clickOpen(this.$element,$lov);
        }
    };

    $.fn.lov = function (options) {
        //创建DataGrid的实体
        var lov = new Lov(this, options);
        //调用其方法
        lov.init();
    }
})(jQuery);
