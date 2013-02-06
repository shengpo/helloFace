This is the place for Processing source code

**helloFace** folder is a Processing sketch folder.


Instruction:
------------
- 按s/S鍵, 可以switch on/off 設定面板
	- 可選擇/設定camera參數
	- 可設定OSC相關參數
	- 可設定是否將目前的設定作為預設值 (下次開啟helloFace程式便直接使用)
	- 可刪除已有的預設設定檔
- 按i/I鍵, 可以switch on/off 資訊面板
- 按v/V, 可以switch on/off 偵測到的視覺資訊
	- 無論是否秀出視覺資訊，都仍會送出偵測的OSC message



OSC message (send out):
-----------------------
- 人臉偵測的OSC message
	- address pattern : `/faceDetect`
	- type tag: `is`
		- i: 表示偵測到的人臉數量
		- s: 偵測到的人臉範圍串列, 格式為 `x=0,y=0,w=30,h=30|x=10,y=10,w=60,h=60|...`（以此類推），每個人臉範圍以符號 **|** 相隔開, 每個人臉範圍(為一個矩型)由4個數值構成: x表示矩型的左上角x座標, y表示矩型的左上角y座標, w表示矩型的寬度, h表示矩型的高度
	- 範例: `/faceDetect 2 x=310,y=166,w=149,h=149|x=314,y=149,w=159,h=159`


TODO list:
------------
[X] setting panel能左右伸縮: 
	- 向右伸長後, 長出設定選項, 進入設定模式
	- 向左縮回後，便結束設定模式
[X] 增加infoPanel, 放在viewPanel上，顯示一些資訊
	- 主要是當setting panel收起來時，提供一些資訊
	- 例如：目前所選擇的camera parameters
[X] face-detection
[ ] other opencv detection?
[X] OSC可設定remote address, remote osc port, 本程式local端osc port
[X] OSC送出
[ ] OSC接收
[ ] 使用JSON來送osc message?
[X] 可儲存上一次的setting panel的設定
[X] 可刪除之前的設定檔
[ ] 將s/S, i/I, v/V鍵改成controller
[X] 只要更動camera, osc設定就將下方toggle設成false
[X] 建立osc connection後, 將osc-related textfield lock
[ ] 設定.ignore file過濾設定檔
[ ] 寫一個helloFace的範例client程式
[ ] 本程式操作/使用說明

