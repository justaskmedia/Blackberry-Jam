var gulp       = require('gulp');
var mainBowerFiles = require('main-bower-files');
var uglifycss = require('gulp-uglifycss');
var concat = require('gulp-concat');
var filter = require('gulp-filter');
var order = require("gulp-order");
var clean = require("gulp-clean");

gulp.task('build-css', ['clean-scripts'], function() {
    var cssFiles = ['./build/assets/css/*'];
    var dest = './build/assets/';
    var bowerFiles = mainBowerFiles({
        paths: {
            bowerDirectory: 'bower_components/'
        }
    });
    console.log('bower files: ', bowerFiles);

    gulp.src(mainBowerFiles().concat(cssFiles))
        .pipe(filter('*.css'))
        .pipe(order([
            'normalize.css',
            'bootstrap',
            '*'
        ]))
        .pipe(concat('main.min.css'))
        .pipe(uglifycss())
        .pipe(gulp.dest(dest + 'css'));
});

gulp.task('clean-scripts', function () {
    var dest = './build/assets/css/';
    console.log(dest + 'main.min.css')
      return gulp.src(dest + 'main.min.css', {read: false})
        .pipe(clean());
});