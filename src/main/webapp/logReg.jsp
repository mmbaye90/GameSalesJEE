<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LogReg</title>
    <link rel="stylesheet" href="CSS/logReg.css">    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>

<body>
    <div class="container" id="container">

        <div class="form-container sign-up">
            <form action="#">
                <h1>Create Account</h1>
                <span>or use your email for register</span>
                <input type="text" placeholder="Full Name" name="firstLastName">
                <input type="email" placeholder="Email" name="emailReg">
                <input type="password" placeholder="Password" name="pwdReg">
                <button>Register</button>
            </form>
        </div>

        <div class="form-container sign-in">
            <form action="#">
                <h1>Sign In</h1>
                <c:if test="${testMsgErr}">
                	<span class="text-danger">${errLog }</span>
                </c:if>
                <input type="email" placeholder="Email" name="emailLog">
                <input type="password" placeholder="Password" name="pwdLog">
                <a href="#">Forgot Password?</a>
                <button>Login</button>
            </form>
        </div>

        <div class="toggle-container">
            <div class="toggle">

                <div class="toggle-panel toggle-left">
                    <h1>Welcome Back!</h1>
                    <p>Enter your personal details to use all of site features.</p>
                    <button class="hidden" id="login">Sign In</button>
                </div>

                <div class="toggle-panel toggle-right">
                    <h1>Hello, Subscriber!</h1>
                    <p>Register with your personal details to use all of site features.</p>
                    <button class="hidden" id="register">Sign Up</button>
                </div>
            </div>
        </div>
    </div>



    <script defer src="JS/logReg.js"></script>
</body>

</html>
