This is the place for Processing source code

**helloFace** folder is a Processing sketch folder.


Instruction:
------------
- 按s/S鍵, 可以switch on/off 設定面板
	- 可選擇/設定camera參數
- 按i/I鍵, 可以switch on/off 資訊面板
- 按v/IV, 可以switch on/off 偵測到的視覺資訊



TODO list:
------------
[x] setting panel能左右伸縮: 
	- 向右伸長後, 長出設定選項, 進入設定模式
	- 向左縮回後，便結束設定模式
[-] 增加infoPanel, 放在viewPanel上，顯示一些資訊
	- 主要是當setting panel收起來時，提供一些資訊
	- 例如：目前所選擇的camera parameters
[x] face-detection
[ ] other opencv detection?
[ ] OSC可設定remote address, remote osc port, 本程式local端osc port
[ ] OSC送出
[ ] OSC接收
[ ] 使用JSON來送osc message?
[ ] 可儲存上一次的setting panel的設定
[ ] 本程式操作/使用說明