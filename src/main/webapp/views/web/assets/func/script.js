const rightbtn = document.querySelector('.fa-chevron-right')
const leftbtn = document.querySelector('.fa-chevron-left')
const intnumber = document.querySelectorAll('.spct-sp-li li')

console.log(intnumber.length)
let index = 0
rightbtn.addEventListener("click", function() {
    index = index + 1
    if (index > intnumber.length) {
        index = 5
    }
    if (index * 20 < 100) {
        index = intnumber.length
    }
    document.querySelector('.spct-sp-li').style.right = index * 20 + "%"
})
leftbtn.addEventListener("click", function() {
    index = index - 1
    if (index <= 4) {
        index = intnumber.length
    }
    document.querySelector('.spct-sp-li').style.right = index * 20 + "%"
})

//show product

//s2
function viewView({ linkimg = "" }) {
    var ul = document.getElementById("shooo");
    var lipr = document.createElement("li");
    lipr.innerHTML = `<div class = "product-top" >
    <a href = "product.html" class = "product-thumb" > 
        <img src = "${linkimg}" alt = "sp1" >
    </a>
        <!--buy now-->
    <a href = "" class = "buy-now" > 
        Buy now 
    </a> </div>`;
    ul.appendChild(lipr);
}