import React from 'react'
import { BrowserRouter, Switch, Route, Link } from 'react-router-dom'
import {useState, useEffect} from 'react'
import Home from './Home'
import Dashboard from './Dashboard'
import axios from 'axios'



function App() {

  const [loggedInStatus, setLoggedInStatus] = useState(false)
  const [userStatus,setUserStatus] = useState({})
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
    <BrowserRouter>
        <Switch>
          <Route 
          exact path={"/home"} 
          render={props => (
              <Home { ...props } 
                loggedInStatus={loggedInStatus}
                userStatus={userStatus}
                loginCheck={loginCheck}                
                />)} 
          />
          <Route exact path={"/dashboard"} component={Dashboard} />
        </Switch>

    </BrowserRouter>
  )
}

export default App