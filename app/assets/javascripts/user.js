function getPosition(position) {
  url = "http://geocode.xyz/" + position.coords.latitude + "," + position.coords.longitude + "?geoit=json";
  response = JSON.parse(makeRequest(url));

  let userCountyElement = document.getElementById('user-location');
  userCountyElement.innerHTML = response.city;
}

function makeRequest(url) {
  var xmlHttp = new XMLHttpRequest();
  xmlHttp.open("GET", url, false);
  xmlHttp.send(null);
  return xmlHttp.responseText;
}

document.addEventListener("DOMContentLoaded", function (event) {
  navigator.geolocation.getCurrentPosition(getPosition);
});