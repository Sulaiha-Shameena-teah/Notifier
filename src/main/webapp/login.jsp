<!DOCTYPE html>
<html>

<head>
    <title>Login</title>
    <style>
        button {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

        .container {
            margin: auto;
            padding: 10px;
            width: 60%;
            height: 60%;
        }

        input[type=email],
        input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
    </style>

</head>

<body class="container" style="background-color:#f1f1f1">
    <h1 style="text-align:center">
        Login
    </h1>

    <form action="UserLogin" method="post">

        <div>
            <!-- <label for="uname"><b>Username</b></label> -->
            <input type="email" placeholder="email" name="email" required>

            <!-- <label for="psw"><b>Password</b></label> -->
            <input type="password" placeholder="password" name="psw" required>

            <button type="submit">Login</button>
            <!-- <label>
            <input type="checkbox" checked="checked" name="remember"> Remember me
          </label> -->
            <!-- <span class="psw">Not a member? <a href="#">SignUp</a></span> -->

        </div>
        <br>
        <div style="text-align:center">

            <span class="psw">Not a member? <a href="register.jsp">SignUp</a></span>
        </div>
    </form>
</body>

</html>