<%-- 
    Document   : test
    Created on : 24 Nov, 2016, 9:22:51 AM
    Author     : tcw
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
﻿<!doctype html>
<html lang="en">
<head>
    <title>BioMini Web Example</title>
    <meta charset="utf-8">
    <script src='js/array.generics.min.js'></script>
    <script src='js/jquery.min.js'></script>
    <script src='js/biominiWebAgent.js'></script>
</head>
<body onload="InitPage()"
      onbeforeunload="DeletePage()">
    <center>
        <table id="MainTable">
            <tr>
                <td><h1>BioMini Web Example</h1></td>
                <td colspan="2"><h2 id="TdAlert" style="color:blue;"></h2></td>
            </tr>
            <tr>
                <td width="400px" style="vertical-align:top;">
                    <table style="width:340px;">
                        <tr>
                            <td colspan="2">
                                <h2>FingerPrint Live Image</h2>
                                <p>
                                    <img id="Fpimg" width="320" height="480" />
                                </p>
                                <p>
                                    <label><input type="checkBox" id="Cb_PreviewOn" onclick="PreviewOnChecked();" />Preview On(MultiPart)</label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td width="220px">
                                <h2>Log</h2>
                            </td>
                            <td>
                                <button id="Bt_ClrLog" onclick="ClearLog()" style="width:90px;height:30px">Clear Log</button>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="vertical-align:top;">
                                <textarea id="Tb_DisplayLog" style="width:320px;height:250px;" size="5000"></textarea>
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="350px" style="vertical-align:top;">
                    <table style="width:280px;">
                        <tr>
                            <td style="text-align:center;">
                                <button id="Bt_Init" style="width:120px;height:30px;" onclick="Init()">Init</button>
                            </td>
                            <td style="text-align:center;">
                                <button id="Bt_UnInit" style="width:120px;height:30px;" onclick="UnInit()">UnInit</button>
                            </td>
                        </tr>
                    </table>
                    <h2>Scanner List</h2>

                    <p>
                        <select id="slt_ScannerList" style="width:280px;height:150px;" size="10"
                                onchange="OnSelectScannerOptions()"></select>
                    </p>
                    <h2>Scanner Parameters</h2>
                    <p>
                        <table>
                            <tr>
                                <td width="80">Timeout</td>
                                <td>
                                    <select size="1" id="DDb_TimeoutOpt" onchange="TimeoutOpt()">
                                        <option value="0">0</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5*</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td width="80">Brightness</td>
                                <td>
                                    <input type="number" id=Tb_BrightnessValue min="0" max="100" value="-1" style="width:100px;">
                                    <button type="button" id="bt_BrightnessValueup" onclick="BrightnessValueup()">+</button>
                                    <button type="button" id="bt_BrightnessValuedw" onclick="BrightnessValuedw()">-</button>
                                </td>
                            </tr>
                            <tr>
                                <td width="50">Sensitivity</td>
                                <td>
                                    <input type="number" id=Tb_Sensitivity min="0" max="100" value="-1" style="width:100px;">
                                    <button type="button" id="bt_SensitivityValueup" onclick="SensitivityValueup()">+</button>
                                    <button type="button" id="bt_SensitivityValuedw" onclick="SensitivityValuedw()">-</button>
                                </td>
                            </tr>
                        </table>
                    </p>
                    <h2>Scanner Functions</h2>
                    <p>
                        <table style="width:280px;">
                            <tr>
                                <td style="text-align:center;">
                                    <button id="Bt_StartCpt" onclick="StartCapture()" style="width:120px;height:30px;">Start Capture</button>
                                </td>
                                <td style="text-align:center;">
                                    <button id="Bt_AbtCpt" onclick="AbortCapture()" style="width:120px;height:30px;">Abort Capture</button>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%" style="text-align:center;">
                                    <button id="Bt_CptSingle" onclick="CaptureSingle()" style="width:120px;height:30px;">Capture Single</button>
                                </td>
                                <td width="50%" style="text-align:center;">
                                    <button id="Bt_AtCpt" onclick="AutoCapture()" style="width:120px;height:30px;">Auto Capture</button>
                                </td>
                            </tr>
                        </table>
                    </p>
                    <p>
                        <table style="width:280px;">
                            <tr>
                                <td width="50%" style="text-align:center;">
                                    <button id="Bt_SvImg" onclick="SaveImageBuffer()" style="width:120px;height:30px;">Save Image</button>
                                </td>
                                <td width="50%" style="text-align:center;">
                                    <button id="Bt_GtImg" onclick="GetImageBuffer()" style="width:120px;height:30px;">Get Image</button>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:center;">
                                    File Type
                                </td>
                                <td style="text-align:center;">
                                    <select size="1" id="DDb_Tftype" onchange="Tftype()">
                                        <option value="1">1. BMP*</option>
                                        <option value="2">2. 19794_4</option>
                                        <option value="3">3. WSQ</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:center;">
                                    Compression Ratio
                                </td>
                                <td style="text-align:center;">
                                    <select size="1" id="DDb_CompRatio" onchange="CompRatio()">
                                        <option value="0.1">0.1</option>
                                        <option value="0.2">0.2</option>
                                        <option value="0.3">0.3</option>
                                        <option value="0.4">0.4</option>
                                        <option value="0.5">0.5</option>
                                        <option value="0.6">0.6</option>
                                        <option value="0.7">0.7*</option>
                                        <option value="0.8">0.8</option>
                                        <option value="0.9">0.9</option>
                                        <option value="1.0">1.0</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </p>
                    <h2>Matcher Options</h2>
                    <p>
                        <label><input type="checkBox" id="Cb_FastMode" onclick="FastModeChecked();" /> Fast Mode</label>
                    </p>
                    <p>
                        Security Level
                        <select size="1" id="DDb_SecuLevOpt" onchange="SecuLevOpt()">
                            <option value="1">1. (FAR1/100)</option>
                            <option value="2">2. (1/1,000)</option>
                            <option value="3">3. (1/10,000)</option>
                            <option value="4">4*.(1/100,000)</option>
                            <option value="5">5. (1/1,000,000)</option>
                            <option value="6">6. (1/10,000,000)</option>
                            <option value="7">7. (1/100,000,000)</option>
                        </select>
                    </p>
                    <p>
                        <table>
                            <tr>
                                <td><textarea id="Tb_Template" style="width:274px;" size="1000"></textarea></td>
                            </tr>
                            <tr>
                                <td><button id="Bt_TempDataVerify" onclick="VerifyWithTemplate();" style="width:280px;height:30px;">Verify Encrypted Template Data</button></td>
                            </tr>
                        </table>
                    </p>
                </td>
                <td style="vertical-align:top;">
                    <h2>User Infomation</h2>
                    <p>
                        <table id="UserList" style="width:100%;">
                            <thead>
                                <tr style="background-color: #eee;">
                                    <th style="background-color: black; color: white; top:-20px;">Serial</th>
                                    <th style="background-color: black; color: white; top:-20px;">User ID</th>
                                    <th style="background-color: black; color: white; top:-20px;">Template1</th>
                                    <th style="background-color: black; color: white; top:-20px;">Template2</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                        <select id="slt_UserList" style="width:100%;" size="20" onchange="OnSelectUser()"></select>
                    </p>
                    <p>
                        <label><input type="checkBox" id="Cb_SelTemp" onclick="SelTemplateModeChecked();" /> Select Template Mode</label>
                    </p>
                    <p>
                        <button id="Bt_Enroll" onclick="Enroll()" style="width:140px;height:30px;">Enroll</button>
                        <button id="Bt_DelAll" onclick="InfoDelAll()" style="width:140px;height:30px;">Delete All</button>
                    </p>
                    <p>
                        <button id="Bt_UpdateTpl" onclick="UpdateTemplate()" style="width:140px;height:30px;">Update Selected</button>
                        <button id="Bt_DelTpl" onclick="DelTpl()" style="width:140px;height:30px;">Delete Selected</button>
                    </p>
                    <p>
                        <button id="Bt_SbTpl" onclick="SaveTemplate()" style="width:284px;height:30px;">Get Selected Template</button>
                    </p>
                    <p>
                        <button id="Bt_Verify" onclick="Verify();" style="width:284px;height:30px;">Verify</button>
                    </p>
                    <p>
                        <button id="Bt_Identify" onclick="Identify();" style="width:140px;height:30px;">Identify</button>
                        <button id="Bt_AbortIdentify" onclick="AbortIdentify();" style="width:140px;height:30px;">Abort Identify</button>
                    </p>
                    <h2>Template Option</h2>
                    <p>
                        <label><input type="checkBox" id="Cb_Encrypt" onclick="EncryptModeChecked();" text="bbb" /> Encrypt</label>
                        with Key <input type="text" id="Txt_EncKey" size="5" maxlength="32" onblur="SendParameter()" />
                    <br><font style="color : darkred;">&nbsp;&nbsp;&nbsp;&rarr;&nbsp;Not works for Enrollment</font>
                    </p>
                    <p>
                        <label><input type="checkBox" id="Cb_ExtractEx" onclick="ExtractExModeChecked();" /> Use ExtractEx</label>
                    </p>
                    <p>
                        Template Type
                        <select size="1" id="DDb_Tpltype" onchange="Tpltype()">
                            <option value="2001">1. SUPREMA*</option>
                            <option value="2002">2. ISO_19794_2</option>
                            <option value="2003">3. ANSI378</option>
                        </select>
                    </p>
                    <p>
                        Quality
                        <select size="1" id="DDb_QltyLv" onchange="QltyLv()">
                            <option value="1"> 1. None</option>
                            <option value="2"> 2.  0</option>
                            <option value="3"> 3.  10</option>
                            <option value="4"> 4.  20</option>
                            <option value="5"> 5.  30</option>
                            <option value="6"> 6.  40*</option>
                            <option value="7"> 7.  50</option>
                            <option value="8"> 8.  60</option>
                            <option value="9"> 9.  70</option>
                            <option value="10">10. 80</option>
                            <option value="11">11. 90</option>
                        </select>
                    </p>
                    <p>
                        <button id="Bt_Extract" onclick="GetTemplateData()" style="width:140px;height:30px;">Get Template Data</button>
                    </p>
                </td>
            </tr>
        </table>
    </center>
</body>
</html>
