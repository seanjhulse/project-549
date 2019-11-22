// source: https://stackoverflow.com/questions/45648886/swipe-left-right-for-a-webpage
window.onload = () => {
  let sidebar = document.getElementById('sidebar');
  let start = null;
  window.addEventListener("touchstart",function(event){
    if(event.touches.length === 1){
       // just one finger touched
       start = event.touches.item(0).clientX;
     }else{
       // a second finger hit the screen, abort the touch
       start = null;
     }
   });
   window.addEventListener("touchend",function(event){
    var offset = 100; // at least 100px are a swipe
    if(start){
      // the only finger that hit the screen left it
      var end = event.changedTouches.item(0).clientX;

      if(end > start + offset){
        // a left -> right swipe
        sidebar.classList.remove('open');
      }
      if(end < start - offset ){
        // a right -> left swipe
        sidebar.classList.add('open');
      }
    }
  });
};

