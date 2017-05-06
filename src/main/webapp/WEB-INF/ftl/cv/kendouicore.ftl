<#include "include/header.ftl"/>
<link rel="stylesheet" href="${base}/resources/css/kendoui.css">
<link rel="stylesheet" href="${base}/resources/css/parts.css">
<link rel="stylesheet" href="${base}/resources/css/dataGrid.css">
<script src="${base}/resources/js/parts.js"></script>
<script src="${base}/resources/js/dataGrid.js"></script>
<script src="${base}/resources/js/lov.js"></script>
<body>


<br>
<br>
<br>
<br>
<br>
<div class="container">
    <div class="input-group con-lg-1">
        <input class="form-control" type="text" placeholder="">
        <span class="input-group-btn">
        <button class="btn btn-default testBtn" type="button">
            <i class="fa fa-search" aria-hidden="true"></i>
        </button>
    </span>
    </div>
</div>


<script>

    $(function () {

            $(".testBtn").lov();

    });

</script>
</body>