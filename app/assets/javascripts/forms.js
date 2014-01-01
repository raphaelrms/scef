//Tooltiping
$.fn.tooltipar = function () {
$("form input").focus(function (){
    //Verifico se há o atributo title e o aviso de erro de form não esteja aqui (senao fica uma salada)
    debugger;
    if ((this.getAttribute("title")) && !($(this).next().attr("class") == "error"))
    {
        $( this ).after('<a href="#" title="'+this.getAttribute("title")+'" class="tooltipa"><span class="glyphicon glyphicon-exclamation-sign">&nbsp</span></a>');
    }
});
$("form input").focusout(function (){
    $( this ).next().remove();
});
}
