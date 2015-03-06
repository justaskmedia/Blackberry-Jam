var browserSync = require('browser-sync'),
    gulp = require('gulp');

gulp.task('browser-sync', function () {
   var files = [
     // 'templates/**/*',
      'assets/dev/sass/**/*.scss',
      'assets/dev/img/**/*.png',
      'assets/dev/js/**/*.js'
   ];

   browserSync.init(files, {
      server: {
         baseDir: './build/'
      }
   });
});