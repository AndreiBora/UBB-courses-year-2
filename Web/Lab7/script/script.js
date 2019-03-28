$(document).ready(function(){
    get_all();

    function get_all(){
        $.get("getProducts.php",
                function(data,status){
                console.log(data);
            });
    }
});

