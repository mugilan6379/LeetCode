class Solution:
    def wateringPlants(self, plants: List[int], capacity: int) -> int:
        steps = 0 
        temp = capacity
        for i in range(len(plants)):
            if temp - plants[i] >= 0:
                temp = temp - plants[i]
                steps = steps + 1
            else: 
                steps = steps + i
                temp = capacity
                temp = temp - plants[i]
                steps = steps + i+1
        return steps

