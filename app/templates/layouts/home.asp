{% block content %}
{% set profile = conn.execute("SELECT profile FROM users WHERE id=='{}'".format(id)).fetchone()['profile'] %}
  <div class="home-page">
    <div class="stories">
      <div class='stry-cnt-inl'>
        <div class='stry-container'>
         <div class='m-u-pic-cnt'>
          <div class="gradient-clr-bg">
            <div class="u-pic-cnt">
              {% if profile == 'df' %}
              <img class="m-u-pic" onclick="eurl('upload', this)" src="assets/default.jpg">
              {% else %}
              <img class="m-u-pic" onclick="eurl('upload', this)" src='http://{{ _ipaddr }}:8000/image?uuid={{ id }}&ppic={{ profile }}&ptp=profile'>
              {% endif %}
            </div>

          </div>
          </div>
          <div class="stry-add">Your Story</div>
        </div>
      </div>
       <div class='stry-cnt-inl'>
         <div id="strys">
           <div class='stry-cnt-inl'>
              <div class='stry-container'>
                <div class="ph-avatar avatar-big"></div>
                <div class="stry-uname"><i class="loader_dot">.</i><i class="loader_dot">.</i><i class="loader_dot">.</i></div>
              </div>
            </div>
            <div class='stry-cnt-inl'>
              <div class='stry-container'>
                <div class="ph-avatar avatar-big"></div>
                <div class="stry-uname"><i class="loader_dot">.</i><i class="loader_dot">.</i><i class="loader_dot">.</i></div>
              </div>
            </div>
            <div class='stry-cnt-inl'>
              <div class='stry-container'>
                <div class="ph-avatar avatar-big"></div>
                <div class="stry-uname"><i class="loader_dot">.</i><i class="loader_dot">.</i><i class="loader_dot">.</i></div>
              </div>
            </div>
            <div class='stry-cnt-inl'>
              <div class='stry-container'>
                <div class="ph-avatar avatar-big"></div>
                <div class="stry-uname"><i class="loader_dot">.</i><i class="loader_dot">.</i><i class="loader_dot">.</i></div>
              </div>
            </div>
            <div class='stry-cnt-inl'>
              <div class='stry-container'>
                <div class="ph-avatar avatar-big"></div>
                <div class="stry-uname"><i class="loader_dot">.</i><i class="loader_dot">.</i><i class="loader_dot">.</i></div>
              </div>
            </div>
            <div class='stry-cnt-inl'>
              <div class='stry-container'>
                <div class="ph-avatar avatar-big"></div>
                <div class="stry-uname"><i class="loader_dot">.</i><i class="loader_dot">.</i><i class="loader_dot">.</i></div>
              </div>
            </div>
            <div class='stry-cnt-inl'>
              <div class='stry-container'>
                <div class="ph-avatar avatar-big"></div>
                <div class="stry-uname"><i class="loader_dot">.</i><i class="loader_dot">.</i><i class="loader_dot">.</i></div>
              </div>
            </div>
       </div>
    </div>
    </div>
    <div class="home-search-container mt-4 mb-12">
      <div class="home-search-ics-container">
        <div class="search-ics-c">
          <div class="ai-icon"><i class="fa fa-circle-thin"></i></div>
        </div>
        <input type="search" name="search" class="home-search-input" placeholder="Search to explore">
      </div>
      <div class="icn ics-right-ge onclick-blue"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-collection-play" viewBox="0 0 16 16"><path d="M2 3a.5.5 0 0 0 .5.5h11a.5.5 0 0 0 0-1h-11A.5.5 0 0 0 2 3zm2-2a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7A.5.5 0 0 0 4 1zm2.765 5.576A.5.5 0 0 0 6 7v5a.5.5 0 0 0 .765.424l4-2.5a.5.5 0 0 0 0-.848l-4-2.5z"/><path d="M1.5 14.5A1.5 1.5 0 0 1 0 13V6a1.5 1.5 0 0 1 1.5-1.5h13A1.5 1.5 0 0 1 16 6v7a1.5 1.5 0 0 1-1.5 1.5h-13zm13-1a.5.5 0 0 0 .5-.5V6a.5.5 0 0 0-.5-.5h-13A.5.5 0 0 0 1 6v7a.5.5 0 0 0 .5.5h13z"/></svg></div>
      <div class="icn history-button fa fa-fingerprint onclick-blue"></div>
    </div>
    <div class="ics-home-inline mb-6">
      <div class="ai-search-toggle onclick-blue">
        <div class="ai-search-ic">✨</div>
        <span>Gemini</span>
      </div>
      <div class="ai-search-toggle onclick-blue">
        <div class="ai-search-ic fa fa-magnifying-glass-chart onclick-blue"></div>
        <span>Trends</span>
      </div>
    </div>
    <div class="cc2nt" id="c140">
      <div class="c230"><i class="loader_dot">•</i><i class="loader_dot">•</i><i class="loader_dot">•</i></div>
    </div>
    <div class="posts" id="posts">
    </div>
  </div>
{% endblock %}