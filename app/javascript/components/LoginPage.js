import React from 'react'
import { useState } from 'react'
import axios from 'axios'


function LoginPage(props) {
    const [email, setEmail] = useState("")
    const [password, setPassword] = useState("")

    const handleSuccessfulAuthentication = (data) => {
        console.log("handleSuccessfulAuthentication");
        props.loginCheck();
        
        
        
    }

    const testLogin = (event) =>{
        var data = {
            user: {
                email: "test.user@test.com",
                password: "test",
            }
        }
        axios.post("/signup2", data , { withCredentials: true })
        .then(response => {
            if (response.data.status === 'created') {
            
                handleSuccessfulAuthentication(response.data)
            }
        }).catch(error => {
            console.log("registration error", error)
        })
        event.preventDefault();



    }
    

    const handleSubmit = (event) => {
        
        var data = {
            user: {
                email: email,
                password: password,
            }
            
        }
        axios.post("/signup2", data , { withCredentials: true })
        .then(response => {
            if (response.data.status === 'created') {
            
                handleSuccessfulAuthentication(response.data)
            }
        }).catch(error => {
            console.log("registration error", error)
        })
        event.preventDefault()
    }
    return(
        <div className="login-form-container">
                
               
                <h1>ログイン</h1>
            
                <div className="login-form">
                    <form onSubmit={handleSubmit}>
                    <label htmlFor="email">
                        Email:
                    </label>
                        <input
                            id="email"
                            className="form-control"
                            type="email"
                            name="email"
                            placeholder="メールアドレス"
                            value={email}
                            onChange={event => setEmail(event.target.value)} 
                        
                        />
                    
                        <label htmlFor="password">
                            Password:
                        </label>
                        <input
                            id="password"
                            className="form-control"
                            type="password"
                            name="password"
                            placeholder="パスワード"
                            value={password}
                            onChange={event => setPassword(event.target.value)}
                        />
                        <div className="btn-container">
                            <button type="submit" className="btn btn-primary">ログイン</button>
                        </div>
                        <div className="btn-container">
                          <button onClick={testLogin} className="test-login btn-primary">テストユーザーでログイン</button>
                        </div>
                
                        
                    </form>

                    
                </div>
                
                
                
        </div>


    )
}

export default LoginPage