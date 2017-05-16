<#include "include/header.ftl"/>
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
                                <li><button class="nav-menu-btn-item">驾驶室<input type="hidden" name="page" value="cv/parts-cab"></button></li>
                                <li><button class="nav-menu-btn-item">变速箱&取力器<input type="hidden" name="page" value="cv/parts-gearbox"></button></li>
                                <li><button class="nav-menu-btn-item">发动机<input type="hidden" name="page" value="cv/parts-engine"></button></li>
                                <li><button class="nav-menu-btn-item">轮胎&钢圈<input type="hidden" name="page" value="cv/parts-tire"></button></li>
                                <li><button class="nav-menu-btn-item">油箱&气瓶<input type="hidden" name="page" value="cv/parts-bunkers"></button></li>
                                <li><button class="nav-menu-btn-item">驱动桥<input type="hidden" name="page" value="cv/parts-drive"></button></li>
                                <li><button class="nav-menu-btn-item">其他配件<input type="hidden" name="page" value="cv/parts-other"></button></li>
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
                    <ul class="nav-child">
                        <li>
                            <button class="nav-menu-btn">
                                <span class="nav-icon"><i class="fa fa-search-plus" aria-hidden="true"></i></span>
                                <span class="nav-name">多条件搜索</span>
                                <input type="hidden" name="page" value="search/condition-search">
                            </button>
                        </li>
                        <li>
                            <button class="nav-menu-btn">
                                <span class="nav-icon"><i class="fa fa-history" aria-hidden="true"></i></span>
                                <span class="nav-name">历史搜索</span>
                                <input type="hidden" name="page" value="search/history-search">
                            </button>
                        </li>
                    </ul>
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
                                <li><button class="nav-menu-btn-item">角色管理<input type="hidden" name="page" value="sys/account/role"></button></li>
                                <li><button class="nav-menu-btn-item">用户管理<input type="hidden" name="page" value="sys/account/user"></button></li>
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
                                <span class="nav-icon"><i class="fa fa-bars" aria-hidden="true"></i></span>
                                <span class="nav-name">分类管理</span>
                                <span class="nav-chevron-right"><i class="fa fa-chevron-right" aria-hidden="true"></i></span>
                            </button>
                            <ul class="nav-child-item">
                                <li><button class="nav-menu-btn-item">车辆分类<input type="hidden" name="page" value="sys/sort/cv"></button></li>
                                <li><button class="nav-menu-btn-item">配件分类<input type="hidden" name="page" value="sys/sort/parts"></button></li>
                            </ul>
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
                    if($.inArray(tab_title,tab_array)===-1){
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