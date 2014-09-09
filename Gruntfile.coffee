module.exports = (grunt) ->
	grunt.initConfig
		jade:
			options:
				pretty: yes
			compile:
				expand: yes
				cwd: './sources/'
				src: ['**/*.jade']
				dest: './distribution/development/'
				ext: '.html'
				extDot: 'last'
		stylus:
			options:
				compress: no
			compile:
				expand: yes
				cwd: './sources/'
				src: ['**/*.styl']
				dest: './distribution/development/'
				ext: '.css'
				extDot: 'last'
		coffee:
			options:
				bare: no
			compile:
				expand: yes
				cwd: './sources/'
				src: ['**/*.coffee']
				dest: './distribution/development/'
				ext: '.js'
				extDot: 'last'
		watch:
			options:
				livereload:
					port: 44444
			jade:
				files: ['./sources/**/*.jade']
				tasks: ['newer:jade']
			stylus:
				files: ['./sources/**/*.styl']
				tasks: ['newer:stylus']
			coffee:
				files: ['./sources/**/*.coffee']
				tasks: ['newer:coffee']

	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-jade'
	grunt.loadNpmTasks 'grunt-contrib-stylus'
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-newer'

	grunt.registerTask 'default', ['jade', 'stylus', 'coffee', 'watch']