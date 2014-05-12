// facebook
window.fbAsyncInit = function() {
  FB.init({
    appId      : RPSLS.FB_APP_ID,
    version    : 'v1.0'
  });
};
(function(d, s, id){
   var js, fjs = d.getElementsByTagName(s)[0];
   if (d.getElementById(id)) {return;}
   js = d.createElement(s); js.id = id;
   js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&appId=371897399581991&version=v2.0";
   fjs.parentNode.insertBefore(js, fjs);
 }(document, 'script', 'facebook-jssdk'));

// google plus
(function(d) {
  var po = d.createElement('script'); po.type = 'text/javascript'; po.async = true;
  po.src = 'https://apis.google.com/js/plusone.js';
  var s = d.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
})(document);



