<?php
 header('Access-Control-Allow-Origin: *');
?>
<!DOCTYPE html>
<html>
<head>
  <?php $host = "http://local.st.chtw.pe/"; ?>
  <meta charset="utf-8">
  <link rel="stylesheet" href="<?php echo $host;?>css/style.css" />

  <title><?php echo $host;?></title>
  <style>body { font-family: sans-serif; }</style>

  <script src="<?php echo $host;?>js/bower_components/requirejs/require.js"></script>
  <script>
  // Configure the AMD module loader
  requirejs.config({
    // The path where your JavaScripts are located
    baseUrl: '<?php echo $host?>js/',
    // Specify the paths of vendor libraries
    paths: {
      jquery: 'bower_components/jquery/jquery',
      underscore: 'bower_components/lodash/lodash',
      backbone: 'bower_components/backbone/backbone',
      handlebars: 'bower_components/handlebars/handlebars',
      hbs: 'bower_components/hbs/hbs',
      i18nprecompile: 'bower_components/i18nprecompile/i18nprecompile',
      json2: 'bower_components/json2/json2',
      text: 'bower_components/requirejs-text/text',
      chaplin: 'bower_components/chaplin/chaplin'
    },
    // Underscore and Backbone are not AMD-capable per default,
    // so we need to use the AMD wrapping of RequireJS
    shim: {
      underscore: {
        exports: '_'
      },
      backbone: {
        deps: ['underscore', 'jquery'],
        exports: 'Backbone'
      },
      handlebars: {
        exports: 'Handlebars'
      }
    },
    config: {
        text: {
          useXhr: function (url, protocol, hostname, port) {
            // allow cross-domain requests
            // remote server allows CORS
            return true;
          }
        }
   }
    // For easier development, disable browser caching
    // Of course, this should be removed in a production environment
    //, urlArgs: 'bust=' +  (new Date()).getTime()
  });

  // Bootstrap the application
  require(['application', 'routes'], function(Application, routes) {
    new Application({routes: routes, controllerSuffix: '-controller'});
  });

  </script>
</head>
<body></body>
</html>
