
<style>
    #look-search-table td{
        text-align: center;
    }
    #look-search-table .look-btn-cv{
        padding-top: 2px;
        padding-bottom: 2px;
    }
</style>
<body>
<div id="look-search-result"></div>
<div id="look-search-table">
    <table class="table table-bordered table-condensed table-hover">
        <thead>
        <tr>
            <th>车辆序号</th>
            <th>内部型号</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <#list cvPojoList as cvPojo>
        <tr>
            <td>${cvPojo.cvId}</td>
            <td>${cvPojo.internalModels}</td>
            <td><button class="btn btn-default look-btn-cv" type="button">查看<input type="hidden" value="${cvPojo.internalModels}"></button></td>
        </tr>
        </#list>
        </tbody>
    </table>
</div>

<script>
    $(function () {
        var $lookSearchResult =  $('#look-search-result').kendoWindow({
            width: '81%',
            height: '79%',
            modal: true,//最上面不能点其他地方
            draggable: false,//不能拖动
            resizable: false,
            title:'<strong>搜索结果</strong>',
            pinned: true,
            visible: false,
            scrollable: false,
            content: {
                dataType: "json",
                iframe: true
            }
        }).data("kendoWindow");
        $lookSearchResult.center();

        $('.look-btn-cv').click(function () {
            var internalModels = $(this).find('input').val();
            if(internalModels!==''){
                $lookSearchResult.refresh({
                    url: "/search/result?internalModels="+internalModels
                });
                $lookSearchResult.open();
            }
        });
    });

</script>
</body>
