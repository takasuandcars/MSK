import React from 'react'


function LoggedinNavBar(props) {

    
return (
    <>
    <header>
      <div className="title">
          <h1>
              <a href="/" >MSK</a>
          </h1>
          <div className="header-right">
              <div className="user-name">
               {props.userStatus.name}
              </div>
              <div className="logout">
                 <a onClick={props.logout}>ログアウト</a>
              </div>
          </div> 
      </div>
   
    </header>
  
    </>

  )
}

export default LoggedinNavBar