module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    concat:
      options: seperator: ';'
      dist:
        src: ['src/**/*.js']
        dest: 'dist/<%= pkg.name %>.js'
    uglify:
      options: banner: '/*! <%= pkg.name %> <%= grunt.template.today("dd-mm-yyyy") %> */\n'
      dist: files: 'dist/<%= pkg.name %>.min.js': ['<%= concat.dist.dest %>']
    jasmine:
      files: ['test/**/*.html']
    jshint:
      files: ['Gruntfile.js', 'src/**/*.js', 'test/**/*.js']
      options:
        globals:
          jQuery: true
          console: true
          module: true
          document: true
  grunt.registerTask 'default', 'Try logging', ->
    grunt.log.write('Foo bar baz test')
