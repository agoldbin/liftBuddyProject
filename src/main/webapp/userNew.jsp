<%-- New user sign up page --%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@include file="templates/taglib.jsp"%>

<head>
    <%@include file="templates/head.jsp"%>
    <script src="js/init.js"></script>
</head>

<html>
<body>
<header>
    <%@include file="templates/navbar.jsp"%>
</header>
<div class="row">
    <form class="col s12 m6 offset-m3" action="newUser">
        <div class="row">
            <div class="input-field col s12 m6">
                <input id="first_name" name="first_name" type="text" class="validate" pattern="^[a-zA-Z]*$"
                       title="First name must be only letters" autofocus="autofocus" required="">
                <label for="first_name">First Name</label>
            </div>
            <div class="input-field col s12 m6">
                <input id="last_name" name="last_name" type="text" class="validate" pattern="^[a-zA-Z]*$"
                       title="Last name must be only letters" required="">
                <label for="last_name">Last Name</label>
            </div>
            <%--TODO fix validation for username and email--%>
            <div class="input-field col s12">
                <input id="email" name="email" type="email" class="validate" title="Please enter a valid email"
                       required="">
                <%--pattern="^([a-zA-Z0-9_\-\.]+)@|(([a-zA-Z0-9\-]+\.)+))--%>
                <%--([a-zA-Z]{2,4}$"--%>
                <label for="email" class="active">Email</label>
            </div>
            <div class="input-field col s12">
                <input id="user_name" name="user_name" type="text" class="validate"
                       title="Username must begin with a letter or underscore, no special characters.
                <%--pattern="^[A-Za-z_]\\w{4,19}$"--%>
                    5 to 20 characters long" required="">
                <label for="user_name">Username</label>
            </div>
            <div class="input-field col s12">
                <input id="location" name="location" type="text" class="validate" pattern="^[\d]{5}"
                       title="Enter 5 digit Zip Code" required="">
                <label for="location">Zip Code</label>
            </div>
            <div class="valign-wrapper col s12">
                <div class="input-field col s12 m6">
                    <select name="gymSelect" id="gymSelect">
                        <option value="" selected>Select your gym</option>
                        <%--TODO add new user servlet, query gym names, store as attribute, grab attribute to populate drop down--%>
                        <c:forEach items="${gyms}" var="gym">
                            <option value="${gym.gymName}"> ${gym.gymName}</option>
                        </c:forEach>
                    </select>
                </div>
                <p></p>
                <div class="input-field col s12 m6">
                    <input id="newGym" name="newGym" type="text" class="validate"
                           title="Gym name">
                    <label for="newGym">Add gym</label>
                </div>
            </div>
            <div class="input-field col s12">
                <input id="password" name="password" type="password" class="validate"
                       pattern="^[A-Za-z\d$@$!%*#?&amp;]{6,}$" title="Password must be at least 6 characters long"
                       required="">
                <label for="password">Password</label>
            </div>
            <div class="input-field col s12">
                <input id="confirmPassword" type="password" class="validate" pattern="^[A-Za-z\d$@$!%*#?&amp;]{6,}$"
                       title="Password must be at least 6 characters long" onchange="checkPasswordMatch();"
                       required="">
                <label for="confirmPassword">Confirm Password</label>
            </div>
            <div>
                <div class="registrationFormAlert" id="divCheckPasswordMatch">
                </div>
            </div>
            <p class="col s12">Would you like to track your weight with LiftBuddy?</p>
            <div class="col s12">
            <div class="switch col s4">
                <label>
                    No
                    <input id="trackWeight" name="trackWeight" type="checkbox" onchange="trackWeights();">
                    <span class="lever"></span>
                    Yes
                </label>
            </div>
        </div>
        <div id="weight" class="input-field col s8" style="display: none">
            <input id="currentWeight" type="number" class="validate" pattern="^[0-9]{1-3}$"
                   title="Please enter a valid weight">
            <label for="currentWeight">Weight</label>
        </div>
        </div>
        <div class="center-align">
            <button id="createUser" class="btn waves-effect waves-light" type="submit" name="action">Submit
                <i class="material-icons right">send</i>
            </button>
        </div>
    </form>
    <div class="col m3 hide-on-small-and-down">
        Some content, like advertisements or something.
    </div>
</div>
<footer>
    <%@include file="templates/footer.jsp"%>
</footer>

<script>
    function trackWeights() {
        if (document.getElementById("trackWeight").checked) {
            document.getElementById("weight").style.display = "block";
        } else {
            document.getElementById("weight").style.display = "none";
        }
    }
</script>
</body>
</html>