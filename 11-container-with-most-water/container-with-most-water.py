class Solution:
    def maxArea(self, height: List[int]) -> int:
        l = 0
        m = 0
        r = len(height)-1
        if height[l]==max(height) and height[r]==max(height):
            return (r-l)*height[l]
        while(l<r):
            width = (r - l)
            length = min(height[r], height[l])
            if width * length > m:
                m = width * length
            if length == height[r]:
                r = r-1
            elif length == height[l]:
                l = l+1
        return m