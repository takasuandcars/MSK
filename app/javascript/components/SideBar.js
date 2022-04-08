import React from 'react'
import LoggedinSideBar from './LoggedinSideBar'
function SideBar(props) {

    
return (
    <>
  
        {props.loggedInStatus? 

            <LoggedinSideBar/>
            :
            null

        } 
    </>

  )
}

export default SideBar