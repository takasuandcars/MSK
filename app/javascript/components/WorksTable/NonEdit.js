import React from 'react'


function NonEdit(props) {

    
return (
    <>
    <div className="tr td">{props.val.name}</div>
    <div className="tr td">{props.val.start}</div>
    <div className="tr td">{props.val.end}</div>
    <div className="tr td">{props.val.hours}</div>
    <div className="tr td function_row" onClick={()=>props.EditButton(props.index, props.val)}><a style={{cursor: 'pointer'}}>編集</a></div>
  
    </>

  )
}

export default NonEdit