var gulp = require('gulp');

gulp.task('build', ['jsmin', 'sass', 'build-css', 'copy', 'browser-sync', 'images']);