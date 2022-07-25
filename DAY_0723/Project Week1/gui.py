##### 머먹조 카페 키오스크 gui 코드 #####
import tkinter as tk
from tkinter import messagebox
from datetime import datetime

# price라는 딕셔너리 안에 음료, 디저트, 세트 메뉴와 가격을 다같이 추가했습니다.
price = {'에스프레소': 3000, '아메리카노': 3000, '카페라떼': 3500, '카페모카': 4000, '카푸치노': 3500, '초코케이크': 5000, '치즈케이크': 5000, '타르트':4000, '베이글':3500, '마카롱':2500, '아아,치즈케이크':7200, '아아,베이글':5900, '아아,마카롱':5000, '아아2,치즈케이크':9900, '아아2,베이글':8600, '아아2,마카롱':7700}

order = [] # 주문을 했을 때 저장되는 리스트를 만듦.
order2 = {'에스프레소': 0, '아메리카노': 0, '카페라떼': 0, '카페모카': 0, '카푸치노':0, '초코케이크': 0, '치즈케이크': 0, '타르트':0, '베이글':0, '마카롱':0, '아아,치즈케이크':0, '아아,베이글':0, '아아,마카롱':0, '아아2,치즈케이크':0, '아아2,베이글':0, '아아2,마카롱':0}
sum = 0


def clear():
    global sum, order, order2, textarea, entry1, entry2
    textarea.delete('1.0', tk.END)
    label1['text'] = "금액: 0원"
    sum = 0
    order = []
    order2 = {'에스프레소': 0, '아메리카노': 0, '카페라떼': 0, '카페모카': 0, '카푸치노':0, '초코케이크': 0, '치즈케이크': 0, '타르트':0, '베이글':0, '마카롱':0, '아아,치즈케이크':0, '아아,베이글':0, '아아,마카롱':0, '아아2,치즈케이크':0, '아아2,베이글':0, '아아2,마카롱':0}
    entry1.delete('0', tk.END)
    entry2.delete('0', tk.END)
    entry1.focus()

def add(item):                                                     # 금액
    global sum
    if item not in price:
        print("no drink")
    this_price = price.get(item)
    sum += this_price
    order.append(item)
    order2[item] += 1
    textarea.insert(tk.INSERT, item+" "+str(this_price)+"\n")
    label1['text'] = "금액: " + str(sum) + "원"

def send():                                                        # 주문을 보내줌
    global order, order2, sum, entry1, entry2
    name = str(entry1.get())
    hp = str(entry2.get())
    print(name, hp)
    print(order)
    print(order2)


    now_dt = datetime.today().strftime('%Y-%m-%d_%H_%M_%S')       # 날짜/시간 나타내는 함수

    filename=f"{now_dt}_order.txt"
    with open(filename, mode='w', encoding='utf-8') as f:
        f.write('*********** 영수증 ***********\n')
        f.write(textarea.get('1.0', tk.END).rstrip()+"\n")
        f.write('****************************\n')
        f.write(f'총금액 : { label1["text"] }\n')
        f.write('*****************************\n')
        f.write(f'이름: {str(entry1.get())}, 전화번호: {str(entry2.get())}\n')
        f.write('*****************************')
    clear()

def btn_exit():                                                    # 이름, 휴대폰번호, 주문완료
    global entry1, entry2

    name = str(entry1.get())
    hp = str(entry2.get())

    if name == "":
        tk.messagebox.showerror("확인", "이름을 입력해주세요!")
        entry1.focus()
        return
    if hp == "":
        tk.messagebox.showerror("확인", "휴대폰번호를 입력해주세요!")
        entry2.focus()
        return

    msgbox = tk.messagebox.askquestion('확인', '주문을 마치시겠습니까?')
    if msgbox == 'yes':
        send()

window = tk.Tk() #창
window.title("머먹조 카페 키오스크 주문") #제목
window.geometry("900x600") #크기

titlelabel1= tk.Label(window, text="머먹조 CAFE KIOSK", width=25, height=2)        # 프로그램 제목 설정
titlelabel1.pack()

frame1 = tk.Frame(window) # 버튼들을 나열하기위해 window 안에 프레임을 만들어준다.
frame1.pack()

frame2 = tk.Frame(window)
frame2.pack()

frame3 = tk.Frame(window)
frame3.pack()

#라벨을 두어 메뉴 제목을 주었습니다. 글자보여주는 요소
dessertlabel = tk.Label(frame1, text="디저트", width=10, height=2)
drinklabel = tk.Label(frame1, text="음   료", width=10, height=2)
setlabel = tk.Label(frame1, text="세트 메뉴", width=10, height=2)
orderlabel =tk.Label(frame1, text="주    문", width=10, height=2)

