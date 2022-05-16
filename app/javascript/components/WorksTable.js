

import React, { useState, useEffect } from 'react'
import Edit from './WorksTable/Edit'
import NonEdit from './WorksTable/NonEdit'
import axios from 'axios'



function WorksTable(props) {
    const [workdatas, setWorkdatas] = useState([])
    const [newWorkdatas, setnewWorkdatas] = useState([])
    const [searchName, setSearchName] = useState('')
  
    useEffect(() => {
      axios.get('/api/v1/works.json')
      .then(resp => {
        console.log(resp.data)
        setWorkdatas(resp.data);
      })
      .catch(e => {
        console.log(e);
      })
    }, [])

    const SetNewDatas = (index, val)=> {
      var data = {
        index: index,
        start: val,
      }
      newWorkdatas.push(data);
      console.log(newWorkdatas)


    }
  
    const EditButton = (index, val) => {
      const newDatas = [...workdatas]
      console.log(index);
      console.log(newDatas)
      newDatas[index].edit = !val.edit
      setWorkdatas(newDatas);
    }
  
    const updateIsCompleted = (index, data) => {
     
      axios.patch(`/api/v1/works/${data.id}`, data)
      .then(resp => {
        console.log(resp);
        const newWorkdatas = [...workdatas]
        newWorkdatas[index].edit = false
        newWorkdatas[index].start = resp.data.start
        newWorkdatas[index].end = resp.data.end
        newWorkdatas[index].hours = resp.data.hours
        setWorkdatas(newWorkdatas)
        console.log(newWorkdatas)
      })
    }

    const CancelBtn = (index) =>{
      const newWorkdatas = [...workdatas]
      newWorkdatas[index].edit = false
      console.log(workdatas)
      setWorkdatas(newWorkdatas)
      console.log(newWorkdatas)
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
                      {val.edit?


                        <Edit index={key} val={val} SetNewDatas={SetNewDatas} updateIsCompleted={updateIsCompleted} CancelBtn={CancelBtn}/>
                         :
                        <NonEdit index={key} val={val} EditButton={EditButton}/> 
                      
                      }
                    </div>
                    
                    )}
                    )}
                    </div>
                </div>

        </>
    )
                    
}


export default WorksTable




