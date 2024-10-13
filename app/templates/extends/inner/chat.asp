#templates/index.html

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Tornado Chat Demo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  </head>
  <body>
    <div id="body">
      <div id="inbox">
        {% for message in messages %}
          {% include "message.html" %}
        {% end %}
      </div>
      <div id="input">
        <form action="/a/message/new" method="post" id="messageform">
          <table>
            <tr>
              <td><input type="text" name="body" id="message" style="width:500px"></td>
              <td style="padding-left:5px">
                <input type="submit" value="">
                <input type="hidden" name="next" value="{{ request.path }}">
                {% module xsrf_form_html() %}
              </td>
            </tr>
          </table>
        </form>
      </div>
    </div>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js" type="text/javascript"></script>
    <script src="{{ static_url("chat.js") }}" type="text/javascript"></script>
  </body>
</html>