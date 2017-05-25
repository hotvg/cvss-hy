<#assign base=request.contextPath />
<link rel="stylesheet" href="${base}/resources/css/kendoui.css">
<link rel="stylesheet" href="${base}/resources/css/home.css">
<body>
<div id="home-search-result"></div>
<div id="home-settlement-result"></div>
<div id="home-auto">
    <div id="auto-div">
        <input id="auto-div-input" title="" placeholder="输入内部型号..." />
        <button id="auto-search-btn" class="btn btn-default" type="button">搜索</button>
    </div>
</div>
<div id="home-content">
    <div class="panel panel-default home-panel">
        <div class="panel-heading">
            <h3 class="panel-title">
                热门搜索
            </h3>
        </div>
        <div class="panel-body">
            <ul>
            <#list searchHotList as hot>
                <li>
                    <button class="btn btn-default btn-hot-search" type="button">
                        <span class="search-content">${hot.internalModels}</span>
                        <span class="badge pull-right">${hot.num}</span>
                    </button>
                </li>
            </#list>
            </ul>
        </div>
    </div>

    <div class="panel panel-default home-panel">
        <div class="panel-heading">
            <h3 class="panel-title">
                <i class="fa fa-history" aria-hidden="true"></i>
                历史搜索
            </h3>
        </div>
        <div class="panel-body">
            <ul>
            <#list searchLatelyList as lately>
                <li>
                    <button class="btn btn-default btn-hot-search" type="button">
                        <span class="search-content">${lately.internalModels}</span>
                    </button>
                </li>
            </#list>
            </ul>
        </div>
    </div>
    <div class="panel panel-default home-panel">
        <div class="panel-heading">
            <h3 class="panel-title">
                <i class="fa fa-history" aria-hidden="true"></i>
                历史结算
            </h3>
        </div>
        <div class="panel-body">
            <ul>
            <#list settlementsList as settlement>
                <li>
                    <button class="btn btn-default btn-home-settlement" type="button">
                    ${settlement.internalModels}
                        <input type="hidden" value="${settlement.settlementId}">
                    </button>
                </li>
            </#list>
            </ul>
        </div>
    </div>
</div>
<script>
    var homeDataSource = new kendo.data.DataSource({
        transport: {
            read: {
                url: "/cv/all/read/internal-models",
                dataType: "json"
            }
        }
    });
    $("#auto-div-input").kendoAutoComplete({
        dataSource: homeDataSource,
        dataTextField: "internalModels"
    });

    $(function () {

        var $homeSearchResult = $('#home-search-result').kendoWindow({
            width: '81%',
            height: '79%',
            modal: true,//最上面不能点其他地方
            draggable: false,//不能拖动
            resizable: false,
            title: '<strong>搜索结果</strong>',
            pinned: true,
            visible: false,
            scrollable: false,
            content: {
                dataType: "json",
                iframe: true
            }
        }).data("kendoWindow");
        $homeSearchResult.center();

        var $homeSettlementResult = $('#home-settlement-result').kendoWindow({
            width: '81%',
            height: '79%',
            modal: true,//最上面不能点其他地方
            draggable: false,//不能拖动
            resizable: false,
            title:'<strong>结算详情</strong>',
            pinned: true,
            visible: false,
            scrollable: false,
            content: {
                dataType: "json",
                iframe: true
            }
        }).data("kendoWindow");
        $homeSettlementResult.center();

        $('#auto-search-btn').click(function () {
            var internalModels = $('#auto-div-input').val();
            if (internalModels !== '') {
                $homeSearchResult.refresh({
                    url: "/search/result?internalModels=" + internalModels
                });
                $homeSearchResult.open();
            }
        });

        $('.btn-hot-search').click(function () {
            var internalModels = $(this).children('.search-content').text();
            $homeSearchResult.refresh({
                url: "/search/result?internalModels=" + internalModels
            });
            $homeSearchResult.open();
        });

        $('.btn-home-settlement').click(function () {
            var settlementId =  $(this).children('input').val();
            $homeSettlementResult.refresh({
                url: "/settlement/read/info?settlementId="+settlementId
            });
            $homeSettlementResult.open();
        });

    });
</script>
</body>
