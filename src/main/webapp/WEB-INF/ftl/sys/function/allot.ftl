<#assign base=request.contextPath />
<link rel="stylesheet" href="${base}/resources/css/sys.css">
<body>
<div id="allot">
    <div class="menu-container">
        <ul class="menu-parent-ul">
            <li>
                <div class="menu-parent-title"><button class="hide-btn"></button><input class="menu-parent-checkbox" type="checkbox">测试父</div>
                <ul class="menu-child-ul">
                    <li class="menu-not-child"><input class="menu-child-checkbox" type="checkbox">测试子</li>
                    <li>
                        <div class="menu-child-title"><button class="hide-btn"></button><input class="menu-child-checkbox" type="checkbox">子项</div>
                        <ul class="menu-child-item">
                            <li><input type="checkbox">子项1</li>
                            <li><input type="checkbox">子项2</li>
                            <li><input type="checkbox">子项3</li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li>
                <div class="menu-parent-title"><button class="hide-btn"></button><input class="menu-parent-checkbox" type="checkbox">测试父</div>
                <ul class="menu-child-ul">
                    <li class="menu-not-child"><input class="menu-parent-checkbox" type="checkbox">测试子</li>
                    <li>
                        <div class="menu-child-title"><button class="hide-btn"></button><input class="menu-child-checkbox" type="checkbox">子项</div>
                        <ul class="menu-child-item">
                            <li><input type="checkbox">子项1</li>
                            <li><input type="checkbox">子项2</li>
                            <li><input type="checkbox">子项3</li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<script>
    $(function () {



       $('.hide-btn').click(function () {
           $(this).closest('li').children('ul').slideToggle(500);
       });

       $('.menu-parent-checkbox').change(function () {
           if($(this).is(":checked")){
               $(this).closest('li').find('input:checkbox').prop("checked",true);
           }else {
               $(this).closest('li').find('input:checkbox').prop("checked",false);
           }
       });

       $('.menu-child-checkbox').change(function () {
           if($(this).is(":checked")){
               $(this).closest('li').find('input:checkbox').prop("checked",true);
           }else {
               $(this).closest('li').find('input:checkbox').prop("checked",false);
           }
       });
    });
</script>
</body>