<#include "include/header.ftl"/>
<link rel="stylesheet" href="${base}/resources/css/kendoui.css">
<link rel="stylesheet" href="${base}/resources/css/parts.css">
<link rel="stylesheet" href="${base}/resources/css/dataGrid.css">
<script src="${base}/resources/js/parts.js"></script>
<script src="${base}/resources/js/dataGrid.js"></script>
<body>
<div id="example">


        <input id="datetimepicker" style="width: 100%;" />


    <script>
        $(document).ready(function () {
            // create DateTimePicker from input HTML element
            $("#datetimepicker").kendoDateTimePicker({
                value:new Date()
            });
        });
    </script>

</div>
</body>