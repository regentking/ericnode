module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    concat:
      options: seperators: ';'
      dist:
        src: ['src/**/*.js', ]
        dest: 'dist/<%= package.name %>.js'
  grunt.registerTask 'default', 'Try logging', ->
    grunt.log.write('Foo bar baz test')
