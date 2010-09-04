# Welcome to Secret Video

This is a Rails 3 application that demonstrates how to deliver video to a web browser
over HTTP in a secure fashion.

It demonstrates with a series of git branches each step from taking the simplest, insecure method to the 
most complex secure one.

1. Video delivered from /videos/public directory on the host 
2. Video delivered from /videos/public using send_file in the controller
3. Video delivered from a remote url from inside  rails controller  
   The url remains hidden

4. Video delivered from a query string authenticated Amazon S3 bucket from a rails controller
   The url remains hidden and is timed out by Amazon
5. Video delivered from a query string authenticated Amazon S3 bucket from inside a rails controller
over a ssl connection
6. Video delivered from a query string authenticated Amazon S3 bucket from inside a rails controller
over a ssl connection after a user login.
7. Performance, speed and memory analysis of the various methods.

