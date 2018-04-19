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
function redirectLogin(){

}



// //close popup
// $('.cd-popup').on('click', function(event){
//     if( $(event.target).is('.cd-popup-close') || $(event.target).is('.cd-popup') ) {
//         event.preventDefault();
//         $(this).removeClass('is-visible');
//     }
// });
