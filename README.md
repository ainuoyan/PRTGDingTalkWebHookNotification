# PRTGDingTalkWebHookNotification
PRTG 通过钉钉机器人发送通知

# 使用方法
1. 将<code>PRTGDingTalkWebHookNotification.ps1</code>文件复制到PRTG安装路径下的<code>Notifications\EXE</code>文件夹中
2. 管理员运行<code>Powershell</code>，运行以下命令
```
set-ExecutionPolicy RemoteSigned
```
3. 打开<code>PRTG</code>后台，进入**设置** - **账户设置** - **通知**页面。
4. 点击**添加新通知**按钮，更改**通知名称**，选择**通知摘要**方式为<code>总是尽快通知</code>。
5. 在页面下方“**执行程序**”复选框前打勾，选择程序文件为<code>PRTGDingTalkWebHookNotification.ps1</code>，“参数”框填写如下，注意填写钉钉机器人WebHoook地址：
```
-DingTalkWebHook '<钉钉机器人WebHook地址>' -SiteName '%sitename' -Device '%device' -Status '%status' -Down '%down' -DateTime '%datetime' -Message '%message'  -Probe '%probe' -Group '%group'  -Uptime '%uptime' -Downtime '%downtime' -Cumsince '%cumsince'  -PRTGHome '%home' -SensorID '%sensorid' -DeviceID '%deviceid' -Name '%name'
```
“域或计算机名称”、“用户名”、“密码”处填写对本机具有管理员权限的用户信息。

6. 点击“保存”按钮。

