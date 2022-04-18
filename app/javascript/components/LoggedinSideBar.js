import React from 'react'
import { BrowserRouter, Switch, Route, Link } from 'react-router-dom'
import {useState, useEffect} from 'react'
import axios from 'axios'

function LoggedinSideBar(props) {

    
return (
    <>
      <a href="/">ダッシュボード</a>
      <a href="/pickup_requests/index">集荷依頼</a>
      <a href="/receiveds">入荷予定</a>
      <a href="/events/index">カレンダー</a>
      <a href="/qrread/index" >出退勤モード</a>
      <a href="/works">勤怠データ</a>
      <a href="/rooms">チャット機能</a>
      <a href="/users/new">ユーザ作成</a>
      <a href="/users">ユーザ一覧</a>
    </>

  )
}

export default LoggedinSideBar