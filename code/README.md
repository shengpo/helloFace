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
- 回覆camera解析度的OSC message
	- address pattern：`/returnCamRes`
	- type tag：`ii`
		- i: 第一個表示camera的寬度(width)
		- i: 第二個表示camera的高度(height)
- 回覆camera FPS數值的OSC message
	- address pattern：`/returnCamFps`
	- type tag：`i`
		- i: 表示camera的FPS (frame per second)
- 人臉偵測的OSC message
	- address pattern : `/faceDetect`
	- type tag：`is`
		- i: 表示偵測到的人臉數量
		- s: 偵測到的人臉範圍串列, 格式為 `x=0.4640625,y=0.47083333,w=0.1828125,h=0.24375|x=0.4453125,y=0.35416666,w=0.2484375,h=0.33125|...`（以此類推），每個人臉範圍以符號 **|** 相隔開, 每個人臉範圍(為一個矩型)由4個數值構成(每個數值為標準化之後的數值，介於0~1之間): x表示矩型的左上角x座標, y表示矩型的左上角y座標, w表示矩型的寬度, h表示矩型的高度
	- 範例: `/faceDetect 2 x=0.525,y=0.52708334,w=0.09375,h=0.125|x=0.4421875,y=0.36875,w=0.2484375,h=0.33125`



OSC message (receive in):
-------------------------
- 接收詢問camera解析度的OSC message
	- address pattern：`/queryCamRes`
	- type tag：無
- 接收詢問camera FPS數值的OSC message
	- address pattern：`/queryCamFps`
	- type tag：無




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
[X] OSC接收
	- 例如接收/queryCamRes, 回傳returnCamRes
	- 例如接收/queryCamFps, 回傳returnCamFps
[ ] 使用JSON來送osc message?
[X] 可儲存上一次的setting panel的設定
[X] 可刪除之前的設定檔
[ ] 將s/S, i/I, v/V鍵改成controller
[X] 只要更動camera, osc設定就將下方toggle設成false
[X] 建立osc connection後, 將osc-related textfield lock
[X] 設定.gitignore file過濾設定檔
[X] 將偵測到的範圍normalize, 以利不同視窗大小的client使用
[X] 寫一個helloFace的範例client程式
[ ] 本程式操作/使用說明

