/**
 * 测试
 * Created by yufeng.liu on 2017-05-19.
 */

$(function () {

    $('#submit-btn').click(function () {

        //订单的对象
        var order = {};
        //得到已经选中的复选框
        var checkBtn = $('#cartTable').find('.check-one:checked');
        //已选中的菜的数组，对应于java中的List或者集合
        var cartArray = [];
        for(var i =0 ;i <checkBtn.length;i++){
            //菜的对象
            var cart = {};
            //得到复选框父级tr
            var cartTr = checkBtn.eq(i).closest('tr');
            //得到这一行中的除开checkbox的input
            var trInput = cartTr.find('input').not('.check-one');
            //遍历input
            for(var j = 0;j<trInput.length;j++){
                var input = trInput.eq(j);
                //给菜的对象添加属性和值
                cart[input.attr('name')] = input.val();
            }
            cartArray.push(cart);

        }
        order['cartList'] = cartArray;
        //至于其他属性的你自己去添加 和order['cartList'] = cartArray一样

        //最后用ajax去添加
        $.ajax({
            url: "url地址",
            type:'post',
            dataType:'json',
            contentType: "application/json;charset=utf-8",
            data:order,
            //我的项目需要是取消了异步的
            async:false,
            success:function (data) {
                return data;
            },
            error:function () {
                alert('发生未知错误，请稍后再试');
            }
        });
    });

});
