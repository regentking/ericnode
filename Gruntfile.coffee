module.exports = (grunt) ->
  grunt.registerTask 'default', 'Try logging', ->
    grunt.log.write('Foo bar baz test')
    