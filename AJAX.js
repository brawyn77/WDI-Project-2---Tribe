var request = new XMLHttpRequest();
//request.open( "PROTOCOL", "URL");
request.open("GET", "https://www.reddit.com/r/funny.json");
request.send();

request.onreadystatechange = function() {
  console.log("Ready State: " + request.readyState);
  if(request.readyState ===4){
    console.log(request.responseText);
  }
}
