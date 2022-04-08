import React from 'react'
import {useLayoutEffect} from 'react'
import LoginPage from './LoginPage'
import Dashboard from './Dashboard'



function Home(props) {

    

    return (
        <>
            {props.loggedInStatus? 
                <Dashboard loggedInStatus={props.loggedInStatus}/>
                : 
                <LoginPage 
                    loggedInStatus={props.loggedInStatus} 
                    loginCheck={props.loginCheck}/*logout={props.logout}*/
                />
            }
        </>
    )
}

export default Home