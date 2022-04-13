
import React from 'react'
import { useRef,useState, useEffect } from 'react'
import axios from 'axios'
import { toast } from 'react-toastify'
import 'react-toastify/dist/ReactToastify.css'
import jsQR from "../packs/qrcamera/jsqr"


toast.configure();

function QrRead(props) {
    const [qrcode, setQrcode] = useState("")
    const [qrFlag, setqrFlag] = useState(false)
    const ref = useRef(null);

    const notify = (res) => {
        if(res.status === "start"){
            toast.success(res.message, {
            position: "top-center",
            hideProgressBar: true,
            autoClose: 1000,
            });
        }else if(res.status === "end"){
                toast.success(res.message, {
                position: "top-center",
                hideProgressBar: true,
                autoClose: 1000,
                });

        }else if(res.status === "error"){
                toast.error(res.message, {
                position: "top-center",
                hideProgressBar: true,
                autoClose: 1000,
                });

        }else if(res.status === "finished"){

                toast.warning(res.message, {
                position: "top-center",
                hideProgressBar: true,
                autoClose: 1000,
                });
        }else if(res.status === "nofound"){

            toast.error(res.message, {
            position: "top-center",
            hideProgressBar: true,
            autoClose: 1000,
            });
        }
      }


    const handleSuccessfulAuthentication = (data) => {
        console.log("handleSuccessfulAuthentication");
        props.loginCheck();
        
        
        
    }

    const sleep = (waitMsec) => {
        var startMsec = new Date();
        
        while (new Date() - startMsec < waitMsec);
    }
    

    const handleSubmit = (event) => {
        setqrFlag(true);
        console.log(qrFlag)
        var data = {
            qr: {
                qrcode: qrcode
            }
            
        }

        axios.post("/api/v1/qrcode", data , { withCredentials: true })
        .then(response => {
            console.log(response)
            notify(response.data[1]);
            console.log(response)
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
                   
                   if (outputData.value.length > 3) {
                     
                      
                     setQrcode(outputData.value);
                     document.getElementById("form-qr").click();//　QRを読み込んだらPOSTアクション
                     sleep(1000);
                     
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
        <div ref={ref} className="camera">
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