% rebase("bootstrap.tpl")
<body>
<div class = "container">
<h1>Login</h1>
<br>
<p><b>Already have an account? Login:</b></p>
<form action="/login" method="post">
    Username: <input name="username" type="text" placeholder= "Username" class="btn btn-outline-primary btn-sm" />
    Password: <input name="password" type="password" placeholder= "Password"  class="btn btn-outline-primary btn-sm"/>
    <input value="Login" type="submit" class="btn btn-success"/>
</form>
<br>
<p><b>Sign in:</b></p>
<form action="/login" method="post">
    New username: <input name="new_username" type="text" placeholder= "User123"  class="btn btn-outline-primary btn-sm"/>
    New password: <input name="new_password" type="password" placeholder= "Password123" class="btn btn-outline-primary btn-sm"/>
    <input value="Sign in" type="submit"class="btn btn-outline-success btn-sm"  />
</form>
<br>
<b><i>Username and password can contain only numbers, dashes and letters from english alphabet!</i></b>

</div>
