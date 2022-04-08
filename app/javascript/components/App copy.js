import React from 'react'
import { BrowserRouter, Switch, Route, Link } from 'react-router-dom'
import {useState, useEffect} from 'react'
import App from './App'
import SideBar from './SideBar'
import Dashboard from './Dashboard'
import axios from 'axios'



function App() {

  const [loggedInStatus, setLoggedInStatus] = useState(false)
  const [userStatus,setUserStatus] = useState({})
  
  const logOut = () => {

    axios.get("/lgout", { withCredentials: true })
        .then(response => {
            if (!response.data.logged_in) {
                if(loggedInStatus){
                  setLoggedInStatus(false);
                  console.log("status: falseに変換")
  
                  console.log(response.data.session)
              
                  setUserStatus(response.data.user)
                  console.log("userデータ消去")
                }
            }else{
              console.log(response.data.session)
              console.log(response.data.message)
            }   
        }).catch(error => {
            console.log("registration error", error)
        })
  }
        
  const loginCheck = () => {

    axios.get("/login_check", { withCredentials: true })
        .then(response => {
            if (response.data.logged_in) {
                if(!loggedInStatus){
                  setLoggedInStatus(true);
                  console.log("trueに変換")

                  console.log(response.data.session)
              
                  setUserStatus(response.data.user)
                  console.log("user変更")
                  
                  
                }
            }else{
              console.log(response.data.session)
              console.log(response.data.message)
            }   
        }).catch(error => {
            console.log("registration error", error)
        })

        

  }
  useEffect( () => {
    loginCheck();

  },[loggedInStatus] )
  
   
  return (
    <>
    
    
    <BrowserRouter>
      
        <App/>

    </BrowserRouter>
    </>

  )
}

export default App