// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


console.log("hello world");

// ***** BuildBox



// $(document).ready(function(){
//
//   $( "#box_family" ).click(function() {
//     $( "#collapse2" ).toggle( "fast", function() {
//     });
//   });
//
//   $( "#entered-quantity" ).click(function() {
//     $( "#collapse3" ).show( "slow", function() {
//     });
//   });
//
//     });




// **** Cart quantity

$(document).ready(function(){

  // [ { name: 'Chair', qty: 5 }, { name: 'Towel', qty: 4} ]
  $(".cart-update").click(function(e){
    e.preventDefault();
    var products = $(".product-list .item_qty").map(function(index, item){
      return {
        name: item.dataset.name,
        orderitems_quantity: item.value,
        product_id: item.dataset.id,
      }
    })
    $.ajax({
      type: "POST",
      url: "/order_items",
      data: {products: JSON.stringify(products.get()), multiple_items: true},
      success: function(data){
        if(data.success) {
          window.location.href = "/delivery"
        }
      },
      error: function(){
        alert('failure');
      },
      dataType: "JSON"
    });
    console.log("==== products", products)
  });

  $("#box_family").click(function(){
    console.log("hello")
    $( "#collapse2" ).show( "slow", function() {
        });
        $( "#collapse1" ).hide( "slow", function() {
            });
  });

  $("#box_adult").click(function(){
    console.log("hello")
    $( "#collapse2" ).show( "slow", function() {
        });
        $( "#collapse1" ).hide( "slow", function() {
            });
            $( ".counter-child" ).hide( "slow", function() {
                });
                $( "suncreenchild" ).empty( function() {
                    });
  });

  $("#entered-quantity").click(function(){
    var numChild = $("#child").val();
    if (numChild==0) {
      $( ".suncreenchild" ).empty( function() {
      });
        }
    pushAdultBase(),
    pushChildBase(),
    pushFamilyBase(),
    $( "#collapse3" ).show( "slow", function() {
        });
        $( "#collapse2" ).hide( "slow", function() {
            });
  });

  $("#back-to-1").click(function(){
    console.log("hello")

    $( "#collapse2" ).hide( "slow", function() {
        });
        location.reload();
        $( "#collapse1" ).show( "slow", function() {
            });
  });

  $("#back-to-2").click(function(){
    console.log("hello")
    $( "#collapse2" ).show( "slow", function() {
        });
        $( "#collapse3" ).hide( "slow", function() {
            });
  });

});

function getNumAdult(){
  var numAdult = $("#adult").val()
  console.log(numAdult)

};

function getNumChild(){
  var numChild = $("#child").val()
  console.log(numChild)

};

function getNumFam(){
  var numAdult = $("#adult").val()
  var numChild = $("#child").val()
  var getNumFam = parseInt("numAdult")+parseInt("numChild")

};

function pushAdultBase(){
  var numAdult = Math.ceil($("#adult").val()/4)
  console.log(numAdult)
  $( "#adult_suncreen_qty" ).val(numAdult)

};

function pushChildBase(){
  var numChild = Math.ceil($("#child").val()/4)
  console.log(numChild)
  $( "#children_sunscreen_qty" ).val(numChild)

};

function pushFamilyBase(){
  var numAdult = $("#adult").val()
  var numChild = $("#child").val()
  var getNumFam = parseInt(numAdult)+parseInt(numChild)
  console.log(getNumFam)
  $( "#towel_qty" ).val(getNumFam);
  $( "#chair_qty" ).val(getNumFam);


};



// ****** Counter

$(document).on('click', '.number-spinner a', function () {
       var btn = $(this),
       input = btn.closest('.number-spinner').find('input'),
       total = $('#people').val(),
       oldValue = input.val().trim();

   if (btn.attr('data-dir') == 'up') {
     if(oldValue < input.attr('max')){
       oldValue++;
       total++;
     }
   } else {
     if (oldValue > input.attr('min')) {
       oldValue--;
       total--;
     }
   }
   $('#people').val(total);
   input.val(oldValue);
 });

 // you going to click the next button
  // then you will create a array of object
  // [ { name: 'Chair', qty: 5 }, { name: 'Towel', qty: 4} ]
// ^^ is going to be send through ajax to the BE
// in the BE then we save that to the cart!
