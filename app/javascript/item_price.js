window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    
      
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1) 
    

    const profitNumber = document.getElementById("profit");
    profitNumber.innerHTML = Math.floor(inputValue * 0.9)
   
  })
});

// $(function(){
//   $( document ).on( 'keyup', 'item-price', function(){ 
//     let amount = $( this ).val();
//     let tax = Math.ceil(amount * 0.1);
//     let profit = Math.floor(amount * 0.9);
//     $('add-tax-price').html(tax);
//     $('profit').html(profit);
//   });
// });