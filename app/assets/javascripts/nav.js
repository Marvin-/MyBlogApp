$(function() {
  // $(".center a:even").remove();
  // $(".log a:first-child").remove();
  $("a").each(function(){ 
    var t = $(this); 
    if(t.text() ==="") {
      t.remove(); 
    }
  });
  $(".center-nav-links a").hover(
    function() {
    $( this ).addClass( "underline" );
  }, function() {
    $( this ).removeClass( "underline" );
  }
 )
});
