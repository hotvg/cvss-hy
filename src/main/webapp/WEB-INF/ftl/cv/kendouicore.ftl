<#include "include/header.ftl"/>
<link rel="stylesheet" href="${base}/resources/css/kendoui.css">
<link rel="stylesheet" href="${base}/resources/css/parts.css">
<link rel="stylesheet" href="${base}/resources/css/dataGrid.css">
<script src="${base}/resources/js/parts.js"></script>
<script src="${base}/resources/js/dataGrid.js"></script>
<body>
<input id="datetimepicker" />
<script>
    $("#datetimepicker").kendoDateTimePicker({
        format: "yyyy/MM/dd hh:mm tt",
        parseFormats: ["MMMM yyyy", "HH:mm"] //format also will be added to parseFormats
    });
</script>
</body>