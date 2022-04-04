import React from 'react'
import { BrowserRouter, Switch, Route, Link } from 'react-router-dom'
import {useState} from 'react'
import Home from './Home'
import Dashboard from './Dashboard'




function App() {

  const [loggedInStatus, setLoggedInStatus] = useState("未ログイン")
  
   
  return (
    <BrowserRouter>
        <Switch>
          <Route 
          exact path={"/home"} 
          render={props => (
              <Home { ...props } 
                loggedInStatus={loggedInStatus}                 
                />)} 
          />
          <Route exact path={"/dashboard"} component={Dashboard} />
        </Switch>

    </BrowserRouter>
  )
}

export default App