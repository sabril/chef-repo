# DESCRIPTION:

Installs Redis from source and setup the Upstart configuration to monitor Redis.
Redis is an open source, advanced key-value store.

It is often referred to as a data structure server since keys can contain strings, hashes, lists, sets and sorted sets.

Details http://redis.io/

# REQUIREMENTS:

None

# ATTRIBUTES: 

    default[:redis][:dir]       = "/etc/redis"
    default[:redis][:data_dir]  = "/var/lib/redis"
    default[:redis][:log_dir]   = "/var/log/redis"

    # one of: debug, verbose, notice, warning
    default[:redis][:loglevel]  = "notice"
    default[:redis][:user]      = "redis"
    default[:redis][:port]      = 6379
    default[:redis][:bind]      = "127.0.0.1"

# USAGE:

* Add recipe `milli-redis`

