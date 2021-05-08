<!DOCTYPE html>
<html>

<head>
    <title>
        SignUp
    </title>

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

        input[type=text],
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

<body>

    <body class="container" style="background-color:#f1f1f1">
        <h1 style="text-align:center">
            SignUp
        </h1>

        <form action="UserRegister" method="post">

            <div>

                <input type="text" placeholder="username" name="uname" required>

                <input type="text" placeholder="mobilenumber" name="mobilenumber" required>

                <input type="text" placeholder="email" name="email" required>

                <input type="password" placeholder="password" name="psw" required>

                <input type="password" placeholder="conform_password" name="cpsw" required>

                <button type="submit">SignUp</button>


            </div>
            <br>
            <div style="text-align:center">

                <span class="psw">Already a member? <a href="login.html">Login</a></span>
            </div>
        </form>
    </body>
</body>

</html>