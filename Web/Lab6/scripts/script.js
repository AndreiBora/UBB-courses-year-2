$(document).ready(function(){

    var container=$('#my-modal'), 
        box = $('#modal-content'),
        handle_left = $('#drag-left');
        handle_top = $('#drag-top');
        handle_right = $('#drag-right');
        handle_bottom = $('#drag-bottom');
    // open pop-up
   $('#btn-quotes').bind('click',function(){
       $('#my-modal').css('display','block');
   })
//    close pop-up
   $('.close').click(function(){
        $('#my-modal').css('display','none');
   });


   handle_left.on('mousedown',function(e){
       e.preventDefault();
        var px = e.pageX;
        var w = box.width();
        console.log(px);
        $(document).on('mousemove',function track(e2){
            console.log("px" + px);
            console.log("clientX" + e2.clientX);

            console.log('move');
            box.css('left',e2.clientX);
            var offset = px-e2.clientX;
            box.css('width',w +offset);
            $(document).on('mouseup',break2);
        });
   });

   handle_right.on('mousedown',function(e){
    e.preventDefault();
    var px = e.pageX;
    var w = box.width();
    console.log(px);
    $(document).on('mousemove',function track(e2){
        console.log("px" + px);
        console.log("clientX" + e2.clientX);

        console.log('move');
        box.css('right',e2.clientX);
        var offset = e2.clientX-px;
        box.css('width',w +offset);
        $(document).on('mouseup',break2);
    });
   });

   handle_top.on('mousedown',function(e){
    e.preventDefault();
    var py = e.pageY;
    var h = box.height();
    console.log(py);
    $(document).on('mousemove',function track(e2){
      
       
        var offset = py - e2.clientY;
        console.log('height' + h);
        console.log('new height' + (h +offset));
        console.log('min height' + box.css('min-height'));

        if((h +offset) > 200){
            box.css('height',h +offset);
            box.css('top',e2.clientY);
        }

        $(document).on('mouseup',break2);
    });
   });
   handle_bottom.on('mousedown',function(e){
    e.preventDefault();
    var py = e.pageY;
    var h = box.height();
    console.log(py);
    $(document).on('mousemove',function track(e2){
        console.log("py" + py);
        console.log("clientY" + e2.clientY);

        console.log('move');
        box.css('bottom',e2.clientY);
        var offset = e2.clientY-py;
        box.css('height',h +offset);
        $(document).on('mouseup',break2);
    });
   });



   function break2(e){
       $(document).unbind();
   }

   
    
});