//Ficar "wrappado" dentro de function - Jquery dá escopo privado ao plugin, evitando conflitos com outros plugins.
(function($){
    $.tableFilter = {




    }



    $.fn.tableFilter = function(){
        return this.each(function(){
        });
    }



})(jQuery);


