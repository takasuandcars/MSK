import React from 'react'
import { BrowserRouter, Switch, Route, Link } from 'react-router-dom'
import {useState, useEffect} from 'react'
import Home from './Home'
import SideBar from './SideBar'
import NavBar from './NavBar'
import Dashboard from './Dashboard'
import QrRead from './QrRead'
import WorksTable from './WorksTable'
import axios from 'axios'



function App() {
  const [loggedInStatus, setLoggedInStatus] = useState(gon.login_check)
  const [userStatus,setUserStatus] = useState({})
  const sleep = (waitMsec) => {
    var startMsec = new Date();
    while (new Date() - startMsec < waitMsec);
  }

  useEffect(()=>{
    console.log("Effect開始")
    loginCheck();
    console.log("Effect終了")
  },[loggedInStatus]);
        

  const loginCheck = () => {
    console.log("ログインチェック開始")
    axios.get("/login_check", { withCredentials: true })
        .then(response => {
            if (response.data.logged_in) {
                if(!loggedInStatus){
                  setLoggedInStatus(true);
                  setUserStatus(response.data.user)
                }else{
                  setUserStatus(response.data.user)
                }
            }else{
              setLoggedInStatus(false);
              setUserStatus({})
            }   
        }).catch(error => {
            console.log("registration error", error)
        }) 
        console.log("ログインチェック終了")     
  }

  const logout = () => {
    console.log("ログアウトコマンド")
    axios.get("/lgout", { withCredentials: true })
        .then(response => {
            if (!response.data.logged_in) {
                if(loggedInStatus){
                  setLoggedInStatus(false)
                  setUserStatus({})
                }
            }else{

            }   
        }).catch(error => {
            console.log("registration error", error)
        })
        console.log("ログアウトコマンド終了")
  }
  
   
  return (
    <>
    
    <section className="header">
      <NavBar   userStatus={userStatus} loggedInStatus={loggedInStatus} logout={logout}/>
    </section>
    <section className="left-sidebar">
     <SideBar loggedInStatus={loggedInStatus} /*logout={logout()}*//>
    </section>
    <section className="main-container">
      <div className="display-container">
      <BrowserRouter>
        <Switch>
          
          
          {loggedInStatus && <Route exact path={"/dashboard"} component={Dashboard} />}
          {loggedInStatus &&  <Route exact path={"/qrread/index"} component={QrRead}/>}
          {loggedInStatus &&  <Route exact path={"/works"} component={WorksTable}/>}
          <Route 
          
          render={props => (
              <Home { ...props } 
                loggedInStatus={loggedInStatus}
                userStatus={userStatus}
                loginCheck={loginCheck}                
                />)} 
          />
        </Switch>

    </BrowserRouter>
    </div>
    </section>
    </>

  )
}

export default App