## Сomparing the approaches of Postgres and Mongo
- PostgreSQL version is 10
- Mongodb version is 4.0.3
- Records amount is 2 000 000.


### Benchmark testing
For benchmarking testing was using Apache HTTP server benchmarking tool(ab).

#### 1. SQL

| Info |  | 
| - |:-:| 
| Concurrency Level | 1 |
| Time taken for tests | 97.924 seconds |
| Complete requests | 50 |
| Failed requests | 0 |
| Total transferred | 548350 bytes |
| HTML transferred | 512250 bytes |
| Requests per second | 0.51 [#/sec] (mean) |
| Time per request | 1958.484 [ms] (mean) |
| Time per request | 1958.484 [ms] (mean, across all concurrent requests) |
| Transfer rate | 5.47 [Kbytes/sec] received |

|Connection Times (ms) | min | mean[+/-sd]|median|max|
| -|:-:| :-:| :-:| :-:| 
| Connect | 0 | 0 | 0.7 | 0 | 5 |
| Processing | 1615 | 1958 | 409.5 | 1779 | 3470 |
| Waiting | 1615 | 1958 | 409.4 | 1779 | 3469 |
| Total | 1615 | 1958 | 409.7 | 1779 | 3470 |

| Percentage of the requests served within a certain time (ms)|| 
| - |:-:| 
|  50% | 1779 |
|  66% | 2006 |
|  75% | 2203 |
|  80% | 2315 |
|  90% | 2473 |
|  95% | 2898 |
|  98% | 3470 |
|  99% | 3470 |
| 100% | 3470 (longest request) |

#### 2. Materialized view
| Info |  | 
| - |:-:| 
| Concurrency Level| 1 |
| Time taken for tests| 56.721 seconds |
| Complete requests| 50 |
| Failed requests| 0 |
| Total transferred| 545850 bytes |
| HTML transferred| 509750 bytes |
| Requests per second| 0.88 [#/sec] (mean) |
| Time per request| 1134.415 [ms] (mean) |
| Time per request| 1134.415 [ms] (mean, across all concurrent requests) |
| Transfer rate| 9.40 [Kbytes/sec] received |

|Connection Times (ms) | min | mean[+/-sd] | median | max |
| -|:-:| :-:| :-:| :-:| 
| Connect | 0 | 0 | 0.0 | 0 | 0 |
| Processing | 985 | 1134 | 188.6 | 1091 | 2228 |
| Waiting | 984 | 1134 | 188.6 | 1091 | 2227 |
| Total | 985 | 1134 | 188.6 | 1091 | 2228 |


| Percentage of the requests served within a certain time (ms)|| 
| - |:-:| 
|  50% | 1091 |
|  66% | 1134 |
|  75% | 1173 |
|  80% | 1210 |
|  90% | 1357 |
|  95% | 1374 |
|  98% | 2228 |
|  99% | 2228 |
| 100% | 2228 (longest request) |

 #### 3. Mongo: Aggregation Framework
 
| Info |  | 
| - |:-:| 
| Concurrency Level | 1 |
| Time taken for tests | 161.855 seconds |
| Complete requests | 50 |
| Failed requests | 0 |
| Total transferred | 548350 bytes |
| HTML transferred | 512250 bytes |
| Requests per second | 0.31 [#/sec] (mean) |
| Time per request | 3237.104 [ms] (mean) |
| Time per request | 3237.104 [ms] (mean, across all concurrent requests) |
| Transfer rate | 3.31 [Kbytes/sec] received |

|Connection Times (ms) | min | mean[+/-sd] | median | max |
| -|:-:| :-:| :-:| :-:| 
| Connect  | 0 | 0 | 0.0 | 0 | 0 |
| Processing  | 2728 | 3237 | 490.4 | 3093 | 5445 |
| Waiting  | 2728 | 3237 | 490.4 | 3093 | 5445 |
| Total  | 2728 | 3237 | 490.4 | 3093 | 5445 |

| Percentage of the requests served within a certain time (ms)|| 
| - |:-:| 
|  50% | 3093 |
|  66% | 3225 |
|  75% | 3439 |
|  80% | 3674 |
|  90% | 3878 |
|  95% | 3910 |
|  98% | 5445 |
|  99% | 5445 |
| 100% | 5445 (longest request) |

#### 4. Mongo: MapReduce 
| Info |  | 
| - |:-:| 
| Concurrency Level | 1 |
| Time taken for tests | 682.079 seconds |
| Complete requests | 50 |
| Failed requests | 0 |
| Total transferred | 548400 bytes |
| HTML transferred | 512250 bytes |
| Requests per second | 0.07 [#/sec] (mean) |
| Time per request | 13641.582 [ms] (mean) |
| Time per request | 13641.582 [ms] (mean, across all concurrent requests) |
| Transfer rate | 0.79 [Kbytes/sec] received |

|Connection Times (ms) | min | mean[+/-sd] | median | max |
| -|:-:| :-:| :-:| :-:| 
| Connect | 0 | 0 | 0.0 | 0 | 0 |
| Processing | 12000 | 13641 | 1088.1 | 13569 | 16598 |
| Waiting | 12000 | 13641 | 1088.1 | 13569 | 16598 |
| Total | 12000 | 13642 | 1088.1 | 13569 | 16598 |

| Percentage of the requests served within a certain time (ms)|| 
| - |:-:|
| 50 | 13569 |
| 66 | 14030 |
| 75 | 14375 |
| 80 | 14703 |
| 90 | 15303 |
| 95 | 15420 |
| 98 | 16598 |
| 99 | 16598 |

