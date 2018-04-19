
document.addEventListener("DOMContentLoaded", function() {
    connect();
});


$(function(){
    $(".heading-compose").click(function() {
        $(".side-two").css({
            "left": "0"
        });
    });

    $(".newMessage-back").click(function() {
        $(".side-two").css({
            "left": "-100%"
        });
    });
})


function addNewMessage(message){
    var d1 = document.getElementById('conversation');
    var beforeContent = '<div class="row message-body"><div class="col-sm-12 message-main-sender"><div class="sender"><div class="message-text">';
    var afterContent = '</div><span class="message-time pull-right">';
    d1.insertAdjacentHTML('beforeend', beforeContent + message.content + afterContent + message.from + '</span></div></div></div>');
    scrollDown();
}

function scrollDown(){
    var childs = document.getElementById("conversation");
    document.getElementById("conversation").scroll(0,findPos(childs.lastChild));
    console.log("scrolling");
}

function findPos(obj) {
    var curtop = 0;
    if (obj.offsetParent) {
        do {
            curtop += obj.offsetTop;
        } while (obj = obj.offsetParent);
        return [curtop];
    }
}

var ws;

function connect() {
    console.log("bağlandı.");
    var username = document.getElementById("username").value;

    var host = document.location.host;
    var pathname = document.location.pathname;

    ws = new WebSocket("ws://" +host  + pathname + "chat/" + username);

    ws.onmessage = function(event) {
        // var log = document.getElementById("log");
        console.log(event.data);
        var message = JSON.parse(event.data);
        addNewMessage(message);

        // log.innerHTML += message.from + " : " + message.content + "\n";
    };
}

function send() {
    var content = document.getElementById("comment").value;
    var json = JSON.stringify({
        "content":content
    });

    ws.send(json);

}

