$(document).ready(function (){
  startSlider();
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
    $('img.lazy').lazyload({
      effect: "fadeIn"
    }); 
  }); 
}


