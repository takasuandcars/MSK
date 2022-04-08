import React from 'react'
import { BrowserRouter, Switch, Route, Link } from 'react-router-dom'
import {useState, useEffect} from 'react'
import axios from 'axios'

function LoggedinSideBar(props) {

    
return (
    <>
    
      <a>ダッシュボード</a>
      <a>集荷</a>
      <a>入荷予定</a>
      <a>カレンダー</a>
      <a>集荷依頼</a>
    </>

  )
}

export default LoggedinSideBar