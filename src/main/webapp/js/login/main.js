
(function ($) {
    "use strict";

    /*==================================================================
    [ Focus input ]*/
    $('.input100').each(function(){
        $(this).on('blur', function(){
            if($(this).val().trim() != "") {
                $(this).addClass('has-val');
            }
            else {
                $(this).removeClass('has-val');
            }
        })    
    })
  
  
    /*==================================================================
    [ Validate ]*/
    var input = $('.validate-input .input100');

    $('.validate-form').on('submit',function(){
        var check = true;

        for(var i=0; i<input.length; i++) {
            if(validate(input[i]) == false){
                showValidate(input[i]);
                check=false;
            }
        }

        return check;
    });


    $('.validate-form .input100').each(function(){
        $(this).focus(function(){
           hideValidate(this);
        });
    });

    function validate (input) {
        if($(input).attr('type') == 'email' || $(input).attr('name') == 'email') {
            if($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
                return false;
            }
        }
        else {
            if($(input).val().trim() == ''){
                return false;
            }
        }
    }

    function showValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).addClass('alert-validate');
    }

    function hideValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).removeClass('alert-validate');
    }
    
    /*==================================================================
    [ Show pass ]*/
    var showPass = 0;
    $('.btn-show-pass').on('click', function(){
        if(showPass == 0) {
            $(this).next('input').attr('type','text');
            $(this).find('i').removeClass('zmdi-eye');
            $(this).find('i').addClass('zmdi-eye-off');
            showPass = 1;
        }
        else {
            $(this).next('input').attr('type','password');
            $(this).find('i').addClass('zmdi-eye');
            $(this).find('i').removeClass('zmdi-eye-off');
            showPass = 0;
        }
        
    });


})(jQuery);



var ajaxRequest;
var didSent = false;
function changeProfilePhoto(response) {
    if (response.result){
        document.getElementById("welcome-title").innerHTML = "Welcome, " + response.fullName;
       if (!(response.path == "null" || response.path == "")){
           document.getElementById("profile-photo").innerHTML = ['<img src="', response.path, '"/>'].join('');
       }
    }
}

function getProfilePhoto() {
    console.log("pass basıldı.");
    sendAjaxRequest();
}

function sendAjaxRequest() {

    var email = $('#email').val();

    if (email && !didSent) {
        didSent = true;
        var uri = "/getProfilePhoto";
        var json = {
            "email": email
            };

        console.log("gönderiliyor");
        console.log(json);
        ajaxRequest = $.ajax({
            url: uri,
            type: "POST",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: JSON.stringify(json)
        });

        /* Alert the user when finished without error */
        ajaxRequest.done(function (response, textStatus, jqXHR){
            console.log(response);
            console.log("done");
            changeProfilePhoto(response);
        });

        /* If the call fails  */
        ajaxRequest.fail(function (jqXHR, textStatus, errorThrown){
            console.log("fail");
        didSent = false;
            // Log the error
            console.error(
                "The following error occurred: "+
                textStatus, errorThrown
            );
        });
    } else {
        console.log("ERROR: email is: " + email);
    }
}