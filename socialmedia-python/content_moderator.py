# Content Moderator Script
# Scans posts, replaces banned words with asterisks, and extracts web links

import re
from typing import List, Tuple

def moderate_content(posts: List[str], banned_words: List[str]) -> Tuple[List[str], List[str]]:
    """
    Scans posts, replaces banned words with asterisks, and extracts web links.
    Returns a tuple: (moderated_posts, all_links)
    """
    # Compile regex for banned words (case-insensitive, word boundaries)
    banned_pattern = re.compile(r"\\b(" + "|".join(map(re.escape, banned_words)) + r")\\b", re.IGNORECASE)
    # Regex for URLs
    url_pattern = re.compile(r"https?://[\w\-\.\?&=/%#]+", re.IGNORECASE)

    moderated_posts = []
    all_links = []

    for post in posts:
        # Replace banned words
        moderated = banned_pattern.sub("***", post)
        moderated_posts.append(moderated)
        # Extract links
        links = url_pattern.findall(post)
        all_links.extend(links)

    return moderated_posts, all_links

if __name__ == "__main__":
    # Example usage
    posts = [
        "Check out this site: https://example.com. BadWord here!",
        "Another post with a bannedword and a link: http://test.com/page?x=1",
        "Clean post."
    ]
    banned_words = ["badword", "bannedword"]
    moderated, links = moderate_content(posts, banned_words)
    print("Moderated Posts:")
    for p in moderated:
        print(p)
    print("\nExtracted Links:")
    for l in links:
        print(l)
