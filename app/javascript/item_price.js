window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const ProfitPrice = document.getElementById("profit");
  priceInput.addEventListener("input", () => {
     const inputValue = priceInput.value;
     const Tax = inputValue / 10
     const Profit = inputValue - Tax
     addTaxDom.innerHTML = Math.floor(Tax);
     ProfitPrice.innerHTML = Math.floor(Profit);
  });
});

