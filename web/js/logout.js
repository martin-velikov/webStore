        function logout() {
            var request = new XMLHttpRequest();
            request.open("post", "/LogoutServlet", true);
            request.send();
            setTimeout(function() { location.href="index.jsp" },1000);
        }