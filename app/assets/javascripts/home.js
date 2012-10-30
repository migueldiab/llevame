
$(document).ready(function (){
    startSlider();

    $('img.lazy').each(function() {
        this.hidden = true;
    });


    // $('#btnRegister').click(showRegisterForm);
    $('#btnRegistrar').click(showRegisterForm);

});


function startSlider() {
    $('#button a').click(function(){
        var integer = $(this).attr('rel');
        $('#myslide .cover').animate({left:-320*(parseInt(integer)-1)})  /*----- Width of div mystuff (here 160) ------ */
        $('#button a').each(function() {
            $(this).removeClass('active');
            if($(this).hasClass('button'+integer)){
                $(this).addClass('active')
            }
        });

        if ($('img.lazy')[0].hidden) {
            $('img.lazy').each(function() {
                this.hidden = false;
            });
            $('img.lazy').lazyload({
                effect : "fadeIn"
            });
        }
    });
}

function showRegisterForm() {
    $('#formRegistrar').modal('show');
    $('#formRegistrar').load('registrar');
    return false;
}



