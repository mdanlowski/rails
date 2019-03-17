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
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

function autoPaste(obj){
    navigator.clipboard.readText().then(text => obj.value = text);
}

$( function(){
  // trim some whitespace
  $("input[type='submit']").on("mouseenter", function(){
    // console.log( ($("#redir_source").val()).replace(/(^\s+|\s+$)/g,'') );
    $("#redir_source").val( ($("#redir_source").val()).replace(/(^\s+|\s+$)/g,'') );
  });

});