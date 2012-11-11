var Validator = (function() {
    var instance;

        function Validator() {
        console.log("Constructing Validator");
    };

    Validator.prototype.validateEmail = function(email) {

        if (email == "") {
            alert("Error: Email cannot be blank!");
            $('#inputEmail').focus();
            return false;
        }
        re = /^[_A-Za-z0-9-\+]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})$/;
        if (!re.test(email)) {
            alert("Error: Invalid email!");
            $('#inputEmail').focus();
            return false;
        }
    };

    var _static = {
        name: 'Validator',
        getInstance: function() {
            if (instance === undefined) {
                instance = new Validator();
            }
            return instance;
        }
    };

    return _static;
})();