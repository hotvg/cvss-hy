/**
 * Created by yufeng.liu on 2017-03-27.
 */
/*
    login页面
 */
var error = '<div class="alert alert-danger" rel="alert">'+
    '<button type="button" class="close" data-dismiss="alert">'+
    '<span aria-disabled="true">&times;</span>'+
    '</button>'+
    '<strong>';

$(function () {
    $('.verify-code-btn').click(function () {
        var time = new Date();
        $('.verify-code-img').attr('src','/verifyCodeImg?time' + time);
    });

    $('#login-btn').click(function () {
        $(".alert-danger").remove();
        var username = $('#login-form input[name="userName"]').val();
        var password = $('#login-form input[name="password"]').val();
        var verifyCode = $('#verifyCode').val();
        if(username!=''){
            if(password!=''){
                if(verifyCode!=''){
                    $.ajax({
                        type:"GET",
                        url:"/verifyCode",
                        success: function(data){
                            if(verifyCode.toUpperCase() == data){
                                $.ajax({
                                    type:"POST",
                                    url:"user/login",
                                    data:{'userName':username,'password':password},
                                    success:function(data){
                                        console.log(data);
                                        if(data=="success"){
                                            window.location.href = "/";
                                        }else {
                                            errorInfo('用户名或密码错误！');
                                        }
                                    },error: function () {
                                        alert("发生未知错误，请稍后再试！");
                                    }
                                });
                            }else {
                                errorInfo('验证码错误！');
                            }
                        },error: function () {
                                alert("发生未知错误，请稍后再试！");
                        }
                    });
                }else {
                    errorInfo('请输入验证码！');
                }
            }else {
                errorInfo('请输入密码！');
            }
        }else {
            errorInfo('请输入用户名！');
        }
    });

});

function errorInfo(info) {
    $('#login-form').append(error + info +
        '</strong>'+
        '</div>');
}