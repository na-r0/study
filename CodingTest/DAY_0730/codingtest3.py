# [문제] 행맨 게임
# 리스트에 3개 이상의 단어 임의로 추가
# 위 리스트에서 랜덤으로 1개의 단어 선택 후 단어의 길이에 맞게 밑줄 출력
# ex) dream의 경우 _ _ _ _ _
# 사용자로부터 한글자씩 입력받아, 단어에 입력한 값이 포함되면 'Correct', 없으면 'Wrong' 출력
# 매번 입력을 받을 때마다 현재까지 맞힌 글자들 표시(못 맞힌 자리는 _ 표시)
# 정답을 맞히면 Success 출력 후 프로그램 종료 (단, 틀린 횟수가 10번 초과시 실패로 간주)

import random

word_list=['draem','mark','injun','jeno','haechan','jaemin','jisung','chenle']
word=random.choices(word_list)[0]
check=[]
hangman=10

print('answer: {}\n'.format(word))

for i in range(len(word)):
    check.append('_')
    print('_','',end='')

while True:
    print()
    char=input('Input letter > ')
    for j in range(len(word)):
        if char==word[j]:
            if char not in check: print('Correct\n')
            check[j]=char
    if char not in word:
        hangman-=1
        print('Wrong\n')
    for count in check: print(count,'',end='')
    if '_' not in check:
        print('\nSuccess!')
        break
    elif hangman==0:
        print('\nFail!')
        break