# 프레임안에 버튼으로 각 메뉴의 클릭 버튼을 만들었습니다. 커멘드라는 파라미터를 가지고 기능을 구현. 버튼이 눌렸을 경우 지정된 함수를 수행하는 경우에 많이 사용. width(너비), height(높이)
btn_1 = tk.Button(frame1, text="초코케이크", command=lambda: add('초코케이크'), width=10, height=2)
btn_2 = tk.Button(frame1, text="치즈케이크", command=lambda: add('치즈케이크'), width=10, height=2)
btn_3 = tk.Button(frame1, text="타르트", command=lambda: add('타르트'), width=10, height=2)
btn_4 = tk.Button(frame1, text="베이글", command=lambda: add('베이글'), width=10, height=2)
btn_5 = tk.Button(frame1, text="마카롱", command=lambda: add('마카롱'), width=10, height=2)

btn_6 = tk.Button(frame1, text="에스프레소", command=lambda: add('에스프레소'), width=10, height=2)
btn_7 = tk.Button(frame1, text="아메리카노", command=lambda: add('아메리카노'), width=10, height=2)
btn_8 = tk.Button(frame1, text="카페라떼", command=lambda: add('카페라떼'), width=10, height=2)
btn_9 = tk.Button(frame1, text="카페모카", command=lambda: add('카페모카'), width=10, height=2)
btn_10 = tk.Button(frame1, text="카푸치노", command=lambda: add('카푸치노'), width=10, height=2)

btn_11 = tk.Button(frame1, text="아아,치즈케이크", command=lambda: add('아아,치즈케이크'), width=10, height=2)
btn_12 = tk.Button(frame1, text="아아,베이글", command=lambda: add('아아,베이글'), width=10, height=2)
btn_13 = tk.Button(frame1, text="아아2,치즈케이크", command=lambda: add('아아2,치즈케이크'), width=10, height=2)
btn_14 = tk.Button(frame1, text="아아2,베이글", command=lambda: add('아아2,베이글'), width=10, height=2)
btn_15 = tk.Button(frame1, text="아아2,마카롱", command=lambda: add('아아2,마카롱'), width=10, height=2)
btn_16 = tk.Button(frame1, text="주문완료", command=btn_exit, width=10, height=2)


# 각 메뉴에 grid를 사용하여 우, 아래, 가로, 세로의 길이를 주었습니다. 화면의 배치 가로와 세로 (글자 1개, 버튼 5개)
dessertlabel.grid(row=0, column=0, padx=10, pady=10)
btn_1.grid(row=0, column=1, padx=10, pady=10)
btn_2.grid(row=0, column=2, padx=10, pady=10)
btn_3.grid(row=0, column=3, padx=10, pady=10)
btn_4.grid(row=0, column=4, padx=10, pady=10)
btn_5.grid(row=0, column=5, padx=10, pady=10)

drinklabel.grid(row=1, column=0, padx=10, pady=10)
btn_6.grid(row=1, column=1, padx=10, pady=10)
btn_7.grid(row=1, column=2, padx=10, pady=10)
btn_8.grid(row=1, column=3, padx=10, pady=10)
btn_9.grid(row=1, column=4, padx=10, pady=10)
btn_10.grid(row=1, column=5, padx=10, pady=10)

setlabel.grid(row=2, column=0, padx=10, pady=10)
btn_11.grid(row=2, column=1, padx=10, pady=10)
btn_12.grid(row=2, column=2, padx=10, pady=10)
btn_13.grid(row=2, column=3, padx=10, pady=10)
btn_14.grid(row=2, column=4, padx=10, pady=10)
btn_15.grid(row=2, column=5, padx=10, pady=10)
btn_16.grid(row=3, column=5, padx=10, pady=10)

# 주문완료 버튼의 라벨
orderlabel.grid(row=3, column=0, padx=10, pady=10)
label2 = tk.Label(frame1, text="이름", width=10, height=2).grid(row=3, column=1)
label3 = tk.Label(frame1, text="휴대폰번호", width=10, height=2).grid(row=3, column=3 )

entry1 = tk.Entry(frame1)
entry1.grid(row=3, column=2)
entry2 = tk.Entry(frame1)
entry2.grid(row=3, column=4)

label1 = tk.Label(window, text="금액: 0원", width=100, height=2, fg="blue")
label1.pack()

textarea = tk.Text(window)
textarea.pack(padx=10, pady=10)

window.mainloop()