so you are planning to optimize your queries, or do load testing your db or see how your memcaching has reduced the number of queries triggered to the server.

normally sql is not logged in production, and in development mode, reading sql in log file is real pain in ass.

here comes a quick hack to log your sqls in a seperate log file sql.log

which you could parse with linux/ruby log processing tools



usage

I generally need to put these in running production apps during those lean hours to get a sampling, so I did not go in plugin way

I generally get it auto required by putting it lib/ folder or config/initializers/ (on rails 2.0.x)

pop this and restart the app if in production, and logging begins, you can tail it and see what is hitting your db.

high traffic sites and social networking style apps send gazillions of sqls and can fill yours logs super fast, so have a file backup strategy.



