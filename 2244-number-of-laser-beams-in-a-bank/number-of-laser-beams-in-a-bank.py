class Solution:
    def numberOfBeams(self, bank: List[str]) -> int:
        sum = 0
        res = []
        for i in range(len(bank)):
            t = bank[i].count('1')
            if t != 0:
                res.append(bank[i].count('1'))
        for i in range(len(res)-1):
            sum = sum + res[i]*res[i+1]
        return sum