import math
class Solution:
    def checkPowersOfThree(self, n: int) -> bool:
        if n==1: return True
        digits='0123456789'
        res = ''
        while n>0:
            rem = n%3
            res = digits[rem] + res
            n = n//3
        print(str(set(res)))
        if set(res) == {'0','1'} or set(res) == {'1','0'}:
            return True
        else: 
            return False
    