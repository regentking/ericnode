# Create a new configuartion file that grunt can consume
modules.exports = (grunt) ->
  __Gruntfile__ = @grunt

  grunt.initalConfig
     
    pkg: grunt.file.readJSON('package.json')

  @__Gruntfile__ # prototype
