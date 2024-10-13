{% set profile = conn.execute("SELECT profile FROM users WHERE id=='{}'".format(id)).fetchone()['profile'] %}
{% for post in posts %}
{% set likes = conn.execute("SELECT * FROM likes LEFT JOIN users ON users.id=likes.uid WHERE post_id=='{}'".format(post['post_id'])).fetchall() %}
{% set comments = conn.execute("SELECT * FROM comments LEFT JOIN users ON users.id=comments.uid WHERE post_id=='{}'".format(post['post_id'])).fetchall() %}
{% set forwards = conn.execute("SELECT * FROM forwards LEFT JOIN users ON users.id=forwards.uid WHERE post_id=='{}'".format(post['post_id'])).fetchall() %}
{% set username = post['firstname'] + ' ' + post['lastname'] %}
{% set usern = post['username'] %}
{% set post_text = post['post_txt'] | replace(_tags("(#\w+)", post['post_txt']), "<font class='tagged-user'>{}</font>".format( _tags("(#\w+)", post['post_txt'])) | safe) %}
{% set post_text = post_text | replace(_tags("(@\w+)", post_text), "<font class='tagged-user'>{}</font>".format( _tags("@(\w+)", post_text)) | safe) %}
{% set post_pic = 'uploads/users/{}/posts/images/{}'.format(post['uid'], post['post_pic']) %}
{% set post_profile = "uploads/users/{}/profiles/{}".format(post['uid'], post['profile']) %}
{% set p_uprofile = "uploads/users/{}/profiles/{}".format(id, profile) %}
{% set _path_i = url_for('static', filename='uploads/users/{}/posts/images/{}'.format(post['uid'], post['post_pic'])) %}
{% set post_vid = url_for('static', filename='uploads/users/{}/posts/videos/{}'.format(post['uid'], post['post_vid'])) %}
<div id="mu-post" data-postid="{{ post['post_id'] }}" class="mu-post mt-6">
   <div class="u-dtl">
      {% if post['profile'] == 'df' %}
         <div class="u-pic-cnt">
            <img class="post-u-pic u-pic-avlc" src='assets/default.jpg'>
         </div>
      {% else %}
         <div class="u-pic-cnt" onclick="iurl('vprofile', {uuid: this.getAttribute('data-uuid') })" data-uuid="{{ post['uid'] }}">
            <img onload="onImgLoad(this, this.getAttribute('data-src'))" src='assets/imgthumb.gif' class="post-u-pic u-pic-avl"  data-src="http://{{ _ipaddr }}:8000/image?uuid={{ post['uid'] }}&ppic={{ post['profile'] }}&ptp=profile">
         </div>
      {% endif %}
      <div onclick="drp('onpostsv', this.getAttribute('data-postid'))" data-postid="{{ post['post_id'] }}" class="onclick-blue" id="post-drpbtn">•••</div>
      <div onclick="iurl('vprofile', {uuid: this.getAttribute('data-uuid') })" data-uuid="{{ post['uid'] }}" class="username onclick-blue">{{ username | replace(" ", " ") | replace("@", "") }}{% if post['ctype'] != 'ucf' %} <i class="fa fa-check-circle"></i>{% endif %}</div>
      {% if post['priority'] == 'public' %}
         <h3 class="p-date">
            <div class="p-date-ago">{{ _time(post['date']) }}</div>
            <div class="dot"> • </div>
            <div class="icn"><i class="fa fa-globe"></i></div>
            {% if post['mtag'] != None %}
               <div class="atu"><font color="#e5e5e5"><div class="dot"> • </div></font>{{ post['mtag'] }}</div>
            {% endif %}
         </h3>
         {% elif post['priority'] == 'ad' %}
            <h3 class="p-date">Sponsored <div class='dot'>•</div> ad</h3>
         {% elif post['priority'] == 'private' %}
            <h3 class="p-date">Sponsored <div class='dot'>•</div> <i class='fa fa-lock'></i></h3>
         {% endif %}
   </div>
   <div class="mb-4"></div>
   <div class="post-inner">
      {% if post['post_type'] == 'image' %}
         <div class="text-container">
            <div class="p-text">{{ post_text }}</div>
         </div>
         <div class="p-pic-cnt">
            <img id="p-pic" onload="onImgLoad(this, this.getAttribute('data-src'))" onclick="iurl('viewpost', {pid: this.getAttribute('data-pid') })" data-pid="{{ post['post_id'] }}" src='assets/imgthumb.gif' data-src="http://{{ _ipaddr }}:8000/image?uuid={{ post['uid'] }}&ppic={{ post['post_pic'] }}&ptp=post" class="p-pic preview">
         </div>
         <div class="left-vertical-container">
            <div class="test-left-vertical"><svg style="width: 1em; height: 1em;vertical-align: middle;fill: currentColor;overflow: hidden;" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg"><path d="M531.185456 943.532317c0 8.899694-6.493901 16.114003-14.503319 16.114003l-9.364275 0c-8.010441 0-14.504342-7.214309-14.504342-16.114003L492.81352 80.46666c0-8.898671 6.493901-16.114003 14.504342-16.114003l9.364275 0c8.009418 0 14.503319 7.215332 14.503319 16.114003L531.185456 943.532317z"  /></svg></div>
            <div class="text-test-left"><i>#puxple</i></div>
            <div class="test-left-vertical"><svg style="width: 1em; height: 1em;vertical-align: middle;fill: currentColor;overflow: hidden;" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg"><path d="M531.185456 943.532317c0 8.899694-6.493901 16.114003-14.503319 16.114003l-9.364275 0c-8.010441 0-14.504342-7.214309-14.504342-16.114003L492.81352 80.46666c0-8.898671 6.493901-16.114003 14.504342-16.114003l9.364275 0c8.009418 0 14.503319 7.215332 14.503319 16.114003L531.185456 943.532317z"  /></svg></div>
            <div class="text-test-left"><i>asher42</i></div>
            <div class="test-left-vertical"><svg style="width: 1em; height: 1em;vertical-align: middle;fill: currentColor;overflow: hidden;" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg"><path d="M531.185456 943.532317c0 8.899694-6.493901 16.114003-14.503319 16.114003l-9.364275 0c-8.010441 0-14.504342-7.214309-14.504342-16.114003L492.81352 80.46666c0-8.898671 6.493901-16.114003 14.504342-16.114003l9.364275 0c8.009418 0 14.503319 7.215332 14.503319 16.114003L531.185456 943.532317z"  /></svg></div>
            <div class="text-test-left"><i>#ermo</i></div>
            <div class="test-left-vertical"><svg style="width: 1em; height: 1em;vertical-align: middle;fill: currentColor;overflow: hidden;" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg"><path d="M531.185456 943.532317c0 8.899694-6.493901 16.114003-14.503319 16.114003l-9.364275 0c-8.010441 0-14.504342-7.214309-14.504342-16.114003L492.81352 80.46666c0-8.898671 6.493901-16.114003 14.504342-16.114003l9.364275 0c8.009418 0 14.503319 7.215332 14.503319 16.114003L531.185456 943.532317z"  /></svg></div>
            <div class="text-test-left"><i>webtick</i></div>
         </div>
      {% elif post['post_type'] == 'video' %}
         <div class="p-text">{{ post_text }}</div>
         <div class="p-vid-cnt">
            <video class="p-vid" src="http://{{ _ipaddr }}:8000/video?uuid={{ post['uid'] }}&filename={{ post['post_vid'] }}&type=post"></video>
         </div>
      {% else %}
           <img id="p-pic" onload="onImgLoad(this, this.getAttribute('data-src'))" onclick="iurl('imgpreview', {pid: this.getAttribute('data-pid') })" data-pid="{{ post['post_id'] }}" src='assets/imgthumb.gif' data-src="http://{{ _ipaddr }}:8000/image?uuid={{ post['uid'] }}&ppic={{ post['post_pic'] }}&ptp=post" class="p-pic preview">
      {% endif %}
      <div class="bottom-pst-ics clear">
         <div class="post-bottom-container">
            <input type="text" placeholder="Add a comment" onclick="iurl('viewpost', {pid: this.getAttribute('data-pid') })" data-pid="{{ post['post_id'] }}" class="comment-ipt" readonly>
            <div class="items-ge-cover onclick-blue" onclick="addlike(this, this.getAttribute('data-pid'))" data-pid="{{ post['post_id'] }}"><i class="like-icon far fa-thumbs-o-up"></i> <span class="likes-count">{{ likes|length }}</span> &triangledown;</div>
            {% if comments|length > 0 %}
               <div class="ics-bottom-item-ge onclick-blue"><i class="comments-icon fa fa-comments-o"></i> {{ comments|length }}</div>
            {% endif %}
            {% if forwards|length > 0 %}
               <div class="ics-bottom-item-ge onclick-blue" onclick="sharePost(this, this.getAttribute('data-pid'))" data-pid="{{ post['post_id'] }}"><i class="share-icon fa fa-share"></i> {{ forwards|length }}</div>
            {% endif %}
         </div>
      </div>
   </div>
</div>
{% endfor %}
<div class="recommended-content">
   <div class="section-title">Suggested for you</div>
   <div class="suggested-users-inline mt-8">
      {% for fn in f %}
      <div class='suggested-users-inline-cnt-inl'>
         <div class='suggested-users-inline-container'>

            <div class="avatar">
               {% if fn['profile'] == 'df' %}
                 <img src='assets/default.jpg'>
               {% else %}
                <img src="http://{{ _ipaddr }}:8000/image?uuid={{ fn['id'] }}&ppic={{ fn['profile'] }}&ptp=profile">
               {% endif %}
            </div>
            {% set uname = fn['firstname'] + " " + fn['lastname'] %}
            <div class="suggested-users-inline-uname">{{ _trim(uname, 7) | replace("_", ".") | replace("@", "") }}</div>
            <span class="suggested-bottom-count"><i class="fa fa-users"></i></i> {{ _rand(3, "digits") }}</span>
            <div class="suggested-users-follow-button mt-6">Follow</div>
         </div>
      </div>
      {% endfor %}
   </div>
</div>
<div class="c230"><i class="loader_dot">•</i><i class="loader_dot">•</i><i class="loader_dot">•</i></div>

