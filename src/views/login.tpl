% rebase("bootstrap.tpl")
<div class="p-3 mb-2 bg-warning text-dark">
<h1 style="color:blue;">LOGIN</h1>

<p>Login or sign in</p>
</div>
<div class = "container">
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
    <input value="Sign in" type="submit"class="btn btn-success"  />
</form>
<br>
<b><i>Username and password can contain only numbers, dashes and letters from english alphabet!</i></b>

</div>
