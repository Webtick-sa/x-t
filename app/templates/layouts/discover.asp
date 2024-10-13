{% block content %}
    {% set profile = conn.execute("SELECT profile FROM users WHERE id=='{}'".format(id)).fetchone()['profile'] %}
     <div class="pg-n">Discover</div>
   <div class='nav-b mb-6'>
      <div class='tag' id='active'>
         <div class='fa fa-line-chart'></div><span> Trending</span>
      </div>
      <div class='tag'>
         <div id='gtag' class='fa fa-play'></div><span> Reels</span>
      </div>
   </div>
    <div class='mb-20'></div>
    <div class="cc2nt" id="c140">
      <div class="c230"><i class="loader_dot">•</i><i class="loader_dot">•</i><i class="loader_dot">•</i></div>
    </div>
  <div class="posts" id="posts">
  </div>
{% endblock %}