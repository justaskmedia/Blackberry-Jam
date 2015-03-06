var gulp = require('gulp');

gulp.task('default', ['build'], function() {
	gulp.watch("templates/**/*", ['copy']);
	gulp.watch("assets/sass/**/*", ['sass', 'build-css']);
	gulp.watch("assets/js/**/*", ['jsmin']);
	gulp.watch("assets/images/**/*", ['images']);
});