module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    devserver:
      server:
        options:
          port: 8080
          cache: 'no-cache'

    watch:
      coffee:
        files: ['scripts/*.coffee', 'layouts/*.jade']
        tasks: ['coffee:build', 'jade:build', 'concat:build', 'notify:build']

    notify:
      build:
        options:
          title: 'Woohoo!'
          message: 'Scripts compiled successfully'

    coffee:
      build:
        options:
          bare: true
        files:
          'tmp/coffee.js': ['scripts/*.coffee']

    concat:
      build:
        src: ['vendor/js/jquery-2.1.0.min.js',
              'vendor/js/bootstrap.min.js',
              'vendor/js/jquery.scrollTo-1.4.3.1-min.js',
              'vendor/js/jquery.localscroll-1.2.7-min.js',
              'vendor/js/jquery.easing.min.js',
              'vendor/js/supersized.3.2.7.min.js',
              'vendor/js/supersized.shutter.min.js',
              'vendor/js/jquery.parallax-1.1.3.js',
              'vendor/js/imagesloaded.pkgd.js',
              'vendor/js/jquery.isotope.js',
              'vendor/js/wow.js',
              'vendor/js/jpreloader.js',
              'vendor/js/parsley.min.js',
              'vendor/js/jquery.easypiechart.min.js',
              'vendor/js/waypoints.min.js',
              'vendor/js/jquery.magnific-popup.min.js',
              'vendor/js/loop.js',
              'tmp/coffee.js']
        dest: 'all.js'

    uglify:
      build:
        files:
          'all.min.js': ['all.js']

    jade:
      build:
        options:
          i18n:
            locales: 'config/locales/*.yml'
            namespace: 'i18n'
          pretty: false
        files:
          'index.html': 'layouts/*.jade'

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-notify'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-devserver'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-uglify'

  grunt.registerTask 'default',           ['build']
  grunt.registerTask 'build',             ['coffee:build', 'jade:build', 'concat:build', 'uglify:build', 'notify:build', 'watch']
