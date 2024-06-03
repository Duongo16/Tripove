<%-- Document : slideshow Created on : May 21, 2024, 9:49:10 AM Author : Admin
--%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>JSP Page</title>
    <link rel="stylesheet" href="css/styleSlideShow.css" />
    <link rel="stylesheet" href="icon/themify-icons/themify-icons.css" />
  </head>
  <body>
    <div id="slide-show">
      <div id="list-images">
        <div class="image"><img src="image/home/2.png" alt="" /></div>
        <div class="image"><img src="image/home/4.png" alt="" /></div>
        <div class="image"><img src="image/home/7.png" alt="" /></div>
        <div class="image"><img src="image/home/3.png" alt="" /></div>
        <div class="image"><img src="image/home/1.png" alt="" /></div>
        <div class="image"><img src="image/home/5.png" alt="" /></div>
        <div class="image"><img src="image/home/6.png" alt="" /></div>
      </div>
      <ul class="dots">
        <li class="dot-now"></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
      </ul>
    </div>

    <div class="buttons">
      <button id="prev-btn"><i class="ti-angle-left"></i></button>
      <button id="next-btn"><i class="ti-angle-right"></i></button>
    </div>

    <script>
      let list = document.querySelector("#slide-show #list-images");
      let images = document.querySelectorAll("#slide-show #list-images .image");
      let dots = document.querySelectorAll("#slide-show .dots li");
      let prevBtn = document.getElementById("prev-btn");
      let nextBtn = document.getElementById("next-btn");

      let active = 0;
      let lengthImages = images.length - 1;

      nextBtn.onclick = function () {
        if (active + 1 > lengthImages) {
          active = 0;
        } else {
          active += 1;
        }
        reloadSlider();
      };

      prevBtn.onclick = function () {
        if (active - 1 < 0) {
          active = lengthImages;
        } else {
          active -= 1;
        }
        reloadSlider();
      };

      let refreshSlider = setInterval(() => {
        nextBtn.click();
      }, 3200);

      function reloadSlider() {
        let checkLeft = images[active].offsetLeft;
        list.style.left = -checkLeft + "px";
        let lastActiveDot = document.querySelector(
          "#slide-show .dots li.dot-now"
        );

        lastActiveDot.classList.remove("dot-now");
        dots[active].classList.add("dot-now");
        // xoa hoaat dong an next khi nguoi dung an prev, 
        //next hay dot de tranh viec chua xem xong anh da chay
        clearInterval(refreshSlider);
        //sau do tiep tuc khai bao lai cho refreshSlider
        refreshSlider = setInterval(()=>{nextBtn.click()},3200)
      }

      dots.forEach((li, key) => {
        li.addEventListener("click", function () {
          active = key;
          reloadSlider();
        });
      });
    </script>
  </body>
</html>
