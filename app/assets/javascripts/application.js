// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require jquery.ketchup
//= require jquery.nested-fields
//= require jquery.maskedinput
//= require highcharts
//= require exporting
//= require jquery-tablesorter
//= require tinymce-jquery
//= require jquery.tokeninput
//= require_tree .


function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g");
    $(link).parent().after(content.replace(regexp, new_id));
}

//OVERRRIDE - CONFIRM DIALOG - INICIO
$.rails.confirm = function(message,element)
{
    html ="<div id=\"showConfirmDialog\" aria-hidden=\"true\" role=\"dialog\" aria-labelledby=\"showConfirmDialog\" class=\"modal\">" +
        "<div class=\"modal-dialog\">" +
        "<div class=\"modal-content\">" +
        "<div class=\"modal-header\">" +
        "<a class=\"close\" data-dismiss=\"modal\">&#215;</a>" +
        "<h4 class=\"modal-title\">Confirmação</h4></div><div class=\"modal-body\">" +
        "<p>"+message+"</p></div>" +
        "<div class=\"modal-footer\">" +
        "<a data-dismiss=\"modal\" class=\"btn\">Cancelar</a>" +
        "<a data-dismiss=\"modal\" class=\"btn btn-primary confirm\">Confirmar</a>" +
        "</div>" +
        "</div>" +
        "</div>" +
        "</div>"
    $(html).modal();
    $("#showConfirmDialog .confirm").click(function(){$.rails.confirmed(element)});

};

$.rails.confirmed = function(element){
    element.removeAttr('data-confirm');
    element.trigger('click.rails');
};

$.rails.allowAction = function(element){
    if( undefined === element.attr('data-confirm') ){
        return true;
    }

    $.rails.confirm(element.attr('data-confirm'),element);
    return false;
};

$.rails.handleLink = function(link)
{
    if (link.data('remote') !== undefined)
    {
        $.rails.handleRemote(link);
    }
    else if (link.data('method'))
    {
        $.rails.handleMethod(link);
    }

    return false;
};
//OVERRRIDE - CONFIRM DIALOG - FIM


