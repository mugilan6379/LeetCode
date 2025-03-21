class Solution:
    def decodeMessage(self, key: str, message: str) -> str:
        const = 'abcdefghijklmnopqrstuvwxyz'
        #key = "".join(sorted(set(key), key=key.index))
        dict ={}
        k=0
        res=''
        for i in range(len(key)):
            if key[i] not in dict.keys() and key[i]!=' ':
                dict[key[i]] = const[k]
                k +=1
        
        for i in range(len(message)):
            if message[i] == ' ':
                res = res+' '
            else: res = res+ dict[message[i]]
        return res