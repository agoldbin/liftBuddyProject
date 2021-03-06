<%-- Jsp for the home screen --%>
<!DOCTYPE html>
<head>
    <%@include file="templates/head.jsp"%>
    <script src="../js/init.js"></script>
<head>

<html>
<body>

<%@include file="templates/navbar.jsp"%>

<%--<h2>Lift Buddy Display</h2>--%>
    <div class="parallax-container show-on-large">
        <div class="parallax">
            <img src="images/background_bar_m.jpg">
        </div>
    </div>
    <div class="parallax-container hide-on-large-only">
        <div class="parallax">
            <img src="images/background_bar_s.jpg">
        </div>
    </div>
    <div class="section orange lighten-4">
        <div class="row container">
            <h1><a href="userSearch.jsp">TEST SEARCH</a></h1>
            <h2 class="header">Parallax</h2>
            <p class="grey-text text-darken-3">Parallax is an effect where the background content or image
                in this case, is moved at a different speed than the foreground content while scrolling.</p>
            <a href="adminSearch.jsp">Click here to search! (Admin only)</a>
        </div>
    </div>
    <div class="parallax-container">
        <div class="parallax">
            <img src="images/test3.jpg">
        </div>
    </div>

    <%@include file="templates/loginModal.jsp"%>

<footer>
    <%@include file="templates/footer.jsp"%>
</footer>

<script>
    // Initialize MODAL (used for user login)
    $(document).ready(function(){
        $('#loginModal').modal();
    });
    $('#loginModal').modal('open');
</script>
</body>
</html>