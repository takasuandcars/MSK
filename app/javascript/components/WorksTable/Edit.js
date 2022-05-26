import React, { useState, useEffect } from 'react'



function Edit(props) {

    const[newStart, setNewStart] = useState(`${props.val.start}`)
    const[newEnd, setNewEnd] = useState(`${props.val.end}`)


    const SetNewStart = (val)=> {
        
        console.log(val)
       setNewStart(val);


    }
    const SetNewEnd = (val) => {
        setNewEnd(val);
    }
    const UpdateIsCompleted = (key,id) =>{
        var data = {
            id: id,
            start: newStart,
            end: newEnd

        }
        console.log(data);
        props.updateIsCompleted(key, data)

    }

    
return (
    <>
 

        <form className="form_with_css" onSubmit={null}>
            <div className="tr td name-row"><input type="text" placeholder={`${props.val.name}`} /></div>
            <div className="tr td start-row"><input type="datetime-local" onChange={event => SetNewStart(event.target.value)}/></div>
            <div className="tr td end_row"><input type="datetime-local" onChange={event => SetNewEnd(event.target.value)}/></div>
            <div className="tr td hours_row"><input type="text" placeholder={`${props.val.hours}`}/></div>
            <div className="tr td function_row">
                <span className="btn" onClick={()=>UpdateIsCompleted(props.index, props.val.id)}>保存</span>
                <span className="btn">削除</span>
                <span className="btn" onClick={() => props.CancelBtn(props.index)}>キャンセル</span>
            </div>

        </form>
       
    </>

  )
}

export default Edit