<!DOCTYPE html>
<html>
<head>
    <title>商用车结算系统</title>
    <meta charset="utf-8">
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="lib/fontawesome/css/font-awesome.min.css">
    <link href="lib/kendoui/styles/kendo.common.min.css" rel="stylesheet">
    <link href="lib/kendoui/styles/kendo.rtl.min.css" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/index.css">
    <link href="lib/kendoui/styles/kendo.default.min.css" rel="stylesheet">
    <script type="text/javascript" src="resources/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="lib/bootstrap/js/bootstrap.min.js"></script>
    <!--<script src="lib/kendoui/js/jquery.min.js"></script>-->
    <script src="lib/kendoui/js/kendo.ui.core.min.js"></script>
    <script src="resources/js/jQueryRotate.js"></script>
    <script type="text/javascript" src="resources/js/index.js"></script>
</head>
<body>
<div class="index-div">
    <div class="header">
        <div class="logo"></div>
        <div class="sys-name">商用车结算系统</div>
        <div class="user-name">
            <span>${username}</span>
            <span>|</span>
            <button class="btn btn-default"><i class="fa fa-sign-out" aria-hidden="true"></i></button>
        </div>
    </div>
    <div class="left">
        <div class="nav-top text-center">
            <button class="nav-btn"><i class="fa fa-bars" aria-hidden="true"></i></button>
        </div>
        <div class="nav-menu">
            <ul class="nav-parent">
                <li>
                    <button class="nav-menu-btn">
                        <span class="nav-icon"><i class="fa fa-truck" aria-hidden="true"></i></span>
                        <span class="nav-name">车辆管理</span>
                        <span class="nav-chevron-right"><i class="fa fa-chevron-right" aria-hidden="true"></i></span>
                    </button>
                    <ul class="nav-child">
                        <li>
                            <button class="nav-menu-btn">
                                <span class="nav-icon"><i class="fa fa-truck" aria-hidden="true"></i></span>
                                <span class="nav-name">全部车辆</span>
                                <input type="hidden" name="page" value="cv/all">
                            </button>
                        </li>
                        <li>
                            <button class="nav-menu-btn">
                                <span class="nav-icon"><i class="fa fa-cubes" aria-hidden="true"></i></span>
                                <span class="nav-name">车辆配件</span>
                                <span class="nav-chevron-right"><i class="fa fa-chevron-right" aria-hidden="true"></i></span>
                            </button>
                            <ul class="nav-child-item">
                                <li><button class="nav-menu-btn-item">驾驶室<input type="hidden" name="page" value="cv/parts_cab"></button></li>
                                <li><button class="nav-menu-btn-item">变速箱&取力器</button></li>
                                <li><button class="nav-menu-btn-item">发动机</button></li>
                                <li><button class="nav-menu-btn-item">轮胎&钢圈</button></li>
                                <li><button class="nav-menu-btn-item">油箱&气瓶</button></li>
                                <li><button class="nav-menu-btn-item">驱动桥</button></li>
                                <li><button class="nav-menu-btn-item">其他配件</button></li>
                            </ul>
                        </li>
                    </ul>
                </li>

                <li>
                    <button class="nav-menu-btn">
                        <span class="nav-icon"><i class="fa fa-search" aria-hidden="true"></i></span>
                        <span class="nav-name">搜索管理</span>
                        <span class="nav-chevron-right"><i class="fa fa-chevron-right" aria-hidden="true"></i></span>
                    </button>
                </li>

                <li>
                    <button class="nav-menu-btn">
                        <span class="nav-icon"><i class="fa fa-calculator" aria-hidden="true"></i></span>
                        <span class="nav-name">结算管理</span>
                        <span class="nav-chevron-right"><i class="fa fa-chevron-right" aria-hidden="true"></i></span>
                    </button>
                </li>

                <li>
                    <button class="nav-menu-btn">
                        <span class="nav-icon"><i class="fa fa-database" aria-hidden="true"></i></span>
                        <span class="nav-name">数据统计</span>
                        <span class="nav-chevron-right"><i class="fa fa-chevron-right" aria-hidden="true"></i></span>
                    </button>
                </li>

                <li>
                    <button class="nav-menu-btn">
                        <span class="nav-icon"><i class="fa fa-cogs" aria-hidden="true"></i></span>
                        <span class="nav-name">系统管理</span>
                        <span class="nav-chevron-right"><i class="fa fa-chevron-right" aria-hidden="true"></i></span>
                    </button>
                    <ul class="nav-child">
                        <li>
                            <button class="nav-menu-btn">
                                <span class="nav-icon"><i class="fa fa-users" aria-hidden="true"></i></span>
                                <span class="nav-name">账户管理</span>
                                <span class="nav-chevron-right"><i class="fa fa-chevron-right" aria-hidden="true"></i></span>
                            </button>
                            <ul class="nav-child-item">
                                <li><button class="nav-menu-btn-item">角色管理</button></li>
                                <li><button class="nav-menu-btn-item">用户管理</button></li>
                            </ul>
                        </li>
                        <li>
                            <button class="nav-menu-btn">
                                <span class="nav-icon"><i class="fa fa-wrench" aria-hidden="true"></i></span>
                                <span class="nav-name">功能分配</span>
                            </button>
                        </li>
                        <li>
                            <button class="nav-menu-btn">
                                <span class="nav-icon"><i class="fa fa-cog" aria-hidden="true"></i></span>
                                <span class="nav-name">系统设置</span>
                                <span class="nav-chevron-right"><i class="fa fa-chevron-right" aria-hidden="true"></i></span>
                            </button>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <div class="right">
        <div id="tab-strip"></div>

        <script>
            var tab_array = [];

            var tabStrip = $("#tab-strip").kendoTabStrip({
                //不可折叠
                collapsible: false,
                //关闭动画
                animation:false,
                //标签
                dataTextField: "Name",
                //内容
                dataContentUrlField: "ContentUrl",
                tabPosition:'top',
                //可以滚动
                scrollable: {
                    distance: 300
                },
                //数据源
                dataSource: [
                    { Name: "首页", ContentUrl: "/home" }
                ]
            }).data("kendoTabStrip");

            //默认选择的标签
            tabStrip.select(0);

            var bind_close_btn  = function () {
                $(".close-tab-btn").bind({
                    click:function(){
                        //移除数组中的标签记录.原理，找到该元素是否存在，存在的下标是多少
                        tab_array.splice($.inArray($(this).parent().text(),tab_array),1);
                        //关闭当前的标签页
                        tabStrip.remove($(this).parent().parent());
                        //选择最后一个标签页
                        tabStrip.select('li:last');
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
            };

            $('.nav-menu-btn,.nav-menu-btn-item').click(function () {
                var btn_input = $(this).children('input');
                if(btn_input.length>0){
                    var tab_page_url = btn_input.val();
                    //利用trim消除空格等
                    var tab_title = $(this).text().trim();
                    //判断标签页是否已经打开，如果打开则不再重新打开。原理，数组tab_array中不存在标签标题
                    if($.inArray(tab_title,tab_array)==-1){
                        tabStrip.append(
                                {
                                    text: tab_title+ '<button class="close-tab-btn"><i class="fa fa-times" aria-hidden="true"></i></button>'+'&nbsp;&nbsp;',
                                    encoded: false,//可以使用html元素
                                    contentUrl:tab_page_url
                                }
                        );
                        //默认打开新的标签页面，选择最后一个
                        tabStrip.select('li:last');
                        bind_close_btn();
                        tab_array.push(tab_title);
                    }
                }
            });
        </script>

    </div>
</div>
</body>
</html>