

var mapUserID = {};


document.addEventListener("DOMContentLoaded", function() {
    Push.Permission.request();

    mapUserID = getProfilePhoto();
    var isMobile = false;
    if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
        // some code..
        console.log("mobil");
        isMobile = true;
    }
    changeMobile(isMobile);

    connect();
    $(document).keypress(function(e) {
        if(e.which == 13) {
            // enter pressed
            send();
        }
    });
    document.querySelector('#comment').addEventListener('keypress', function (e) {
        var value = document.getElementById("comment").value;
        if (value == " " || value == "\n"){
            document.getElementById("comment").value = "";
        }
    });
});

function changeMobile(isMobile){

    var NAME = document.getElementById("rightMenu");
    var rightButton = document.getElementById("rightMenuButton");
    var currentClass = NAME.className;
    console.log(currentClass);
    if (isMobile) {
        rightButton.innerHTML = '<i class="fa fa-sign-out fa-2x  pull-right" aria-hidden="true" onclick="signOut()"></i>';
        NAME.className = "col-sm-12 col-xs-12 conversation";   // Set other class name
    } else {
        rightButton.innerHTML = '<i class="fa fa-trash-o fa-2x  pull-right" aria-hidden="true" onclick="clearHistory()"></i>';
        NAME.className = "col-sm-8 col-xs-12 conversation";   // Set other class name
    }
}

function createPush(title, image) {
    Push.create(title, {
        body: "",
        icon: image,
        timeout: 8000,               // Timeout before notification closes automatically.
        vibrate: [100, 100, 100],    // An array of vibration pulses for mobile devices.
        onClick: function() {
            // Callback for when the notification is clicked.
            console.log(this);
        }
    });
}

function getProfilePhoto() {
    var pairKey = document.getElementById("pairKey");
    var img = null;
    if (pairKey != null){
        img = pairKey.childNodes;
    }

    if (img != null){
        var i;
        var map = {};
        for (i = 0; i < img.length; i++) {
            if (img[i].tagName == "IMG"){
                map[img[i].id] = img[i].src;
            }
        }
        console.log(map);
        return map;
    } else {
        return {};
    }
}


//
// $(function(){
//     $(".heading-compose").click(function() {
//         $(".side-two").css({
//             "left": "0"
//         });
//     });
//
//     $(".newMessage-back").click(function() {
//         $(".side-two").css({
//             "left": "-100%"
//         });
//     });
// })


function addNewMessage(message){
    var d1 = document.getElementById('conversation');
    var userID  = document.getElementById("userID").innerHTML;
    var classText = "";
    if (message.senderID != userID){

        createPush(message.from + ": " + message.content, mapUserID[message.senderID]);
        classText = "receiver";
    } else {
        classText = "sender";
    }
    var beforeContent = '<div class="row message-body"><div class="col-sm-12 message-main-' + classText +'"><div class="' + classText + '"><div class="message-text">';
    var afterContent = '</div><span class="message-time pull-right">';
    d1.insertAdjacentHTML('beforeend', beforeContent + message.content + afterContent + message.from + '</span></div></div></div>');
    scrollDown();
}

function addNewUser(message){
    var userID  = document.getElementById("userID").innerHTML;

    if (message.senderID == userID){
        console.log("aynı username");
    } else {

        console.log("farklı username. senderID: " + message.senderID);
        console.log("userID: " + userID);
        var d1 = document.getElementById('sideBar');
        var beforePhoto = '<div class="row sideBar-body" id="'+message.senderID +'"><div class="col-sm-3 col-xs-3 sideBar-avatar"><div class="avatar-icon"><img src="';
        var imageURL = "";
        if (message.path === "null" || message.path === ""){
            imageURL = "/images/default-avatar.svg";
            console.log("null geldi.");
        } else {
            console.log("null gelmedi. " + message.path);
            imageURL = message.path;
        }
        mapUserID[message.senderID] = imageURL;
        // add a item
        createPush(message.from + " is online ", imageURL);

        var afterPhoto = '"></div></div><div class="col-sm-9 col-xs-9 sideBar-main"><div class="row"><div class="col-sm-8 col-xs-8 sideBar-name"><span class="name-meta">';
        var afterUserName = '</span></div><div class="col-sm-4 col-xs-4 pull-right sideBar-time"><span class="time-meta pull-right">';
        var afterTime = '</span></div></div></div></div>';
        var htmlText = beforePhoto + imageURL + afterPhoto + message.from + afterUserName + message.loginTime + afterTime;
        d1.insertAdjacentHTML('beforeend', htmlText);
    }
}
function deleteUser(message) {
    var element = document.getElementById(message.senderID);
    element.outerHTML = "";
    delete element;

    createPush(message.from + " is offline ", mapUserID[message.senderID]);
    delete mapUserID[message.senderID];
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

    console.log("bağlantı ayarlanıyor.");
    var username = document.getElementById("username").innerHTML;
    console.log("username is: " + username);

    var host = document.location.host;
    var pathname = document.location.pathname;

    ws = new WebSocket("wss://" + host + "/chat/" + username);
    sendUserID();
    ws.onmessage = function(event) {
        // var log = document.getElementById("log");
        console.log(event.data);
        var message = JSON.parse(event.data);
        switch(message.type) {
            case "addMessage":
                addNewMessage(message);
                break;
            case "addNewUser":
                addNewUser(message);
                break;
            case "deleteUser":
                deleteUser(message);
            default:
        }
    };
}

function send() {
    var content = document.getElementById("comment").value;
    var userID  = document.getElementById("userID").innerHTML;

    if (content != "" && content != "\n" && content != " " ){
        var json = JSON.stringify({
            "content":content,
            "senderID":userID,
            "type":"addMessage",
            "path":document.getElementById("profile-photo").src
    });
        ws.send(json);
        document.getElementById("comment").value = "";
    }
}

function sendUserID(){
    // Wait until the state of the socket is not ready and send the message when it is...
    waitForSocketConnection(ws, function(){
        console.log("message sent!!!");
        var userID  = document.getElementById("userID").innerHTML;

        var json = JSON.stringify({
            "senderID":userID,
            "type":"addNewUser"
    });
        ws.send(json);
    });
}

// Make the function wait until the connection is made...
function waitForSocketConnection(socket, callback){
    setTimeout(
        function () {
            if (socket.readyState === 1) {
                console.log("Connection is made")
                if(callback != null){
                    callback();
                }
                return;

            } else {
                console.log("wait for connection...")
                waitForSocketConnection(socket, callback);
            }

        }, 5); // wait 5 milisecond for the connection...
}

function sendEmoji() {
    document.getElementById("comment").value += "😂";
}

function signOut() {
    var resp = confirm("Çıkış yapmak istediğinize emin misiniz?");
    if (resp) {
        window.location.href = "../logout.jsp";
    }
}

function clearHistory() {
    var resp = confirm("Sohbet geçmişini temizlemek istediğinize emin misiniz?");
    if (resp) {
        window.location.href = "../index.jsp";
    }
}