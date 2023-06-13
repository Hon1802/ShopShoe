const rightbtn = document.querySelector('.fa-chevron-right')
const leftbtn = document.querySelector('.fa-chevron-left')
const intnumber = document.querySelectorAll('.content-img img')

console.log(intnumber.length)
let index = 0
rightbtn.addEventListener("click", function() {
    index = index + 1
    if (index > intnumber.length - 1) {
        index = 0
    }
    document.querySelector('.content-img').style.right = index * 100 + "%"
})
leftbtn.addEventListener("click", function() {
    index = index - 1
    if (index <= 0) {
        index = intnumber.length - 1
    }
    document.querySelector('.content-img').style.right = index * 100 + "%"
})