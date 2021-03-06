// ***** BuildBox


// **** Cart quantity

$(document).ready(function(){

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
      $( ".children_sunscreen" ).empty( function() {
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

};

function getNumChild(){
  var numChild = $("#child").val()

};

function getNumFam(){
  var numAdult = $("#adult").val()
  var numChild = $("#child").val()
  var getNumFam = parseInt("numAdult")+parseInt("numChild")

};

function pushAdultBase(){
  var numAdult = Math.ceil($("#adult").val()/8)
  $( "#adult_suncreen_qty" ).val(numAdult);

};

function pushChildBase(){

  var numChild = Math.ceil($("#child").val()/8)
  $( "#children_sunscreen_qty" ).val(numChild);



};

function pushFamilyBase(){
  var numAdult = $("#adult").val()
  var numChild = $("#child").val()
  var getNumFam = parseInt(numAdult)+parseInt(numChild)
  $( "#towel_qty" ).val(getNumFam);
  $( "#chair_qty" ).val(getNumFam);
  $( "#umbrella_qty" ).val(Math.ceil(getNumFam/2));


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
