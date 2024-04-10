#!/usr/bin/python3
"""
Use the reddit api to query and make analysis
"""
import requests


def top_ten(subreddit):
    """
    Find the number of subscribers for a given subreddit
    Arg:
        subreddit: a subreddit to use
    Return: the number of subscribers or 0 if subreddit is invalid
    """
    headers = {"user_agent": "tayebwa"}
    params = {"limit": 10}
    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    req = requests.get(url, headers=headers, allow_redirects=False,
                       params=params)
    print(req.status_code)
    if req.status_code == 200:
        data = req.json().get("data").get("children")
        for article in data:
            print(article.get("data").get("title"))
    else:
        print("None")
