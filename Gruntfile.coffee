# Create a new configuartion file that grunt can consume
modules.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    concat: 
      options: seperator: ';'
      dist: src: ['src/**/*.js'], dest: 'dist/<%= package.name %>.js'   
    uglify:
      options:
        banner: '/*! <%= pkg.name %> <%grunt.template.today'
        dist: files: 'dist/<%= pkg.name %>.min.js': ['<%= concat.dist.dest %>']
    jasmine: files: ['test/**/*.html']
    jshint:
      files: ['Gruntfile.js', 'src/**/*.js', 'test/**/*.js']
      options: # options here to override JSHint defaults
        globals:
          jQuery: true
          console: true
          window: true
          module: true
          document: true
    watch:
      files: ['<% jshint.files %>']
      tasks: ['jshint', 'jasmine']

  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-contrib-jasmine'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.laodNpmTasks 'grunt-contrib-concat'

  grunt.registerTask 'test', ['jshint', 'jasmine']

  grunt.registerTask 'default', ['jshint', 'jasmine', 'concat', 'uglify']
