#!/usr/bin/python3
"""
Use the reddit api to query and make analysis
"""
import requests


def top_ten(subreddit) -> None:
    """
    prints the titles of the first 10 hot posts listed for a given subreddit.
    Return: None
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
