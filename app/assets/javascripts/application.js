// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

// ターボリンクスのロードを待つ
document.addEventListener("turbolinks:load", function(){
    // メイカのそれぞれのデタに対してfunctionの処理を追加する
    console.log(document.car)
    document.car["car[maker]"].forEach(function(element){
        // それぞれのメイカに対してクリックされたときの挙動を定義する
        element.addEventListener('click', function(){
            // その他がクリックされたら
            if ( document.car["car[maker]"][4].checked ) {
                // その他テキストフィルドを表示する
                document.car["car[other_maker]"].style.display = 'inline-block'
            //　その他以外がクリックされたら
            } else {
                // その他テキストフィルドを非表示にする
                document.car["car[other_maker]"].style.display = 'none'
            }
        })
    })
});
document.addEventListener("turbolinks:load", function(){
    document.car["car[body_type]"].forEach(function(element){
        element.addEventListener('click', function(){
            if ( document.car["car[body_type]"][5].checked ) {
                document.car["car[other_body_type]"].style.display = 'inline-block'
            } else {
                document.car["car[other_body_type]"].style.display = 'none'
            }
        })
    })
});