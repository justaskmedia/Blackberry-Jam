var sass = require('gulp-sass'),
	prefix = require('gulp-autoprefixer'),
  browserSync = require('browser-sync'),
	gulp = require('gulp');


var optionsAutoprefixer = {
  map: true,
  from: 'asset',
  to: 'assets/.min.css'
};


gulp.task('sass', function () {
    gulp.src('assets/sass/**/*.scss')
        .pipe(sass())
        .pipe(prefix('last 2 version', 'ie 8', 'ie 9', optionsAutoprefixer))
        .pipe(gulp.dest('build/assets/css/'))
        .pipe(browserSync.reload({stream:true}));
});