// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .


// $(document).ready(function(){
// 	var indexPostsRatings = document.querySelector('.postrating');
// 	for (rate of indexPostsRatings) {
//     	if (rate.querySelector('#scorePoints') > 0 ){
//     		rate.querySelector('#scorePoints').style.color = "#1bb76e";
//     		rate.querySelector('#upOrDown').innerText = "up";
//        	}
//     	if (rate.querySelector('#points') = 0 ){
//     		rate.querySelector('#scoreColor').style.color = "#830d1d";
//     		rate.querySelector('#upOrDown').innerText = "down";
//     	}
//     	else {
//     		rate.querySelector('#scoreColor').style.color = "#7eacdc";
//     		rate.querySelector('#upOrDown').innerText = "no ratings";
//     		rate.querySelector('#scoreColor').innerText = "";
//     	}

// 	}
// });

const copyToClipboard = (obj, event) => {
  const el = document.createElement('textarea');
  el.value = document.querySelector(obj).innerText;
  el.setAttribute('readonly', '');
  el.style.position = 'absolute';
  el.style.left = '-9999px';
  document.body.appendChild(el);
  el.select();
  document.execCommand('copy');
  document.body.removeChild(el);
  event.target.value = 'Copied!'
};

window.onscroll = function(){
  var n = document.querySelector('nav');
  if (window.scrollY >= 184) {
  	// n.style.borderBottom = "2px solid #1E3471";
		n.style.height = '53px';		
  	n.style.borderBottom = "2px solid #750d1d";
  }
	else {
		n.style.borderBottom = "0px solid #091534";
		n.style.height = '50px';
	}
    
}