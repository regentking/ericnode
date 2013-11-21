module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
  grunt.registerTask 'default', 'Try logging', ->
    grunt.log.write('Foo bar baz test')
