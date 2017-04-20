/**
 * Created by yufeng.liu on 2017-04-07.
 */

$(function() {

    $('#laquo-btn').parent().addClass('disabled');
    $('.page-up-down').children().eq(0).addClass('disabled');


    $(".disabled").click(function (event) {
        event.preventDefault();
    });

    $('#raquo-btn').click(
        function() {
            $('#page-num').val('');
            var page_ul = $(this).parent().parent();
            var page_min = page_ul.children().eq(1).text();
            if(Number(page_min)>=1){
                $('#laquo-btn').parent().removeClass('disabled');
                $('.page-up-down').children().eq(0).removeClass('disabled');
            }
            if((Number($('#last-page').children().text()) - 5)==Number(page_min)){
                $('#raquo-btn').parent().addClass('disabled');
                $('.page-up-down').children().eq(1).addClass('disabled');
            }
            var active_page_index = page_ul.children('.active').index();
            page = $('#page').val();
            page_ul.children().removeClass('active');
            for (var i = 1; i <= 5; i++) {
                page_ul.children().eq(i).children().text(
                    i + Number(page_min));
            }
            if (active_page_index != 1 && active_page_index != 6) {
                if (page_min <= active_page_index + Number(page_min)) {
                    page_ul.children().eq(active_page_index - 1).addClass(
                        'active');
                }
            }
            var page = $('#page').val();
            if (page == page_ul.children().eq(5).text()) {
                page_ul.children().eq(5).addClass('active');
            }
        });

    $('#laquo-btn').click(
        function() {
            $('#page-num').val('');
            var page_ul = $(this).parent().parent();
            var page_max = page_ul.children().eq(5).text();
            var page = $('#page').val();
            if(Number(page_max)==6){
                $('#laquo-btn').parent().addClass('disabled');
                $('.page-up-down').children().eq(0).addClass('disabled');
            }
            if(Number($('#last-page').children().text()) <=Number(page_max)){
                $('#raquo-btn').parent().removeClass('disabled');
                $('.page-up-down').children().eq(1).removeClass('disabled');
            }
            if ((Number(page_max) - 4) == Number(page)) {
                page_ul.children().eq(Number(page_max) - 4).addClass(
                    'active');
            }
            var active_page_index = page_ul.children('.active').index();
            page_ul.children().removeClass('active');
            for (var i = 1; i <= 5; i++) {
                page_ul.children().eq(6 - i).children().text(
                    Number(page_max) - i);
            }
            ;
            if (active_page_index != 0 && active_page_index != 5) {
                if (page_max >= page_max - active_page_index) {
                    page_ul.children().eq(active_page_index + 1).addClass(
                        'active');
                }
            }
            var page = $('#page').val();
            if (page == page_ul.children().eq(1).text()) {
                page_ul.children().eq(1).addClass('active');
            }
        });

    $('.page-btn').click(function(e) {
        if(Number($('.page-nav').children().eq(1).text())==1){
            $('#laquo-btn').parent().addClass('disabled');
            $('.page-up-down').children().eq(0).addClass('disabled');
        }
        $('#page-num').val('');
        $(this).parent().children().removeClass('active');
        $(this).addClass('active');
        $('#film-tbody').children().remove();
        var page = $(this).text();
        var rows = $('#page-rows').val();
        initFilm(page, rows);
    });

    $('#page-btn-go').click(
        function() {
            var page = $('#page-num').val();
            var last_page = $('#last-page').children().text();
            if(Number(page)>Number(last_page)){
                alert("输入的页数不能大于总页数！");
            }else{
                if((Number(last_page)-Number(page))>=4){
                    $(".page-nav").children().removeClass('active');
                    if(Number(page)==1){
                        $('#laquo-btn').parent().addClass('disabled');
                        $('.page-up-down').children().eq(0).addClass('disabled');
                    }else{
                        $('#laquo-btn').parent().removeClass('disabled');
                        $('.page-up-down').children().eq(0).removeClass('disabled');
                    }
                    $('#raquo-btn').parent().removeClass('disabled');
                    $('.page-up-down').children().eq(1).removeClass('disabled');
                    var rows = $('#page-rows').val();
                    if (page != '') {
                        $('#film-tbody').children().remove();
                        for (var i = 1; i <= 5; i++) {
                            $(".page-nav").children().eq(i).children().text(
                                Number(page) + i - 1);
                        }
                        $(".page-nav").children().eq(1).addClass('active');
                        initFilm(page, rows);
                    }
                }else if((Number(last_page)-Number(page))<4 && (Number(last_page)-Number(page))>=0){
                    $(".page-nav").children().removeClass('active');

                    if(Number(page)==Number(last_page)){
                        $('#raquo-btn').parent().addClass('disabled');
                        $('.page-up-down').children().eq(1).addClass('disabled');
                    }else{
                        $('#raquo-btn').parent().removeClass('disabled');
                        $('.page-up-down').children().eq(1).removeClass('disabled');
                    }

                    $('#laquo-btn').parent().removeClass('disabled');
                    $('.page-up-down').children().eq(0).removeClass('disabled');

                    var rows = $('#page-rows').val();
                    if (page != '') {
                        $('#film-tbody').children().remove();
                        for (var i = 1; i <= 5; i++) {
                            $(".page-nav").children().eq(6-i).children().text(
                                Number(page)-i+1);
                        }
                        $(".page-nav").children().eq(5).addClass('active');
                        initFilm(page, rows);
                    }
                }
            }
        });

    $('#page-up').click(function() {
        $('#page-num').val('');
        $('#laquo-btn').trigger('click');
        $('#film-tbody').children().remove();
        var rows = $('#page-rows').val();
        var page_index = $(".page-nav").children('.active').index();
        $(".page-nav").children().removeClass('active');
        if(Number(page_index)==-1){
            $(".page-nav").children().eq(page_index+6).addClass('active');
        }else{
            $(".page-nav").children().eq(page_index-1).addClass('active');
        }
        var page = $(".page-nav").children('.active').text();
        initFilm(page, rows);
    });

    $('#page-down').click(function() {
        $('#page-num').val('');
        $('#raquo-btn').trigger('click');
        $('#film-tbody').children().remove();
        var rows = $('#page-rows').val();
        var page_index = $(".page-nav").children('.active').index();
        $(".page-nav").children().removeClass('active');
        if(Number(page_index)==-1){
            $(".page-nav").children().eq(page_index + 2).addClass('active');
        }else{
            $(".page-nav").children().eq(page_index + 1).addClass('active');
        }
        var page = $(".page-nav").children('.active').text();
        initFilm(page, rows);
    });

});