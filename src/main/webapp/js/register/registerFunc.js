
var ajaxRequest;

document.getElementById("submit-button").addEventListener("click", sendRegistrationData);

function sendRegistrationData() {
    console.log("sendReg");
    document.getElementById("loader").style.display = "inline";

    var password = $('#passwordRegisterInput').val();
    var email =    $('#emailRegisterInput').val();
    var fullName = $('#fullNameRegisterInput').val();

    var input = $('.validate-input .input100');

    for(var i=0; i<input.length; i++) {
        if(validate(input[i]) == false){
            showValidate(input[i]);
            check=false;
        }
    }

    console.log(validate($('#passwordRegisterInput')));

    console.log(fullName);

    if (fullName != "" && password && validateEmail(email)) {

        var uri = "/registration";
        var json = {
            "password": password,
            "email": email,
            "fullName":fullName};

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

            document.getElementById("loader").style.display = "none";

            triggerPopup(response);

            console.log("done");
            console.log(response);
        });

        /* If the call fails  */
        ajaxRequest.fail(function (jqXHR, textStatus, errorThrown){
            console.log("fail");

            // Log the error
            console.error(
                "The following error occurred: "+
                textStatus, errorThrown
            );
        });

    } else {
        document.getElementById("loader").style.display = "none";
    }
}

function triggerPopup(response){
    var message = "";
    if (response.result) {
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
        document.getElementById("alert-success").style.display = '';

        var d1 = document.getElementById("user-form");
        var first = '<input type="text" id="userID" name="userID" value="';
        var last = '" style="display: none;">';
        d1.insertAdjacentHTML('beforeend', first + response.id + last);

        setTimeout(function(){ redirectLogin(); }, 2000);

    } else {
        message = "Bu mail daha önce kullanıldı. Kayıt olmak için lütfen farklı bir mail yazınız.";
        document.getElementById("popup-text").innerHTML = message;
        document.getElementById("popup-text").style.fontSize = "large";
        $('.cd-popup').addClass('is-visible');    }
}

function redirectLogin(){
     document.getElementById("send-profile-photo").click();
    // window.location.href = "../login.jsp";
}


function validateEmail(email)
{
    var re = /\S+@\S+\.\S+/;
    return re.test(email);
}

$("#login").click(function(){
// similar behavior as clicking on a link
    window.location.href = "../login.jsp";
});



document.getElementById("first-button").innerHTML = "Login";
document.getElementById("first-button").style.backgroundColor = "#3fbafe";
document.getElementById("buttons").style.margin = "0px";
document.getElementById("second-button").innerHTML = "Sign Up";
document.getElementById("second-button").style.backgroundColor = "#fc7169";
document.getElementById("first-button").addEventListener("click", redirectLogin);
document.getElementById("second-button").addEventListener("click", closePopup);
jQuery(document).ready(function($){
    //open popup
    $('.cd-popup-trigger').on('click', function(event){
        event.preventDefault();
        $('.cd-popup').addClass('is-visible');
    });


    //close popup when clicking the esc keyboard button
    $(document).keyup(function(event){
        if(event.which=='27'){
            $('.cd-popup').removeClass('is-visible');
        }
    });
});

function closePopup() {
    $('.cd-popup').removeClass('is-visible');
}


if (window.FileReader) {
    function handleFileSelect(evt) {
        var files = evt.target.files;
        var f = files[0];
        var reader = new FileReader();

        reader.onload = (function(theFile) {
            return function(e) {
            // <img src="/images/profilePhoto.jpg" id="profile-photo">

                document.getElementById("profile-photo").innerHTML = ['<img src="', e.target.result, '"/>'].join('');
                // document.getElementById('list').innerHTML = ['<img src="', e.target.result,'" title="', theFile.name, '" width="50"/>'].join('');
            };
        })(f);

        reader.readAsDataURL(f);
    }
} else {
    alert('This browser does not support FileReader');
}
document.getElementById('files').addEventListener('change', handleFileSelect, false);



(function ($) {
    "use strict";

    /*==================================================================
    [ Focus Contact2 ]*/
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
    [ Validate after type ]*/
    $('.validate-input .input100').each(function(){
        $(this).on('blur', function(){
            if(validate(this) == false){
                showValidate(this);
            }
            else {
                $(this).parent().addClass('true-validate');
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
            $(this).parent().removeClass('true-validate');
        });
    });



})(jQuery);


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
