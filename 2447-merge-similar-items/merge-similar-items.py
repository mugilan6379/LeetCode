class Solution:
    def mergeSimilarItems(self, items1: List[List[int]], items2: List[List[int]]) -> List[List[int]]:
        dic = {}
        res= []
        for i in range(len(items1)):
            dic[items1[i][0]] = items1[i][1]
        print(dic)
        for i in range(len(items2)):
            if items2[i][0] in dic.keys():
                dic[items2[i][0]] = dic[items2[i][0]] + items2[i][1]
            else:  
                dic[items2[i][0]] = items2[i][1]
        print(dic)
        for i,k in dic.items():
            res.append([i,k])
        return sorted(res)