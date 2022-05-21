var gulp = require('gulp'),
    sass = require('gulp-sass')(require('sass'))
    csso = require("gulp-csso")
    rename = require("gulp-rename");

gulp.task('min', function (done) {
    gulp.src('assets/scss/style.scss')
        .pipe(sass().on('error', sass.logError))
        .pipe(csso())
        .pipe(rename({
            suffix: ".min"
        }))
        .pipe(gulp.dest('wwwroot/assets/css'));
    done();
});

gulp.task("serve", gulp.parallel(["min"]));
gulp.task("default", gulp.series("serve"));
