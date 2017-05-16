/**
 * 搜索模块
 * Created by yufeng.liu on 2017-05-16.
 */

$(function () {

    $('.add-btn').click(function () {
        $(this).parent().children('button').not($(this)).removeClass('active');
        $(this).addClass('active');
        $(this).closest('.add-content-div').find('.lov-div').hide();
        $(this).closest('.add-content-div').find('.add-div-lov').css('display','inline-table');
    });

    $('.remove-btn').click(function () {
        $(this).parent().children('button').not($(this)).removeClass('active');
        $(this).addClass('active');
        $(this).closest('.add-content-div').find('.lov-div').hide();
        $(this).closest('.add-content-div').find('.remove-div-lov').css('display','inline-table');
    });

    $('.replace-btn').click(function () {
        $(this).parent().children('button').not($(this)).removeClass('active');
        $(this).addClass('active');
        $(this).closest('.add-content-div').find('.lov-div').hide();
        $(this).closest('.add-content-div').find('.replace-div-lov').css('display','inline-table');
    });

});