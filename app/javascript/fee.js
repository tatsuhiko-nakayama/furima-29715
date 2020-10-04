function calculation (){
  const input = document.getElementById("item-price");
  input.addEventListener("input", () => {
    const price = document.getElementById("item-price").value;
    const fee = parseInt(price * 0.1, 10);
    const benefit = parseInt(price * 0.9, 10);
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    if ( price == 0 ) {
      addTaxPrice.innerText = 0;
      profit.innerText = 0;
    }else{
      addTaxPrice.innerText = fee;
      profit.innerText = benefit;
    };
  });
}

if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  window.addEventListener('load', calculation);
}