#!/usr/bin/env python3
"""get_page function using the requests module to fetch the
content of a URL and cache it using a decorator.
"""
import requests
import time
import redis
from functools import lru_cache

# Initialize a Redis client
redis_client = redis.Redis(host='localhost', port=6379, db=0)

# Define a decorator to cache the result with a 10-second expiration time
def cache_result(expiration=10):
    def decorator(func):
        def wrapper(url):
            # Check if the result is already cached in Redis
            cached_data = redis_client.get(url)
            if cached_data:
                return cached_data.decode('utf-8')

            # If not cached, fetch the data and cache it in Redis
            data = func(url)
            redis_client.setex(url, expiration, data)
            return data

        return wrapper

    return decorator

# Apply the cache_result decorator to the get_page function
@cache_result()
def get_page(url):
    response = requests.get(url)
    if response.status_code == 200:
        return response.text
    else:
        return f"Failed to fetch page from {url}"

if __name__ == "__main__":
    # Test the get_page function
    url = "http://slowwly.robertomurray.co.uk"
    content = get_page(url)
    print(content)
