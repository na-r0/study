def printMenu():
    print('')
    print(' ' * 14, '<MENU>')
    print('COFFE', ' ' * 14, 'DESSERT')
    print('1.에스프레소', '{0:<9}'.format('3,000'), '6.초코케이크             5,000')
    print('2.아메리카노', '{0:<9}'.format('3,000'), '7.치즈케이크             5,000')
    print('3.카페라떼  ', '{0:<9}'.format('3,500'), '8.타르트(에그)           4,000')
    print('4.카페모카  ', '{0:<9}'.format('3,500'), '9.타르트(치즈)           4,000')
    print('5.카푸치노  ', '{0:<9}'.format('3,500'), '10.베이글               4,000')
    print('                      11.마카롱(딸기)          3,500')
    print('                      12.마카롱(녹차)          3,500')
    print('                      13.마카롱(초코)          3,500\n')
    print('1인 SET MENU (10% 할인된 가격)')
    print('14.아메리카노+치즈케이크 7,200')
    print('15.아메리카노+베이글 5,800')
    print('16.아메리카노+마카롱 4,900\n')
    print('2인 SET MENU (10% 할인된 가격)')
    print('17.아메리카노 2+케이크 9,900')
    print('18.아메리카노 2+베이글 8,500')
    print('19.아메리카노 2+마카롱 7,600\n')

def menu_1():
    print("="*7+' WELLCOME TO 머먹조 CAFE! '+'='*7)
    print(" "*10+'A. 매         장')
    print(" "*10+'B. 테 이 크 아 웃')
    print(" "*10+'C. 종         료')
    print('='*39)

def menu_2():#메뉴 주문
    printMenu()
    print("="*7+' WELLCOME TO 머먹조 CAFE! '+'='*7)
    print(" "*10+'A. 이  전  화  면')
    print(" "*10+'B. 종         료')
    print(" "*10+'C. 주  문  완  료')
    print('=' * 39)

def menu_3():
    print()
    print("="*7+' WELLCOME TO 머먹조 CAFE! '+'='*7)
    print(" "*10+'A. 적         립')
    print(" "*10+'B. 종         료')
    print('=' * 39)


