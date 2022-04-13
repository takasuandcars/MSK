

import React, { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'
import axios from 'axios'
import styled from 'styled-components'
import { ImCheckboxChecked, ImCheckboxUnchecked } from 'react-icons/im'
import { AiFillEdit } from 'react-icons/ai'
import { Calendar } from '@fullcalendar/core'



function WorksTable(props) {
    const [workdatas, setWorkdatas] = useState([])
    const [searchName, setSearchName] = useState('')
  
    useEffect(() => {
      axios.get('/api/v1/works')
      .then(resp => {
        console.log(resp.data)
        setWorkdatas(resp.data);
      })
      .catch(e => {
        console.log(e);
      })
    }, [])
  
 
  
    const updateIsCompleted = (index, val) => {
      var data = {
        id: val.id,
        name : val.name,
        is_completed: !val.is_completed
      }
      axios.patch(`/api/v1/todos/${val.id}`, data)
      .then(resp => {
        const newTodos = [...todos]
        newTodos[index].is_completed = resp.data.is_completed
        setTodos(newTodos)
      })
    }
    

    return (
        <>
            <div className="page-title">
                <h1 className="title">勤怠データ</h1>
            </div>
                {/* <!--mok-start-show-->
                <div class="pagination-box">
                <%= paginate @datas%>
               
               </div> */}
                <div className="datas" >

                    <div className="table table_box">
                        <div className="tr_box tr_box_th">
                            <div className="tr th received_data_column">名前</div>
                            <div className="tr th awb-column">開始</div>
                            <div className="tr th invoice_column">終了</div>
                            <div className="tr th thnumber_column">作業時間</div>
                            <div className="tr th function_column">機能</div>
                        </div>
                    
                 

               
                
                    {workdatas.map((val, key) => {
                    return (
                    <div className="tr_box data_show tr_box_td" key={key}>
                        <div className="tr td">{val.name}</div>
                        <div className="tr td">{val.start}</div>
                        <div className="tr td">{val.end}</div>
                        <div className="tr td">{val.hours}</div>
                        <div className="tr td function_row">test</div>
                        {/* {val.is_completed ? (
                            <CheckedBox>
                            <ImCheckboxChecked onClick={() => updateIsCompleted(key, val) } />
                            </CheckedBox>
                        ) : (
                            <UncheckedBox>
                            <ImCheckboxUnchecked onClick={() => updateIsCompleted(key, val) } />
                            </UncheckedBox>
                        )} */}
                        {/* <TodoName is_completed={val.is_completed}>
                            {val.name}
                        </TodoName> */}
                        {/* <Link to={"/todos/" + val.id + "/edit"}>
                            <EditButton>
                            <AiFillEdit />
                            </EditButton>
                        </Link> */}
                    </div>
                    
                    )}
                    )}
                    </div>
                </div>

        </>
    )
                    
}


export default WorksTable




