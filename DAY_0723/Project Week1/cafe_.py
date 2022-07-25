
import time as t
from menu import *
from point import *

menuPrice={'1':3000,'2':3000,'3':3500,'4':3500,'5':3500,'6':5000,'7':5000,'8':4000,'9':4000,'10':4000,
           '11':3500,'12':3500,'13':3500,'14':7200,'15':5800,'16':4900,'17':9900,'18':8500,'19':7600}
menuName={'1':'에스프레소   ','2':'아메리카노   ','3':'카페라떼    ','4':'카페모카    ','5':'카푸치노    ',
          '6':'초코케이크   ','7':'치즈케이크   ','8':'타르트(에그)','9':'타르트(치즈)','10':'베이글','11':'마카롱(딸기) ','12':'마카롱(초코) ','13':'마카롱(녹차) ',
          '14':'아메+치즈    ','15':'아메+베이글  ','16':'아메+마카롱  ',
          '17':'아메2+치즈   ','18':'아메2+베이글  ','19':'아메2+마카롱 '}
#딕셔너리로 저장

def selectMenu1():#매장에서 먹을지 포장할지 선택하는 함수
    while True: #무한 루프
        menu_1()
        select=input('번호 선택: ')
        if select=='A': selectMenu2()#매장
        elif select=='B': selectMenu2()#테이크아웃
        elif select=='C': quit()#종료
        #quit() :  종료명령
        else: print('잘못 입력하셨습니다.')

def selectMenu2():#메뉴 선택해서 리스트에 저장하는 함수
    total=0
    name=[]
    price=[]
    count=[]
    data =[]
    someList = []
#-----------------------------
    menu_2()
    for key in menuPrice.keys():
        data.append(key)
    while True:
        i = 1
        select = input('주문할 메뉴 선택: ')
        if select == 'A': selectMenu1()  # 이전화면
        # selectMenu1() :  매장 or Take-Out 선택하는 함수
        elif select == 'B': quit()  # 종료
        elif select == 'C':  # 주문완료
            menu_3()  # 적립여부 메뉴 출력
            select = input('번호 선택: ')
            someList = overlapNum(someList)
            for member in someList:
                name.append(menuName.get((member[0])))
                price.append(menuPrice.get((member[0])))
                count.append(member[1])
            point = int(total)*0.05  #포인트 5% 적립
            myRe1 = receiptt(name,price,total,point,count) #적립하는 클래스
            myRe2 = receiptt(name,price,total,0,count) #적립 안 하는 클래스
            if select=='A':
                # 포인트를 적립하지 않겠다고 한 경우 영수증 출력 --> point=0
                if pointAdd(int(point))==0: myRe2.receipt()
                # 포인트 적립할 때 포인트 계산 후 영수증 출력
                else: myRe1.receipt()#영수증 출력 함수
                quit()
            #적립 안 하는 경우
            elif select=='B':
                # 포인트를 적립하지 않겠다고 한 경우 영수증 출력 --> point=0
                myRe2.receipt()
                quit()
            else:
                print('잘못 입력하셨습니다.')
                menu_2()
        elif select in data:
            someList.append(select)
            total=total+menuPrice.get(select)  # 총 가격

            i+=1
        else: print("잘못된 접근입니다. ")
# --------------------------------------------------------

class receiptt:
    def __init__(self,name,price,result,point,count):
        self.name=name
        self.price=price
        self.result=result
        self.point=point
        self.count=count

    def receipt(self):
        t.sleep(0.8)  # 한줄당 0.8초씩 출력
        print('\n[RECEIPT]')
        t.sleep(0.8)
        print('-' * 9, '머먹조 CAFE', '-' * 9)
        t.sleep(0.8)
        curTime = t.localtime(t.time())
        # t.time :  현재시간을 실수로
        # t.localtime(t.time()) :  t.time()이 돌려준 실수값으로 연도, 월, 일, 시, 분, 초, ...의 형태로 바꾸어 주는 함수
        print(f'판매일: {curTime.tm_year}/{curTime.tm_mon}/{curTime.tm_mday} {curTime.tm_hour}:{curTime.tm_min}')
        print('결제수단: 카드 결제')
        t.sleep(0.8)
        print('-' * 30)
        i = 0
        print('메 뉴         수 량          단 가')
        while i < len(self.name): #메뉴들
            t.sleep(0.8)
            print(self.name[i], '  ',self.count[i], '         ',self.price[i])  # 메뉴 이름, 개수, 가격 출력
            i += 1
        t.sleep(0.8)
        print('-' * 30)
        t.sleep(0.8)
        print('{0:>24}'.format('total:'),self.result)  # 총합 출력
        t.sleep(0.8)
        print('{0:>24}'.format('point:'),int(self.point))  # 포인트 출력

selectMenu1()