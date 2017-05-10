<#include "include/header.ftl"/>
<link rel="stylesheet" href="${base}/resources/css/kendoui.css">
<link rel="stylesheet" href="${base}/resources/css/parts.css">
<link rel="stylesheet" href="${base}/resources/css/dataGrid.css">
<link rel="stylesheet" href="${base}/resources/css/lov.css">
<script src="${base}/resources/js/parts.js"></script>
<script src="${base}/resources/js/dataGrid.js"></script>
<script src="${base}/resources/js/lov.js"></script>
<body>
<input id="datetimepicker" />
<script>
    $("#datetimepicker").kendoDateTimePicker();

    var datetimepicker = $("#datetimepicker").data("kendoDateTimePicker");

    // detach events
    datetimepicker.destroy();
</script>
</body>