import React from 'react'
import {useEffect} from 'react'

function Dashboard(props) {

    const routerpath = () => {
        console.log(router.path)

    }

    //useEffect(() => {routerpath();})
    console.log(props)
    return (
        <div>
            <h1>Dashboard</h1>
            <h1>{console.log(props.loggedInStatus)}</h1>
        </div>
    )
}

export default Dashboard