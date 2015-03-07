var browserSync = require('browser-sync'),
    gulp = require('gulp');

gulp.task('browser-sync', function () {
   var files = [
     // 'templates/**/*',
      'assets/sass/**/*.scss',
      'assets/images/**/*',
      'assets/js/**/*.js'
   ];

   browserSync({
        proxy: "blackberry.jam",
    });

   // browserSync.init(files, {
   //    server: {
   //       baseDir: './build/'
   //    }
   // });
});