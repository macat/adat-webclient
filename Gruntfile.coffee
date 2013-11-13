"use strict"
LIVERELOAD_PORT = 35729
lrSnippet = require("connect-livereload")(port: LIVERELOAD_PORT)
mountFolder = (connect, dir) ->
  connect.static require("path").resolve(dir)


# # Globbing
# for performance reasons we're only matching one level down:
# 'test/spec/{,*/}*.js'
# use this if you want to match all subfolders:
# 'test/spec/**/*.js'
module.exports = (grunt) ->
  # show elapsed time at the end
  require("time-grunt") grunt
  # load all grunt tasks
  require("load-grunt-tasks") grunt
  # configurable paths
  yeomanConfig =
    app: "app"
    dist: "dist"

  grunt.initConfig
    yeoman: yeomanConfig
    watch:
      emberTemplates:
        files: "<%= yeoman.app %>/templates/**/*.hbs"
        tasks: ["emberTemplates"]

      coffee:
        files: ["<%= yeoman.app %>/{,*/}*.coffee"]
        tasks: ["coffee:dist"]

      copyjs:
        files: ["<%= yeoman.app %>/{,*/}*.js"]
        tasks: ["copy:js"]

      coffeeTest:
        files: ["test/spec/{,*/}*.coffee"]
        tasks: ["coffee:test"]

      neuter:
        files: ["tmp/scripts/{,*/}*.js", "!tmp/scripts/combined-scripts.js"]
        tasks: ["neuter"]

      livereload:
        options:
          livereload: LIVERELOAD_PORT

        files: [
          "tmp/scripts/*.js",
          "<%= yeoman.app %>/*.html",
          "{tmp,<%= yeoman.app %>}/styles/{,*/}*.css",
          "<%= yeoman.app %>/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}"]

    connect:
      options:
        port: 8000

        # change this to '0.0.0.0' to access the server from outside
        hostname: "localhost"

      livereload:
        options:
          middleware: (connect) ->
            [lrSnippet, mountFolder(connect, "tmp"), mountFolder(connect, yeomanConfig.app)]

      test:
        options:
          middleware: (connect) ->
            [mountFolder(connect, "tmp"), mountFolder(connect, "test")]

      dist:
        options:
          middleware: (connect) ->
            [mountFolder(connect, yeomanConfig.dist)]

    clean:
      dist:
        files: [
          dot: true
          src: ["tmp", "<%= yeoman.dist %>/*", "!<%= yeoman.dist %>/.git*"]
        ]

      server: "tmp"

    jshint:
      options:
        jshintrc: ".jshintrc"

      all: ["Gruntfile.js", "<%= yeoman.app %>/{,*/}*.js", "!<%= yeoman.app %>/vendor/*", "test/spec/{,*/}*.js"]

    mocha:
      all:
        options:
          run: true
          urls: ["http://localhost:<%= connect.options.port %>/index.html"]

    coffee:
      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.app %>"
          src: "{,*/}*.coffee"
          dest: "tmp/scripts"
          ext: ".js"
        ]

      test:
        files: [
          expand: true
          cwd: "test/spec"
          src: "{,*/}*.coffee"
          dest: "tmp/spec"
          ext: ".js"
        ]

    rev:
      dist:
        files:
          src: ["<%= yeoman.dist %>/scripts/{,*/}*.js", "<%= yeoman.dist %>/styles/{,*/}*.css", "<%= yeoman.dist %>/images/{,*/}*.{png,jpg,jpeg,gif,webp}", "<%= yeoman.dist %>/styles/fonts/*"]

    useminPrepare:
      html: "<%= yeoman.app %>/index.html"
      options:
        dest: "<%= yeoman.dist %>"

    usemin:
      html: ["<%= yeoman.dist %>/{,*/}*.html"]
      css: ["<%= yeoman.dist %>/styles/{,*/}*.css"]
      options:
        dirs: ["<%= yeoman.dist %>"]

    imagemin:
      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.app %>/images"
          src: "{,*/}*.{png,jpg,jpeg}"
          dest: "<%= yeoman.dist %>/images"
        ]

    svgmin:
      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.app %>/images"
          src: "{,*/}*.svg"
          dest: "<%= yeoman.dist %>/images"
        ]

    cssmin:
      dist:
        files:
          "<%= yeoman.dist %>/styles/main.css": ["tmp/styles/{,*/}*.css", "<%= yeoman.app %>/styles/{,*/}*.css"]

    htmlmin:
      dist:
        options: {}
        
        #removeCommentsFromCDATA: true,
        #                    // https://github.com/yeoman/grunt-usemin/issues/44
        #                    //collapseWhitespace: true,
        #                    collapseBooleanAttributes: true,
        #                    removeAttributeQuotes: true,
        #                    removeRedundantAttributes: true,
        #                    useShortDoctype: true,
        #                    removeEmptyAttributes: true,
        #                    removeOptionalTags: true
        files: [
          expand: true
          cwd: "<%= yeoman.app %>"
          src: "*.html"
          dest: "<%= yeoman.dist %>"
        ]

    
    # Put files not handled in other tasks here
    copy:
      dist:
        files: [
          expand: true
          dot: true
          cwd: "<%= yeoman.app %>"
          dest: "<%= yeoman.dist %>"
          src: ["*.{ico,txt}", ".htaccess", "images/{,*/}*.{webp,gif}", "styles/fonts/*"]
        ]

      js:
        files: [
          expand: true
          cwd: "<%= yeoman.app %>"
          src: "{,*/}*.js"
          dest: "tmp/scripts"
        ]
      dev:
        files: [
            cwd: "app/bower_components/font-awesome/font"
            expand: true
            src: ["*"]
            dest: "tmp/fonts/"
        ]

    less:
      dev:
        options:
          paths: ['app/styles']
          dumpLineNumbers: 'all'
        files:[
          dest: "tmp/styles/main.css"
          src: ["app/styles/main.less"]
        ]

    concurrent:
      server: ["emberTemplates", "coffee:dist"]
      test: ["emberTemplates", "coffee"]
      dist: ["emberTemplates", "coffee", "imagemin", "svgmin", "htmlmin"]


    karma:
      unit:
        configFile: "karma.conf.js"

    emberTemplates:
      options:
        templateName: (sourceFile) ->
          templatePath = "app/templates/"
          sourceFile.replace templatePath, ""

      dist:
        files:
          "tmp/scripts/compiled-templates.js": "app/templates/{,*/}*.hbs"

    neuter:
      app:
        options:
          template: "{%= src %}"
          filepathTransform: (filepath) ->
            "tmp/scripts/" + filepath

        src: ["tmp/scripts/app.js"]
        dest: "tmp/scripts/combined-scripts.js"

  grunt.registerTask "server", (target) ->
    return grunt.task.run(["build", "connect:dist:keepalive"])  if target is "dist"
    grunt.task.run ["clean:server", "copy:dev", "copy:js", "concurrent:server", "neuter:app", "connect:livereload", "watch"]

  grunt.registerTask "test", ["clean:server", "concurrent:test", "connect:test", "neuter:app", "mocha"]
  grunt.registerTask "build", ["clean:dist", "useminPrepare", "concurrent:dist", "neuter:app", "concat", "cssmin", "uglify", "copy", "rev", "usemin"]
  grunt.registerTask "default", ["jshint", "test", "build"]
