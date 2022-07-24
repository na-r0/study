# [문제]
# 자연수를 원소로 갖는 공집합이 아닌 두 집합 A와 B가 있다. 이때, 두 집합의 대칭 차집합의 원소의 개수를 출력하는 프로그램을 작성하시오.
# 두 집합 A와 B가 있을 때, (A-B)와 (B-A)의 합집합을 A와 B의 대칭 차집합이라고 한다.
# 예를 들어, A={1,2,4} 이고, B={2,3,4,5,6} 라고 할 때,  A-B={1} 이고, B-A={3,5,6} 이므로, 대칭 차집합의 원소의 개수는 1+3=4개이다.

# [입력]
# 첫째 줄에 집합 A의 원소의 개수와 집합 B의 원소의 개수가 빈 칸을 사이에 두고 주어진다.
# 둘째 줄에는 집합 A의 모든 원소가, 셋째 줄에는 집합 B의 모든 원소가 빈 칸을 사이에 두고 각각 주어진다.
# 각 집합의 원소의 개수는 200,000을 넘지 않으며, 모든 원소의 값은 100,000,000을 넘지 않는다.

# [출력]
# 첫째 줄에 대칭 차집합의 원소의 개수를 출력한다.

def num_input():
    num=input('개수 입력: ')
    num=num.split(' ')
    if len(num)==2:
        setA_num=int(num[0])  # A 집합 원소 개수
        setB_num=int(num[1])  # B 집합 원소 개수
        set_num(setA_num,setB_num)
    else:
        print('잘못 입력하셨습니다.') # 개수 잘못 입력했을 때
        num_input()

def set_num(setA_num,setB_num):
    setA=[] # A 집합
    setB=[] # B 집합
    while True:
        if setA_num<200000 and setB_num<200000: # 각 집합의 원소의 개수는 200,000이 안 넘을 때
            elementA=input('A 집합 원소 입력: ')
            elementA=elementA.split(' ')
            elementB=input('B 집합 원소 입력: ')
            elementB=elementB.split(' ')

            for element1, element2 in zip(elementA, elementB):
                if int(element1) > 100000000 or int(element2) > 100000000: # 한 집합이라도 원소의 값이 100,000,000이 넘으면
                    print('원소의 값이 100,000,000을 넘었습니다. 다시 입력해 주세요.')
                    set_num(setA_num,setB_num) # 재귀함수
                else:
                    if len(elementA)==setA_num and len(elementB)==setB_num: # 넣은 원소 개수랑 처음에 입력한 개수가 같으면
                        for element1, element2 in zip(elementA, elementB):
                            setA.append(int(element1))
                            setB.append(int(element2))
                        differntsetAB(setA, setB)
                        quit()
                    else:
                        print('입력된 원소 개수와 다릅니다. 다시 입력해 주세요.')
                        set_num(setA_num,setB_num) # 재귀함수
        else:
            print('원소의 개수가 200,000을 넘었습니다. 다시 입력해 주세요.')
            num_input()

def differntsetAB(setA,setB):
    differntsetAB=set(setA+setB) # set으로 중복 제거
    print(len(differntsetAB))

num_input()
