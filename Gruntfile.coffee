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
    qunit:
      files: ['test/**/*.html']
    jshint:
      files: ['Gruntfile.js', 'src/**/*.js', 'test/**/*.js']
      options:
        globals:
          jQuery: true
          console: true
          module: true
          document: true
    watch:
      files: ['<%= jshint.files %>']
      tasks: ['jshint', 'jasmine']
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-qunit'

  grunt.registerTask 'test', ['jshint', 'qunit']

  grunt.registerTask 'default', ['jshint', 'qunit', 'concat', 'uglify']
