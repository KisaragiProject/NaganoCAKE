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
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree ../../../vendor/assets/javascripts/.
//= require_tree .

// トップページポップアップ
window.onload = function() {
  var popup = document.getElementById('js-popup');
  if(!popup) return;
  popup.classList.add('is-show');

  var blackBg = document.getElementById('js-black-bg');
  var closeBtn = document.getElementById('js-close-btn');

  closePopUp(blackBg);
  closePopUp(closeBtn);

  function closePopUp(elem) {
    if(!elem) return;
    elem.addEventListener('click', function() {
      popup.classList.remove('is-show');
    })
  }
}

// skippr(aboutページスライド)
$(function(){
	$("document").ready(function(){

	$("#theTargetAbout").skippr({
		transition: 'fade',
		speed: 1000,
		navType: 'bubble',
		childrenElementType: 'div',
		autoPlay: true,
		autoPlayDuration: 2000
	});
	});
});

// skippr(thanksページスライド)
$(function(){
	$("document").ready(function(){

	$("#theTargetThanks").skippr({
		transition: 'fade',
		speed: 1,
		childrenElementType: 'div',
		arrows: false,
		autoPlay: true,
		autoPlayDuration: 200,
		keyboardOnAlways: false
	});
	});
});
