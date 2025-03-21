class Solution:
    def decodeMessage(self, key: str, message: str) -> str:
        key = key.replace(' ','')
        const = 'abcdefghijklmnopqrstuvwxyz'
        key = "".join(sorted(set(key), key=key.index))
        print(key)
        dict ={}
        res=''
        for i in range(len(const)):
            if key[i] not in dict.keys():
                dict[key[i]] = const[i]
        print(dict)
        
        for i in range(len(message)):
            if message[i] == ' ':
                res = res+' '
            else: res = res+ dict[message[i]]
        return res