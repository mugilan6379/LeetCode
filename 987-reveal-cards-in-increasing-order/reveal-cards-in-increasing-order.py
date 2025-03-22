from collections import deque

class Solution:
    def deckRevealedIncreasing(self, deck: List[int]) -> List[int]:
        n = len(deck)
        res = deque()
        deck = sorted(deck,reverse=True)
        for card in deck:
            if res:
                res.appendleft(res.pop())
            res.appendleft(card)
        return list(res)