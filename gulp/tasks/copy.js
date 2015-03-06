var gulp = require("gulp"),
  	browserSync = require('browser-sync')
	fileinclude = require('gulp-file-include');


gulp.task('copy', function() {
	return gulp.src('templates/*.html')
		 .pipe(fileinclude({
	      prefix: '@@',
	      basepath: '@file'
	    }))
		.pipe(gulp.dest('build'))
        .pipe(browserSync.reload({stream:true}));
});
