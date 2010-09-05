# Welcome to Secret Video

# A demo rails 3 app that delivers video with varying levels of secrecy 

This is a Rails 3 application that demonstrates how to deliver video to a web browser
over with varying levels of secrecy 

It demonstrates with a series of git branches each step from  a simplest, public method to a 
 complex private  one.

 1. Video delivered from /videos/public directory on the host 
    -- [[Baseline branch]]

2. Video delivered from /videos/public using send_file in the controller 
       -- [[send_file branch]]

3. Video delivered from a query string authenticated Amazon S3 bucket the url  is visible but is timed out in 5 minutes by Amazon [[s3_querystring branch]]

4. Video delivered from a remote url from inside  rails controller  The url remains hidden

5. Video delivered from a query string authenticated Amazon S3 bucket from inside a rails controller
       over a ssl connection. Source url never exposed, delivered over ssl.

6. Video delivered from a query string authenticated Amazon S3 bucket from inside a rails controller
       over a ssl connection after a user login. source url never exposed, delivered over ssl to an authenticated user.

7. Performance, speed and memory analysis of the various methods.

