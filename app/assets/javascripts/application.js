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
//= require jquery
//= require rails-ujs
//= require_tree .
//= require popper
//= require bootstrap-sprockets
//= require turbolinks

(function ($) {
    jQuery.fn.jtable_ou = function () {
        return this.each(function () {
            var $this = $(this);
            var config_url=$this.attr("data-jtable-config");
            $.getScript( config_url, function( data, textStatus, jqxhr ) {
                $this.jtable(jtable_config);
                $this.jtable('load');
            });
        });
    };
})(jQuery);

$(document).on("page:change", function() {
    $('[data-jtable-config]').jtable_ou();
    $('button[data-jtable-filter]').click(function (e) {
        e.preventDefault();
        var target=this.getAttribute("data-jtable-filter");
        $('#'+target).jtable('load', {
            filter: $('#filter').val()
        });
    });
});
