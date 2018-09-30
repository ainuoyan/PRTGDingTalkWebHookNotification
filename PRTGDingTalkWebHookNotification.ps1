Param(
    [string]$DingTalkWebHook,
    [string]$SiteName,
    [string]$Device,
    [string]$Status,
    [string]$Down,
    [string]$DateTime,
    [string]$Message,
    [string]$Probe,
    [string]$Group,
    [string]$Uptime,
    [string]$Downtime,
    [string]$Cumsince,
    [string]$PRTGHome,
    [string]$SensorID,
    [string]$Name,
    [string]$DeviceID

)
$postDingTalkMessage = ConvertTo-Json -Depth 3 ([pscustomobject]@{
    actionCard=@{
        title = "PRTG 通知";
        text =  "## $($sitename) `n`n"+
                "### 设备位置信息： `n"+
                "- 探针名称："+"$($Probe) `n"+
                "- 群组名称："+"$($Group) `n"+
                "- 设备名称："+"$($Device) `n"+
                "### 传感器通知信息： `n"+
                "- 传感器名："+"$($Name) `n"+
                "- 运行状态："+"$($Status)$($Down) `n"+
                "- 通知时间："+"$($DateTime) `n"+   
                "- 通知详情：`n"+
                "> $($Message) `n"+
                "### 传感器运行统计： `n"+
                "- 累计在线："+"$($Uptime) `n"+
                "- 累计掉线："+"$($Downtime) `n"+
                "- 起始时间："+"$($Cumsince) `n";

        hideAvatar = "0";
        btnOrientation = "1"; 
        btns = @(
            @{
                title = "查看设备";
                actionURL = "$($PRTGHome)device.htm?id=$($DeviceID)";
            },
            @{
                title = "查看传感器";
                actionURL = "$($PRTGHome)sensor.htm?id=$($SensorID)";
            }
        )
    }
    msgtype = "actionCard";    
})

$postDingTalkMessage | Out-File utf8 -FilePath DingTalk.log
$postDingTalkMessage.text  | Out-File  utf8 -FilePath DingTalk.log -Append
Invoke-RestMethod -Method Post -ContentType 'application/json;charset=utf-8' -Uri $SlackWebHook -Body $postDingTalkMessage  | Out-File  utf8 -FilePath DingTalk.log -Append
