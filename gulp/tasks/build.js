var gulp = require('gulp');

gulp.task('build', ['jsmin', 'sass', 'copy', 'browser-sync', 'images']);