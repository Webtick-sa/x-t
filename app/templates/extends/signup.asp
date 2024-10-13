   <div class="bodyy">
      <div class="wrapper">
        <div class="CLogo">Ceera</div>
        <div class="label-n">Sign up</div>
        <div class="signupform form">
         <div class="field fname">
            <div class="input-area">
              <input type="text" placeholder="Firstname" name="firstname">
              <i class="icon fa fa-user"></i>
              <i class="error error-icon fa fa-exclamation"></i>
            </div>
            <div class="error error-txt">Field can't be blank</div>
          </div>
          <div class="field lname">
            <div class="input-area">
              <input type="text" placeholder="Lastname" name="username">
              <i class="icon fa fa-user"></i>
              <i class="error error-icon fa fa-exclamation"></i>
            </div>
            <div class="error error-txt">Field can't be blank</div>
          </div>
          <div class="field email">
            <div class="input-area">
              <input type="email" placeholder="Email" name="email">
              <i class="icon fa fa-envelope"></i>
              <i class="error error-icon fa fa-exclamation"></i>
            </div>
            <div class="error error-txt">Field can't be blank</div>
          </div>
          <div class="field password">
            <div class="input-area">
              <input type="password" placeholder="Password" name="password">
              <i class="icon fa fa-lock"></i>
              <i class="error error-icon fa fa-exclamation"></i>
            </div>
            <div class="error error-txt">Password can't be blank</div>
          </div>
          <div class="field password2">
            <div class="input-area">
              <input type="password" placeholder="Repeat Password" name="password2">
              <i class="icon fa fa-lock"></i>
              <i class="error error-icon fa fa-exclamation"></i>
            </div>
            <div class="error error-txt">Passwords do not match</div>
          </div>
          <div class="field gender">
            <div class="input-area">
              <input type="gender" placeholder="Gender" name="gender">
              <i class="icon fa fa-lock"></i>
              <i class="error error-icon fa fa-exclamation"></i>
            </div>
            <div class="error error-txt">Must specify gender!</div>
          </div>
          <div class="pass-txt"><a href="#">Forgot password?</a></div>
          <input type="button" class="submit" onclick="Signup(document.querySelector('.signupform'))" value="Continue">
        </div>
        
        <div class="col">
          <input type="button" class="twitter btn" onclick="LoginPg()" value="Login to an existing Account">
        </div>
      </div>
    </div>