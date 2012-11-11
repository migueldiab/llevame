define([
    "jquery"
    ,"angular"
    ,"jquery.lazyload.min"
    ,"bootstrap/bootstrap-modal"
    ,'common/validate'
],
    function ($, angular) {

        $(document).ready(function (){
            startSlider();

            $('img.lazy').each(function() {
                this.hidden = true;
            });


            // $('#btnRegister').click(showRegisterForm);
            $('#btnFormularioRegistro').click(showRegisterForm);

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
            $('#formRegistrar').load('registrar', null, formLoaded);
            return false;
        }

        function formLoaded(response, status, xhr) {
            if ("success" == status) {
                $('#btnEnviarRegistro').click(verificarPassword);
                $('#inputEmail').focus();
            }
        }

        function verificarPassword() {
            var email = $('#inputEmail').val();
            var password = $('#inputPassword').val();
            var password2 = $('#inputPasswordRepeat').val();

            if (!Validator.getInstance().validateEmail(email)) {
                alert("Error: Invalid email!");
                return false;
            }
            if (password != "" && password == password2) {
                if(password.length < 6) {
                    alert("Error: Password must contain at least six characters!");
                    $('#inputPassword').focus();
                    return false;
                }
                if(password == email) {
                    alert("Error: Password must be different from Username!");
                    $('#inputPassword').focus();
                    return false;
                }
                re = /[0-9]/;
                if(!re.test(password)) {
                    alert("Error: password must contain at least one number (0-9)!");
                    $('#inputPassword').focus();
                    return false;
                }
                re = /[a-z]/;
                if(!re.test(password)) {
                    alert("Error: password must contain at least one lowercase letter (a-z)!");
                    $('#inputPassword').focus();
                    return false;
                }
                re = /[A-Z]/;
                if(!re.test(password)) {
                    alert("Error: password must contain at least one uppercase letter (A-Z)!");
                    $('#inputPassword').focus();
                    return false;
                }
            } else {
                alert("Error: Please check that you've entered and confirmed your password!");
                $('#inputPassword').focus();
                return false;
            }
            alert("You entered a valid password: " + password); return true;
        }



});