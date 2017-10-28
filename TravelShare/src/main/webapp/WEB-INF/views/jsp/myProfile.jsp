<!DOCTYPE html>

<html>
    <head>
        <title>My Profile</title>
        
</head>
<body class="">
<div class="page-wrap">

<div class="navbar-overlay"></div>
<div class="l-container centered-box">
<div class="centered-box__content l-row">
<h1 class="centered-box__title">Edit Your Profile</h1>
    
<form class="l-row form" id="edit_user" enctype="multipart/form-data" action="/" accept-charset="UTF-8" method="post">
<div class="l-lg-12 form__group avatar-form">
<label class="form__label" for="user_avatar">Avatar</label>
<div class="avatar-form__progress">
<div style="width:30" class="avatar-form__progress-bar"></div>
</div>
<div class="avatar-form__img-container">
<img class="pull-left avatar-form__img" width="60" height="60" src="https://marketplace.canva.com/MAB6v043Ud8/1/thumbnail/canva-robot-electric-avatar-icon-MAB6v043Ud8.png" alt="0160dcc0668dfd402690cd54b9d2a5df?s=200&amp;d=mm" />
</div>
<button class="btn-secondary avatar-form__btn btn--sm" type="button">Choose file</button>
<input accept="image/jpg, image/jpeg, image/png" class="js-avatar-input hidden" type="file" name="user[avatar]" id="user_avatar" />
</div>
<div class="l-lg-6 form__group">
<label class="form__label" for="user_first_name">First name</label>
<input autofocus="autofocus" required="required" class="form__input" maxlength="25" size="25" type="text" value="Ivan" name="user[first_name]" id="user_first_name" />
</div>
<div class="l-lg-6 form__group">
<label class="form__label" for="user_last_name">Last name</label>
<input class="form__input" maxlength="25" size="25" type="text" value="Gospodinov" name="user[last_name]" id="user_last_name" />
</div>
<div class="l-lg-12 form__group">
<label class="form__label" for="user_email">Email</label>
<input required="required" class="form__input" type="email" value="ivandiqnov1@gmail.com" name="user[email]" id="user_email" />
</div>
<div class="l-lg-12 form__group">
<label class="form__label" for="username">Username</label>
<input class="form__input" maxlength="25" size="25" type="text" name="username" id="username" />
</div>

<div class="l-lg-12 form__group">
<label class="form__label">Password</label>
<a href="/change-password/">Change Password →</a>
</div>
<div class="l-lg-12 form__group">
<input type="submit" name="commit" value="Update Profile" class="btn-secondary btn--lg form__button" data-disable-with="Update Profile" />
</div>
</form> </div>
</div>
</div>

</body>
</html>