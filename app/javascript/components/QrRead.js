
import React from 'react'
import { useState, useEffect } from 'react'
import axios from 'axios'
import jsQR from "../packs/qrcamera/jsqr"



function QrRead(props) {
    const [qrcode, setQrcode] = useState("")

    const handleSuccessfulAuthentication = (data) => {
        console.log("handleSuccessfulAuthentication");
        props.loginCheck();
        
        
        
    }

    const sleep = (waitMsec) => {
        var startMsec = new Date();
        while (new Date() - startMsec < waitMsec);
    }
    

    const handleSubmit = (event) => {
        sleep(2000)
        var data = {
            qr: {
                qrcode: qrcode
            }
            
        }
        console.log(data)
        axios.get("/qrcodeee", data , { withCredentials: true })
        .then(response => {
            if (response.data.status === 'created') {
            
                handleSuccessfulAuthentication(response.data)
            }
        }).catch(error => {
            console.log("registration error", error)
        })
        event.preventDefault()
    }



    useEffect(()=>{
        var video = document.createElement("video");
        var canvasElement = document.getElementById("canvas");
        var canvas = canvasElement.getContext("2d");
        var loadingMessage = document.getElementById("loadingMessage");
        var outputContainer = document.getElementById("output");
        var outputMessage = document.getElementById("outputMessage");
        var outputData = document.getElementById("outputData");

        function drawLine(begin, end, color) {
        canvas.beginPath();
        canvas.moveTo(begin.x, begin.y);
        canvas.lineTo(end.x, end.y);
        canvas.lineWidth = 4;
        canvas.strokeStyle = color;
        canvas.stroke();
        }

        // Use facingMode: environment to attemt to get the front camera on phones
        navigator.mediaDevices.getUserMedia({ video: { facingMode: "environment" } }).then(function(stream) {
        video.srcObject = stream;
        video.setAttribute("playsinline", true); // required to tell iOS safari we don't want fullscreen
        video.play();
        requestAnimationFrame(tick);
        });

        function tick() {
        loadingMessage.innerText = "⌛ Loading video..."
        if (video.readyState === video.HAVE_ENOUGH_DATA) {
            loadingMessage.hidden = true;
            canvasElement.hidden = false;
            outputContainer.hidden = false;

            canvasElement.height = video.videoHeight;
            canvasElement.width = video.videoWidth;
            canvas.drawImage(video, 0, 0, canvasElement.width, canvasElement.height);
            var imageData = canvas.getImageData(0, 0, canvasElement.width, canvasElement.height);
            var code = jsQR(imageData.data, imageData.width, imageData.height, {
            inversionAttempts: "dontInvert",
            });
            if (code) {
            drawLine(code.location.topLeftCorner, code.location.topRightCorner, "#FF3B58");
            drawLine(code.location.topRightCorner, code.location.bottomRightCorner, "#FF3B58");
            drawLine(code.location.bottomRightCorner, code.location.bottomLeftCorner, "#FF3B58");
            drawLine(code.location.bottomLeftCorner, code.location.topLeftCorner, "#FF3B58");
            outputMessage.hidden = true;
            outputData.parentElement.hidden = false;
            outputData.value = code.data;
            if (outputData.value.length > 5) {
                setQrcode(outputData.value)
                document.getElementById("form-qr").click(); //　QRを読み込んだらGETアクション
                //video.stop();  // video エレメントをストップする
            }
            } else {
            outputMessage.hidden = false;
            outputData.parentElement.hidden = true;
            }
        }
        requestAnimationFrame(tick);
    }
      },[]);
            
    return(
        <div className="camera">
            <h1>QR読み取り</h1>
            <div id="loadingMessage">🎥 Unable to access video stream (please make sure you have a webcam enabled)</div>
            <canvas id="canvas" hidden></canvas>
            <div id="output" hidden>
                <div type="text" id="outputMessage" >No QR code detected</div>
                <form  onSubmit={handleSubmit}>
    
                <input
                    id="outputData"
                    type="text"
                    name="qrcode"
                />
             <div className="btn-container">
                <button id="form-qr" type="submit" onClick={handleSubmit}>ログイン</button>
            </div>
            </form>
            </div>
        </div>
                


    )
}

export default QrRead