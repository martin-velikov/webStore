      function getCartData() {
          var request = new XMLHttpRequest();
          var cartData = { total: 0, quantity: 0};
          document.cookie = "redirect=" + location.pathname;
          request.open("get", "/ShoppingCartServlet", true);
          request.onreadystatechange = function () {
              if (request.readyState == 4) {
                  if (request.status === 200) {
                      cartData = JSON.parse(this.responseText);
                      document.getElementById("cartTotal").innerHTML = cartData.total;
                      document.getElementById("cartItems").innerHTML = cartData.quantity;

                  } else {
                      alert("omaza sa");
                  }
              }
          };
          request.send();
      }