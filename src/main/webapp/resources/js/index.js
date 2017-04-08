/**
 * Created by yufeng.liu on 2017-03-30.
 */
$(function () {
    //父级菜单的状态，true为打开
    var menu_status = false;
    //子级菜单的状态，true为打开
    var menu_item_status = false;
    //导航按钮状态，默认进入系统为打开
    var nav_btn_status = true;

    var nav_menu_btn = $('.nav-menu-btn');
    var nav_child_item = $('.nav-child-item');

    //箭头旋转
    var menu_fun = function (element,angle,toAngle) {
        $(element).children('.nav-chevron-right').rotate({
            angle: angle,
            animateTo:toAngle,
            duration: 1000
        });
    };
    //展开菜单
    var open_nav = function (e1,e2) {
        menu_fun(e1,0,90);
        e2.slideDown("normal");
        return true;
    };
    //收缩菜单
    var close_nav = function (e1,e2) {
        menu_fun(e1,90,0);
        e2.slideUp("normal");
        return false;
    };
    //改变菜单
    var change_nav = function (e1,e2,e3) {
        if(e1.is(':hidden')){
            close_nav(e2.parent().children('button'),e2);
            return open_nav(e3,e1);
        }else {
            return close_nav(e3,e1);
        }
    };
    nav_menu_btn.click(function(){
        if(!nav_btn_status&&!menu_status){
            $(".nav-btn").trigger("click");
        }

       //判断是否有子菜单，无菜单的不做处理
       if($(this).parent().children('ul').text()!=''){
           var is_parent = $(this).parent().parent();
           //如果是父级，则获得当前父级下面的二级菜单nav-child
           var nav_child = $(this).parent().children('ul');
           //判断是否是父级菜单
           if(is_parent.hasClass('nav-parent')){
               //除开当前二级菜单nav-child外的二级菜单nav-child
               var other_nav_child = $('.nav-child').not(nav_child);
               //判断当前是否有二级和三级菜单同时打开
               if(menu_status&&menu_item_status){
                   //关闭子菜单
                   menu_item_status = close_nav(nav_child_item.parent().children('button'),nav_child_item);
                   //关闭父菜单
                   menu_status = change_nav(nav_child,other_nav_child,this);
               //判断当前是否有二级打开和三级菜单未打开
               }else if(menu_status&&!menu_item_status){
                   menu_status = change_nav(nav_child,other_nav_child,this);
               }else if(!menu_status&&!menu_item_status){
                   menu_status = open_nav(this,nav_child);
               }
           }else{
               var other_nav_child_item = $('.nav-child-item').not(nav_child);
               if(menu_item_status){
                   menu_item_status = change_nav(nav_child,other_nav_child_item,this);
               }else{
                   menu_item_status = open_nav(this,nav_child);
               }
           }
       }
   });

    //菜单鼠标移入移出
    var btn_move_over = function (element) {
        element.hover(
            function () {
                $(this).addClass("move-btn");
                $(this).animate({
                    'padding-left': "10px"
                }, 200 );
            },
            function () {
                $(this).animate({
                    'padding-left': "6px"
                }, 200 );
                $(this).removeClass("move-btn");
            }
        );
    };
    //一级与二级
    btn_move_over(nav_menu_btn);
    //三级菜单
    btn_move_over($('.nav-menu-btn-item'));

   //隐藏菜单
   var hide_nav = function () {
       $('.nav-name').hide();
       $('.nav-chevron-right').hide();
   };

   //展开菜单
    var show_nav = function () {
        $('.nav-name').show();
        $('.nav-chevron-right').show();
    };

    //菜单的展开与隐藏动作
    var nav_hide_show = function (width,padding1,border,padding2,padding3,status) {
        $(".left").animate({
            'width': width
        }, 500);
        $(".right").animate({
            'margin-left': width
        }, 500);
        $(".nav-icon").animate({
            'padding-left': padding1
        }, 500 );
        $('.nav-menu-btn').css({'border':border});
        $('.nav-parent').animate({'padding-left':padding2,'padding-right':padding3}, 500);
        if(status){
            setTimeout(function () { hide_nav(); }, 250);
            return false;
        }else{
            setTimeout(function () { show_nav(); }, 250);
            return true;
        }
    };

   //全部按钮隐藏
    $('.nav-btn').click(function () {
        if(nav_btn_status){
            //判断菜单是否是打开状态，如果是打开状态再收缩菜单
            var nav_child = $('.nav-child');
            if(menu_status&&menu_item_status){
                //关闭子菜单
                menu_item_status = close_nav(nav_child_item.parent().children('button'),nav_child_item);
                //关闭父菜单
                menu_status = close_nav(nav_child.parent().children('button'),nav_child);
            }else if(menu_status&&!menu_item_status){
                //关闭父菜单
                menu_status = close_nav(nav_child.parent().children('button'),nav_child);
            }
            nav_btn_status = nav_hide_show('60px','8px','1px solid #f5f7f8','4px','5px',nav_btn_status);
        }else {
            nav_btn_status = nav_hide_show('260px','15px','none','0','0',nav_btn_status);
        }
    });

});


