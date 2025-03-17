class Solution:
    def maxCoins(self, piles: List[int]) -> int:
        piles = sorted(piles,reverse=True)
        return sum(piles[1:(2*(len(piles)//3)):2])