<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Redirect to index.jsp if no UID -->
<c:if test="${username == null}">
	<c:redirect url="index.jsp" />
</c:if>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Chat box - Bootdey.com</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
    	                    

 .portlet {
    margin-bottom: 15px;
}

.btn-white {
    border-color: #cccccc;
    color: #333333;
    background-color: #ffffff;
}

.portlet {
    border: 1px solid;
}

.portlet .portlet-heading {
    padding: 0 15px;
}

.portlet .portlet-heading h4 {
    padding: 1px 0;
    font-size: 16px;
}

.portlet .portlet-heading a {
    color: #fff;
}

.portlet .portlet-heading a:hover,
.portlet .portlet-heading a:active,
.portlet .portlet-heading a:focus {
    outline: none;
}

.portlet .portlet-widgets .dropdown-menu a {
    color: #333;
}

.portlet .portlet-widgets ul.dropdown-menu {
    min-width: 0;
}

.portlet .portlet-heading .portlet-title {
    float: left;
}

.portlet .portlet-heading .portlet-title h4 {
    margin: 10px 0;
}

.portlet .portlet-heading .portlet-widgets {
    float: right;
    margin: 8px 0;
}

.portlet .portlet-heading .portlet-widgets .tabbed-portlets {
    display: inline;
}

.portlet .portlet-heading .portlet-widgets .divider {
    margin: 0 5px;
}

.portlet .portlet-body {
    padding: 15px;
    background: #fff;
}

.portlet .portlet-footer {
    padding: 10px 15px;
    background: #e0e7e8;
}

.portlet .portlet-footer ul {
    margin: 0;
}

.portlet-default,
.portlet-dark-blue,
.portlet-default>.portlet-heading,
.portlet-dark-blue>.portlet-heading {
    border-color: #34495e;
}

.portlet-default>.portlet-heading,
.portlet-dark-blue>.portlet-heading {
    color: #fff;
    background-color: #34495e;
}

.portlet-basic,
.portlet-basic>.portlet-heading {
    border-color: #333;
}

.portlet-basic>.portlet-heading {
    border-bottom: 1px solid #333;
    color: #333;
    background-color: #fff;
}

@media(min-width:768px) {
    .portlet {
        margin-bottom: 30px;
    }
}

.text-green {
    color: #16a085;
}

  
textarea {
    width:330px;
    padding: 0;
    border: 1px solid #ccc;
    }    
    body{	
  
	-moz-background-size: cover;
-webkit-background-size: cover;
background-size: cover;
background-position: top center !important;
background-repeat: no-repeat !important;
background-attachment: fixed;
	}
	
    </style>
</head>
<body>
<img src="medical-cross-background-11.jpg" alt="Smiley face" height="500" width="500"/>
 
                    
<div class="container bootstrap snippet">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="portlet portlet-default">
                <div class="portlet-heading">
                   
                    <div class="portlet-widgets">
                        <div class="btn-group">
                            <button type="button" class="btn btn-white dropdown-toggle btn-xs" data-toggle="dropdown">
                                <i class="fa fa-circle text-green"></i><b>Hello ${username}..Welcome !!!</b>
                                
                            </button>
                                                   </div>
                        <span class="divider"></span>
                        <a data-toggle="collapse" data-parent="#accordion" href="#chat"><i class="fa fa-chevron-down"></i></a>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div id="chat" class="panel-collapse collapse in">
                    <div>
                    <div class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: 300px;">
                        <div id="content" class="content"></div>
                      
                    </div>
                    </div>
                   <div class="portlet-footer">
                        <form role="form">
                            <div class="form-group">
                <textarea class="form-control" id="msg" placeholder="Enter message..." onkeyup="inputKeyUp(event)"></textarea>
                            </div>
                           
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.col-md-4 -->
    </div>
</div>                

<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script>
	      function inputKeyUp(event){
	if (!event) // IE will not pass event
		event = window.event;
	if (event.keyCode == 13 && !event.shiftKey) { // ENTER pressed
		var target = (event.currentTarget) ? event.currentTarget : event.srcElement,
			value = target.value;
		// make sure not only space char
		if (value && value.replace(/^\s\s*/, '').replace(/\s\s*$/, '').length > 0) {
			this.sendMsg(target.value);
			target.value = '';
		}
	}
};
function sendMsg(msg) {
	var request;
	var D = new Date();
var hours = D.getHours();
var minutes = D.getMinutes();
var seconds = D.getSeconds();
var time = hours + ":" + minutes + ":" + seconds;

	msg = msg.replace(/&/g, '&amp;') // encode to prevent XSS
				.replace(/</g, '&lt;')
				.replace(/>/g, '&gt;')
				.replace(/"/g, '&quot;')
				.replace(/\n/g, '<br />'); // replace textarea newline to line break tag

	//request.open('POST', 'chat.do?action=send&msg='+msg+'&time='+new Date().getTime());
	updateContent('<div style="color:blue;font-weight:bold;font-size: 105%;">You : &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:black;font-size:70%;">'+time+'</span></div><span style="font-weight:bold;">'+msg+'</span>');
	httpRequestCall(msg);
	
};
function updateContent(msg) {
	var content = document.getElementById('content'),
		atBottom = (content.scrollTop + content.offsetHeight) >= content.scrollHeight;
	content.innerHTML += msg;
	// only scroll to bottom if it is at bottom before msg added
	if (atBottom)
		content.scrollTop = content.scrollHeight;
};
var xhr = new XMLHttpRequest();
function httpRequestCall(msg){
	//var userName="Navya"
	//var userID=1236
	xhr.open('GET', "http://localhost:8051/lookByhi?body="+msg, true);
	xhr.send();
	xhr.addEventListener("readystatechange", processRequest, false);
}
function processRequest(e) {
	var request;
	var D = new Date();
var hours = D.getHours();
var minutes = D.getMinutes();
var seconds = D.getSeconds();
var time = hours + ":" + minutes + ":" + seconds;
    if (xhr.readyState == 4 && xhr.status == 200) {
        var response = xhr.responseText;
        console.log('the response is: '+response)
       // alert(response);
        updateContent('<div style="color:orange;font-weight:bold;font-size: 105%;">Mocha :&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:black;font-size:70%;">'+time+'</span></div><span style="font-weight:bold;">'+response+'</span>');
        
    	
    }
}
              
                
</script>
</body>
</html>















