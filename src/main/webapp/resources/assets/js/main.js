var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 3000);
   // Change image every 2 seconds
}


//Scroll to top
var link = document.getElementById("scrollUp");
var amountScrolled = 250;

window.addEventListener('scroll', function(e) {
    if ( window.pageYOffset > amountScrolled ) {
        link.classList.add('show');
    } else {
        link.className = 'scrollUp';
    }
});


link.addEventListener('click', function(e) {
    e.preventDefault();

    var distance = 0 - window.pageYOffset;
    var increments = distance/(500/16);
    function animateScroll() {
        window.scrollBy(0, increments);
        if (window.pageYOffset <= document.body.offsetTop) {
            clearInterval(runAnimation);
        }
    };
    var runAnimation = setInterval(animateScroll, 16);
});