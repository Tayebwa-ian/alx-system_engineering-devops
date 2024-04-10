#!/usr/bin/python3
"""
Use the reddit api to query and make analysis
"""
from requests import get

def number_of_subscribers(subreddit) -> int:
    """
    Find the number of subscribers for a given subreddit
    Arg:
        subreddit: a subreddit to use
    Return: the number of subscribers or 0 if subreddit is invalid
    """
    headers = {"user_agent": "tayebwa"}
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    req = get(url, headers=headers, allow_redirects=False)
    if req.status_code == 200:
        subcribers = req.json().get("data").get("subscribers")
        return subcribers
    else:
        return 0
