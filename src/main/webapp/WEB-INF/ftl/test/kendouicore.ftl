<#include "include/header.ftl"/>
<link rel="stylesheet" href="${base}/resources/css/kendoui.css">
<link rel="stylesheet" href="${base}/resources/css/parts.css">
<link rel="stylesheet" href="${base}/resources/css/dataGrid.css">
<script src="${base}/resources/js/dataGrid.js"></script>
<body>


<br>
<br>
<br>
<br>
<br>
<div class="container">
    <div class="input-group lov-div">
        <input class="form-control" type="hidden" placeholder="" name="partsId">
        <div class="form-control lov-input" type="text">
            <span class="lov-name"></span>
            <button class="btn-clear-input" type="button">
                <i class="fa fa-times" aria-hidden="true"></i>
            </button>
        </div>
        <div class="input-group-btn">
            <button class="btn btn-default testBtn1" type="button">
                <i class="fa fa-search" aria-hidden="true"></i>
            </button>
        </div>
    </div>
</div>

<br>
<br>
<br>
<br>
<br>
<div class="container">
    <div class="input-group lov-div">
        <input class="form-control" type="hidden" placeholder="" name="partsId">
        <div class="form-control lov-input" type="text">
            <span class="lov-name"></span>
            <button class="btn-clear-input" type="button">
                <i class="fa fa-times" aria-hidden="true"></i>
            </button>
        </div>
        <div class="input-group-btn">
            <button class="btn btn-default testBtn2" type="button">
                <i class="fa fa-search" aria-hidden="true"></i>
            </button>
        </div>
    </div>
</div>


<script>

    var lovOptions = {
        columns:[
            {field:'partsId',name:'配件编号'},
            {field:'partsName',name:'配件名称'}
        ],
        url:'/parts/read'
    };
    var lovOptions2 = {
        columns:[
            {field:'partsId',name:'配件编号'},
            {field:'partsName',name:'配件名称'}
        ],
        url:'/parts/read'
    };
    var lov = $(".testBtn1").lov(lovOptions);
    $(".testBtn2").lov(lovOptions2);
    lov.destroy();
    console.log(lov)
</script>
</body>