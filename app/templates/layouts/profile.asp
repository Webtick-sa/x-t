{% set profile = conn.execute("SELECT profile FROM users WHERE id=='{}'".format(id)).fetchone()['profile'] %}
{% set prfl = conn.execute("SELECT firstname, lastname FROM users WHERE id=='{}'".format(id)).fetchone() %}
{% set _username = prfl['firstname'] + ' ' + prfl['lastname'] %}
<div class="profile-pg">
  <div class="detail">
    <div class="p-cnt">
    {% if profile == 'df' %}
      <img class="u-profile" src="assets/default.jpg">
    {% else %}
      <img class="u-profile" src="http://{{ _ipaddr }}:8000/image?uuid={{ id }}&ppic={{ profile }}&ptp=profile">
    {% endif %}
    </div>
    <div class="uname-cnt">
      <div class='m-uname'>{{ _username }}</div>
    </div>
    <div class="row">
      <div class="info">
        <h3>Likes</h3>
        <span>{{ _rand(3, "digits") }}</span>
      </div>
      <div class="info">
        <h3>Followers</h3>
        <span>{{ _rand(3, "digits") }}</span>
      </div>
      <div class="info">
        <h3 onclick="LogOut(true)">Posts</h3>
        <span>{{ _rand(3, "digits") }}</span>
      </div>
    </div>
  </div>
  <div class="notification list-options-raw">
		<div class="notification-container list-options-raw-container">
			<div class="notification-content list-options-raw-content">
				<span class="notification-timer list-options-raw-text">
          <p class="notification-text">
          Change <strong>Password</strong>
          </p>
        </span>
			</div>
		</div>
	</div>
  <div class="notification list-options-raw">
		<div onclick="changeTheme()" class="notification-container list-options-raw-container">
			<div class="notification-content list-options-raw-content">
				<span class="notification-timer list-options-raw-text">
          <p class="notification-text">
          Change <strong>Theme</strong>
          </p>
        </span>
			</div>
		</div>
	</div>
  <div class="profile-inner-content clear">
    <div class="column">
      <img src="assets/df5.jpg">
      <img src="assets/df3.jpg">
      <img src="assets/df2.jpg">
      <img src="assets/df5.jpg">
      <img src="assets/df2.jpg">
      <img src="assets/df.jpg">
      <img src="assets/df4.jpg">
    </div>
    <div class="column">
      <img src="assets/df2.jpg">
      <img src="assets/df5.jpg">
      <img src="assets/df2.jpg">
      <img src="assets/df3.jpg">
      <img src="assets/df.jpg">
      <img src="assets/df4.jpg">
    </div>
    <div class="column">
      <img src="assets/df4.jpg">
      <img src="assets/df2.jpg">
      <img src="assets/df2.jpg">
      <img src="assets/df.jpg">
      <img src="assets/df2.jpg">
      <img src="assets/df3.jpg">
    </div>
  </div>
</div>