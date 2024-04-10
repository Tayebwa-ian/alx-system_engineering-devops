#!/usr/bin/python3
"""
Use the reddit api to query and make analysis
"""
import requests


def number_of_subscribers(subreddit) -> int:
    """
    Find the number of subscribers for a given subreddit
    Arg:
        subreddit: a subreddit to use
    Return: the number of subscribers or 0 if subreddit is invalid
    """
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    req = requests.get(url)
    if req.status_code == 200:
        subcribers = req.json().get("data").get("subscribers")
        return subcribers
    else:
        return 0
