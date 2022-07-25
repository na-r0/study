
# 포인트 보기 -> 휴대폰번호에 대응되는 포인트 합쳐서 가져오기
# 함수명: point_use
# 파라미터: 휴대폰 번호
# 리턴값: total (포인트 합)
import os, os.path
from menu import *

IFM_PATH='./pointInfo/'

def initApp():#디렉토리 초기화 함수
    if not os.path.exists(IFM_PATH): os.mkdir(IFM_PATH)

def pointAdd(pp):#사람마다 번호 입력 후 포인트 적립 파일 생성
    initApp()
    phone=input('휴대폰 번호 숫자 11자리를 입력하세요 (하이픈 제외): ')
    filename=phone

    if check_num(phone)==True:
        if point_use(phone)==None:
            with open(IFM_PATH+filename,mode='w',encoding='utf-8') as f:
                f.write(str(pp))
            print('\n회원 등록이 완료되었습니다.')
            print(f'주문이 완료되었습니다.\n적립한 포인트는 {pp}원, 총 적립된 포인트는 {pp}입니다.')
        else:
            point=int(point_use(phone))+int(pp)
            with open(IFM_PATH + filename, mode='w', encoding='utf-8') as f:
                f.write(str(point))
            print('\n머먹조 카페 회원입니다.')
            print(f'주문이 완료되었습니다.\n적립한 포인트는 {pp}원, 총 적립된 포인트는 {point}입니다.')
        return 1
    else:
        print('번호를 잘못 입력하셨습니다. 다시 선택해 주세요.')
        menu_3()#적립 종료
        select=input('번호 선택: ')
        if select=='A':#다시 입력해서 적립하고 싶으면
            pointAdd(pp)
        elif select=='B':
            print('포인트를 적립하지 않습니다.')
            return 0
        else:
            print('잘못된 접근입니다.')
            menu_3()

def check_num(string):# 휴대폰번호가 맞는지 검증
    check=1
    for i in string:
        if i in ['0','1','2','3','4','5','6','7','8','9']:
            pass
        else:
            check=0
    if check==1 and len(string)==11:
        return True
    else:
        return False

def checkFile(string):#회원 정보가 파일에 있는지 확인(위에 체크넘 함수가 중복돼서 분리해서 만듦)
    dataList=os.listdir(IFM_PATH)
    if string in dataList:#정보가 있을 때
        return True
    else:
        return False

# 포인트 보기 -> 휴대폰번호에 대응되는 포인트 합쳐서 가져오기
# 함수명: point_use
# 파라미터: 휴대폰 번호
# 리턴값: total (포인트 합)
def point_use(phone):
    total=0
    if checkFile(phone)==True:
        filename=phone
        for member in os.listdir(IFM_PATH):
            if filename==member:
                with open(IFM_PATH+member,mode='r',encoding='utf-8') as f:
                    return int(f.read())
    else:
        print("등록되지 않은 회원정보입니다.")

def overlapNum(some_list):
    some_list.sort()
    B=[]
    for i in some_list:
        x=some_list.count(i)
        if x!=0:
            some_list=some_list[x:]
            B.append([i,x])
    return B