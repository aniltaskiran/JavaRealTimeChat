
var ajaxRequest;

$('form').on('submit', function(form) {
    form.preventDefault();
    document.getElementById("loader").style.display = "inline";

    var password = $('#passwordRegisterInput').val();
    var email =    $('#emailRegisterInput').val();
    var fullName = $('#fullNameRegisterInput').val();

    console.log(fullName);

    if (fullName != "" && password != "" && validateEmail(email)) {

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

            triggerPopup(response.result);

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



});

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

var timeOut;
function triggerPopup(response){
    var message = "";
    if (response) {
        document.getElementById("alert-success").style.display = '';

        timeOut = setTimeout(redirectLogin, 2000);
    } else {
        message = "Bu mail daha önce kullanıldı. Kayıt olmak için lütfen farklı bir mail yazınız.";
        document.getElementById("popup-text").innerHTML = message;
        document.getElementById("popup-text").style.fontSize = "large";
        $('.cd-popup').addClass('is-visible');    }

}

function redirectLogin(){
    window.location.href = "../login.jsp";
}



// //close popup
// $('.cd-popup').on('click', function(event){
//     if( $(event.target).is('.cd-popup-close') || $(event.target).is('.cd-popup') ) {
//         event.preventDefault();
//         $(this).removeClass('is-visible');
//     }
// });


