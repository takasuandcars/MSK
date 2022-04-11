import React from 'react'
import {useEffect,useState} from 'react'
import $ from 'jquery'




function Dashboard(props) {
    const [Flag, setFlag] = useState(1);
    
    useEffect(() => {
        // jqueryメソッド（mapplic）
            window.$('#mapplic').mapplic({
                source: 'map_json',
                height: 600,
                sidebar: false,
                marker: 'hidden',
                fullscreen: false,
                maxscale: 3,
        
                // UI
                basecolor: 'rgba(255,255,255, 0.6)',
                bgcolor: '#333',
                bgcolor2: '#333',
                headingcolor: '#fff',
                textcolor: '#aaa'
          },[]);


    })

    return (
        <div>
            <h1>物流センターマップ</h1>
            <div className="map-container">
				<div id="mapplic"></div> 
                {/* jqueryのプラグイン, jqueryで管理 */}
			</div>

        </div>
    )
}

export default Dashboard