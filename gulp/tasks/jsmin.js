var gulp       = require('gulp');
var mainBowerFiles = require('main-bower-files');
var uglify = require('gulp-uglify');
var concat = require('gulp-concat');
var filter = require('gulp-filter');

gulp.task('jsmin', function() {
	var jsFiles = ['./assets/js/*'];
	var dest = './build/assets/';

	gulp.src(mainBowerFiles().concat(jsFiles))
		.pipe(filter('*.js'))
		.pipe(concat('main.js'))
		.pipe(uglify())
		.pipe(gulp.dest(dest + 'js'));
});
