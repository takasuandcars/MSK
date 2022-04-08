import React from 'react'

import LoggedinNavBar from './LoggedinNavBar'




function NavBar(props) {



    return (
        <>
            
                {props.loggedInStatus? 
                <LoggedinNavBar userStatus={props.userStatus} logout={props.logout}/>
                : 
                <header></header>          
                 }
       </>

    )
}

export default NavBar